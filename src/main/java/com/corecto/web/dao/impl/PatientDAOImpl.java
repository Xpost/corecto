/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.dao.impl;



import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.corecto.web.dao.PatientDAO;
import com.corecto.web.model.dto.FilterDTO;
import com.corecto.web.model.dto.PacienteDTO;
import com.corecto.web.model.pojo.extra.CatOs;
import com.corecto.web.model.pojo.extra.Consulta;
import com.corecto.web.model.pojo.extra.Paciente;


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
public class PatientDAOImpl extends HibernateDaoSupport implements PatientDAO {

	Logger LOG = LoggerFactory.getLogger(PatientDAOImpl.class);
	 
	
    public Consulta loadConsultaByIdClient(long idPaciente) throws DataAccessException {
    	LOG.info("PatientDAOImpl.loadConsultaByIdClient()");
        List<Consulta> lstResult = getHibernateTemplate().find(
                "select C from Consulta as C where C.paciente.idpaciente='" + idPaciente + "'");
        
        
        if (lstResult.isEmpty()) {
            return null;
        } else
            return lstResult.get(0);
    }
	
    public long saveNewConsulta(Consulta  consulta) throws DataAccessException {
    	LOG.info("PatientDAOImpl.saveNewPatient()");
        getHibernateTemplate().save(consulta);
        return consulta.getIdconsulta();
    }
    
    
    public long saveNewPatient(Paciente  paciente) throws DataAccessException {
    	LOG.info("PatientDAOImpl.saveNewPatient()");
        getHibernateTemplate().save(paciente);
        return paciente.getIdpaciente();
    }
    
    
    public Long checkConsultByPatientId(Long  patientId) throws DataAccessException {
    	LOG.info("PatientDAOImpl.checkConsultByPatientId()");
        List<Long> lstResult = getHibernateTemplate().find("select C.idconsulta from Consulta as C where C.paciente.idpaciente='" + patientId + "'");
        if (lstResult.isEmpty()) {
            return null;
        } else
            return lstResult.get(0);
       }
    
    
    public List<PacienteDTO> getPatientsByParameters(final Date initialDate, final Long patientID, final String direction, final String fieldSort, final String sort) throws DataAccessException {

		
        List<PacienteDTO> listResult = new ArrayList<PacienteDTO>();
        HibernateCallback callback = new HibernateCallback() {

            public Object doInHibernate(Session session) throws HibernateException, SQLException {
            	
            	 String finalQuery="";

    	  		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
              	if (patientID!=null){
              		finalQuery = " and P.idpaciente="+patientID;
              	}          	
//    			if (initialDate!=null){
//    				finalQuery = finalQuery+" and V.inicia>='"+dateFormat.format(initialDate)+"'" ;
//    				}
    			if (!direction.isEmpty()){
    				finalQuery = finalQuery+" and P.domicilio like '%"+direction+"%'";					
              	}
    			if (!fieldSort.isEmpty()){
//    					if (sort.contains("asc")){
//    						criteria.addOrder(Order.asc(fieldSort));
//    					}						
//    					else{
//    						criteria.addOrder(Order.desc(fieldSort));
//    					}
    			}

    			
                Query query = session.createQuery(
                        "select new com.corecto.web.model.dto.PacienteDTO(P.idpaciente,O.idos,O.nombre,P.nombre,P.sexo,P.fechanac,P.domicilio,P.telefono,P.mail,P.nroOs,P.notas,P.dni) "
                                + " FROM Paciente as P, CatOs as O" + " WHERE P.catOs=O.idos "+finalQuery+" order by P.idpaciente");

                List result = query.list();
                return result;
            }
        };
 

listResult = (List<PacienteDTO>) this.getHibernateTemplate().execute(callback);
LOG.info("Cantidad:"+listResult.size());
return listResult;
}
    
    
    
