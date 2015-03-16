/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.corecto.web.dao.PreconsultaDAO;
import com.corecto.web.model.pojo.extra.Preconsulta;

/**
 * TODO comment<br>
 * <br>
 * <b>Change log:</b>
 * <ul>
 * <li>1.0 20/02/2013 - Xpost - initial version</li>
 * </ul>
 * 
 * @author Xpost
 * @version 1.0
 */
public class PreconsultaDAOImpl extends HibernateDaoSupport implements PreconsultaDAO {

	Logger LOG = LoggerFactory.getLogger(PreconsultaDAOImpl.class);

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.corecto.web.dao.impl.PreconsultaDAO#saveNewPreconsulta(com.corecto
	 * .web.model.pojo.extra.Preconsulta)
	 */

	public long saveNewPreconsulta(Preconsulta preconsulta) throws DataAccessException {
		LOG.info("PreconsultaDAOImpl.saveNewPatient()");
		getHibernateTemplate().save(preconsulta);
		return preconsulta.getIdpreconsulta();
	}

	public long updatePreconsulta(Preconsulta preconsulta) throws DataAccessException {
		LOG.info("PreconsultaDAOImpl.updatePreconsulta()");
		getHibernateTemplate().update(preconsulta);
		return preconsulta.getIdpreconsulta();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.corecto.web.dao.impl.PreconsultaDAO#loadPreconsultaById(java.lang
	 * .Long)
	 */

	@SuppressWarnings("unchecked")
	public Preconsulta loadPreconsultaById(final Long idpreconsulta) throws DataAccessException {

		List<Preconsulta> listResult = getHibernateTemplate().find(
				"select C from Preconsulta as C where C.idpreconsulta=" + idpreconsulta);

		if (listResult.isEmpty()) {
			return null;
		} else
			return listResult.get(0);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.corecto.web.dao.impl.PreconsultaDAO#loadPreconsultaByConsulta(java
	 * .lang.Long)
	 */

	@SuppressWarnings("unchecked")
	public Preconsulta loadPreconsultaByConsulta(final Long idconsulta) throws DataAccessException {

		List<Preconsulta> listResult = new ArrayList<Preconsulta>();
		HibernateCallback callback = new HibernateCallback() {

			public Object doInHibernate(Session session) throws HibernateException, SQLException {

				Query query = session.createQuery("select P " + " FROM Preconsulta as P, Consulta as C "
						+ " WHERE P.consulta=C.idconsulta and C.idconsulta=" + idconsulta);

				List result = query.list();
				return result;

			}
		};

		listResult = (List<Preconsulta>) this.getHibernateTemplate().execute(callback);
		LOG.info("Cantidad:" + listResult.size());
		return listResult.get(0);
	}

	/*
	 * 
	 * 
	 * 
	 * public List<Cliente> getClientsByParameters(final String name,final
	 * String lastName, final String cuit, final String score,final String
	 * fieldSort, final String sort) throws DataAccessException {
	 * 
	 * List<Cliente> listResult = new ArrayList<Cliente>(); HibernateCallback
	 * callback = new HibernateCallback() {
	 * 
	 * public Object doInHibernate(Session session) throws HibernateException,
	 * SQLException {
	 * 
	 * Criteria criteria = session.createCriteria(Cliente.class); if
	 * (name!=null){ criteria.add( Restrictions.like("nombre", name+"%") ); } if
	 * (lastName!=null){ criteria.add( Restrictions.like("apellido",
	 * lastName+"%") ); } if (cuit!=null){ criteria.add( Restrictions.eq(
	 * "cuit", cuit )); } if (score!=null){ criteria.add( Restrictions.eq(
	 * "puntuacion", new Integer(score) )); }
	 * 
	 * if (!fieldSort.isEmpty()){ if (sort.contains("asc")){
	 * criteria.addOrder(Order.asc(fieldSort)); } else{
	 * criteria.addOrder(Order.desc(fieldSort)); } } return criteria.list(); }
	 * };
	 * 
	 * listResult = (List<Cliente>)
	 * this.getHibernateTemplate().execute(callback);
	 * LOG.info("Cantidad:"+listResult.size()); return listResult; }
	 * 
	 * @SuppressWarnings("unchecked") public List<EstadoCli>
	 * loadAllClientState() throws DataAccessException {
	 * 
	 * List<EstadoCli> lstResults = getHibernateTemplate().find(
	 * "select E from EstadoCli as E");
	 * 
	 * if (lstResults.isEmpty()) { return null; } else return lstResults; }
	 * 
	 * @SuppressWarnings("unchecked") public Integer loadLastClientId() throws
	 * DataAccessException {
	 * 
	 * List<Integer> lstCliente = getHibernateTemplate().find(
	 * "select max(idcliente) FROM Cliente");
	 * 
	 * if (lstCliente.isEmpty()) { return null; } else return lstCliente.get(0);
	 * }
	 * 
	 * 
	 * 
	 * 
	 * public void deleteClient(Cliente cliente) throws DataAccessException {
	 * LOG.info("deleteClient()"); getHibernateTemplate().delete(cliente); }
	 */

}