    public List<Paciente> getPatientsByName(final String name, final String fieldSort, final String sort, final int maxResult) throws DataAccessException {

        List<Paciente> listResult = new ArrayList<Paciente>();
        HibernateCallback callback = new HibernateCallback() {

            public Object doInHibernate(Session session) throws HibernateException, SQLException {

            	String orderBy = "C.nombre";
            	if (!fieldSort.contentEquals("")){
            		orderBy = "C."+fieldSort;
            	}
                Query query = session.createQuery(
                        "select C "
                                + " FROM Paciente as C" + " WHERE LOWER(C.nombre) LIKE '%" + name.toLowerCase()
                                + "%' order by "+orderBy+" "+sort).setMaxResults(maxResult);

                List result = query.list();
                return result;

            }
        };

        listResult = (List<Paciente>) this.getHibernateTemplate().execute(callback);
        LOG.info("Cantidad:"+listResult.size());
        return listResult;
    }
    
    
    public List<Paciente> getPatientsByFilter(final FilterDTO filter) throws DataAccessException {

        List<Paciente> listResult = new ArrayList<Paciente>();
        HibernateCallback callback = new HibernateCallback() {

            public Object doInHibernate(Session session) throws HibernateException, SQLException {

            	String name = "";
            	String dni = "";
            	if(!filter.getNombre().isEmpty()){
            		name=" LOWER(C.nombre) LIKE '%"+filter.getNombre().toLowerCase()+"%' and";
            	}
            	if(!filter.getDni().isEmpty()){
            		dni=" C.dni LIKE '"+filter.getDni()+"%' and";
            	}
            	
            	String orderBy = "C.nombre";
                Query query = session.createQuery(
                        "select C "
                                + " FROM Paciente as C" + " WHERE"+name+dni
                                + " C.idpaciente is not null order by "+orderBy);

                List result = query.list();
                return result;

            }
        };

        listResult = (List<Paciente>) this.getHibernateTemplate().execute(callback);
        LOG.info("Cantidad:"+listResult.size());
        return listResult;
    }
    
    
/*


    
    
    public List<Cliente> getClientsByParameters(final String name,final String lastName, final String cuit, final String score,final String fieldSort, final String sort) throws DataAccessException {

        List<Cliente> listResult = new ArrayList<Cliente>();
        HibernateCallback callback = new HibernateCallback() {

            public Object doInHibernate(Session session) throws HibernateException, SQLException {

            	Criteria criteria = session.createCriteria(Cliente.class);
            	if (name!=null){
            		criteria.add( Restrictions.like("nombre", name+"%") );
            	}          	
				if (lastName!=null){
            		criteria.add( Restrictions.like("apellido", lastName+"%") );
            	}
				if (cuit!=null){
            		criteria.add( Restrictions.eq( "cuit", cuit ));
            	}
				if (score!=null){
            		criteria.add( Restrictions.eq( "puntuacion", new Integer(score) ));
            	}

				if (!fieldSort.isEmpty()){
					if (sort.contains("asc")){
						criteria.addOrder(Order.asc(fieldSort));
					}						
					else{
						criteria.addOrder(Order.desc(fieldSort));
					}
				}
				return criteria.list();
            }
        };

        listResult = (List<Cliente>) this.getHibernateTemplate().execute(callback);
        LOG.info("Cantidad:"+listResult.size());
        return listResult;
    }


    @SuppressWarnings("unchecked")
    public Cliente loadClientByName(final String name) throws DataAccessException {

        List<Cliente> lstCliente = getHibernateTemplate().find(
                "select C from Cliente as C where C.nombre='" + name + "'");

        if (lstCliente.isEmpty()) {
            return null;
        } else
            return lstCliente.get(0);
    }
    
    
    @SuppressWarnings("unchecked")
    public Cliente loadClientById(final Integer idClient) throws DataAccessException {

        List<Cliente> lstCliente = getHibernateTemplate().find(
                "select C from Cliente as C where C.idcliente=" + idClient);

        if (lstCliente.isEmpty()) {
            return null;
        } else
            return lstCliente.get(0);
    }
    
    @SuppressWarnings("unchecked")
    public EstadoCli loadEstadoClientById(final Integer idEstadoClient) throws DataAccessException {

        List<EstadoCli> lstCliente = getHibernateTemplate().find(
                "select C from EstadoCli as C where C.idestadocli=" + idEstadoClient);

        if (lstCliente.isEmpty()) {
            return null;
        } else
            return lstCliente.get(0);
    }
    
    @SuppressWarnings("unchecked")
    public Localidad loadLocalidadById(final Integer idLocalidad) throws DataAccessException {

        List<Localidad> lstResults = getHibernateTemplate().find(
                "select C from Localidad as C where C.idlocalidad=" + idLocalidad);

        if (lstResults.isEmpty()) {
            return null;
        } else
            return lstResults.get(0);
    }
    
    @SuppressWarnings("unchecked")
    public List<Localidad> loadAllLocalidades() throws DataAccessException {

        List<Localidad> lstResults = getHibernateTemplate().find(
                "select C from Localidad as C");

        if (lstResults.isEmpty()) {
            return null;
        } else
            return lstResults;
    }
    @SuppressWarnings("unchecked")
    public List<CatDnitipo> loadAllTypeDni() throws DataAccessException {

        List<CatDnitipo> lstResults = getHibernateTemplate().find(
                "select T from CatDnitipo as T");

        if (lstResults.isEmpty()) {
            return null;
        } else
            return lstResults;
    }

    @SuppressWarnings("unchecked")
    public List<EstadoCli> loadAllClientState() throws DataAccessException {

        List<EstadoCli> lstResults = getHibernateTemplate().find(
                "select E from EstadoCli as E");

        if (lstResults.isEmpty()) {
            return null;
        } else
            return lstResults;
    }
    
    @SuppressWarnings("unchecked")
    public Integer loadLastClientId() throws DataAccessException {

        List<Integer> lstCliente = getHibernateTemplate().find(
                "select max(idcliente) FROM Cliente");

        if (lstCliente.isEmpty()) {
            return null;
        } else
            return lstCliente.get(0);
    }
    
    @SuppressWarnings("unchecked")
    public String loadLastClientNum() throws DataAccessException {

    	 List<Cliente> listResult =null;
    	 
    	HibernateCallback callback = new HibernateCallback() {

               public Object doInHibernate(Session session) throws HibernateException, SQLException {

            	DetachedCriteria maxId = DetachedCriteria.forClass(Cliente.class)
            			    .setProjection( Projections.max("idcliente") );
               	Criteria criteria = session.createCriteria(Cliente.class).add( Property.forName("idcliente").eq(maxId));
               		   
               return criteria.list();
               }
           };

           listResult = (List<Cliente>) this.getHibernateTemplate().execute(callback);
           
           return listResult.get(0).getNumerocli();
    }
    
    
*/

	
    @SuppressWarnings("unchecked")
	public List<CatOs> loadAllCatOS() throws DataAccessException {
		List<CatOs> lstResults = getHibernateTemplate().find(
                "select E from CatOs as E");

        if (lstResults.isEmpty()) {
            return null;
        } else
            return lstResults;
	} 
	
    public void deletePatient(Paciente paciente) throws DataAccessException {
    	LOG.info("deletePatient()");
        getHibernateTemplate().delete(paciente);
    }
}
