/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.util.CollectionUtils;

import com.corecto.web.dao.PatientDAO;
import com.corecto.web.model.dto.FilterDTO;
import com.corecto.web.model.dto.PacienteDTO;
import com.corecto.web.model.pojo.extra.CatOs;
import com.corecto.web.model.pojo.extra.Consulta;
import com.corecto.web.model.pojo.extra.Paciente;
import com.google.common.base.Joiner;
import com.google.common.collect.Lists;

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
		List<Consulta> lstResult = (List<Consulta>) getHibernateTemplate().find(
				"select C from Consulta as C where C.paciente.idpaciente='" + idPaciente + "'");

		if (lstResult.isEmpty()) {
			return null;
		} else
			return lstResult.get(0);
	}

	public long saveNewConsulta(Consulta consulta) throws DataAccessException {
		LOG.info("PatientDAOImpl.saveNewPatient()");
		getHibernateTemplate().save(consulta);
		return consulta.getIdconsulta();
	}

	public long saveNewPatient(Paciente paciente) throws DataAccessException {
		LOG.info("PatientDAOImpl.saveNewPatient()");
		getHibernateTemplate().save(paciente);
		return paciente.getIdpaciente();
	}

	public Long checkConsultByPatientId(Long patientId) throws DataAccessException {
		LOG.info("PatientDAOImpl.checkConsultByPatientId()");
		List<Long> lstResult = (List<Long>) getHibernateTemplate().find(
				"select C.idconsulta from Consulta as C where C.paciente.idpaciente='" + patientId + "'");
		if (lstResult.isEmpty()) {
			return null;
		} else
			return lstResult.get(0);
	}

	public List<PacienteDTO> getPatientsByParameters(final Long patientID, final String direction)
			throws DataAccessException {

		List<PacienteDTO> listResult = new ArrayList<PacienteDTO>();
		HibernateCallback callback = new HibernateCallback() {

			public Object doInHibernate(Session session) throws HibernateException {

				String finalQuery = "";

				if (patientID != null) {
					finalQuery = " and P.idpaciente=" + patientID;
				}
				if (!direction.isEmpty()) {
					finalQuery = finalQuery + " and P.domicilio like '%" + direction + "%'";
				}

				Query query = session
						.createQuery("select new com.corecto.web.model.dto.PacienteDTO(P.idpaciente,O.idos,O.nombre,P.nombre,P.sexo,P.fechanac,P.direccion,P.localidad,P.telefono,P.mail,P.nroOs,P.notas,P.dni) "
								+ " FROM Paciente as P, CatOs as O"
								+ " WHERE P.catOs=O.idos "
								+ finalQuery
								+ " order by P.idpaciente");

				List result = query.list();
				return result;
			}
		};

		listResult = (List<PacienteDTO>) this.getHibernateTemplate().execute(callback);
		LOG.info("Cantidad:" + listResult.size());
		return listResult;
	}

	public List<Paciente> getPatientsByName(final String name, final String fieldSort, final String sort,
			final int maxResult) throws DataAccessException {

		List<Paciente> listResult = new ArrayList<Paciente>();
		HibernateCallback callback = new HibernateCallback() {

			public Object doInHibernate(Session session) throws HibernateException {

				String orderBy = "C.nombre";
				if (!fieldSort.contentEquals("")) {
					orderBy = "C." + fieldSort;
				}
				Query query = session.createQuery(
						"select C " + " FROM Paciente as C" + " WHERE LOWER(C.nombre) LIKE '%"
								+ name.toLowerCase() + "%' order by " + orderBy + " " + sort).setMaxResults(
						maxResult);

				List result = query.list();
				return result;

			}
		};

		listResult = (List<Paciente>) this.getHibernateTemplate().execute(callback);
		LOG.info("Cantidad:" + listResult.size());
		return listResult;
	}

	public List<PacienteDTO> getPatientConsultById(final Long patientID) throws DataAccessException {

		List<PacienteDTO> listResult = new ArrayList<PacienteDTO>();
		HibernateCallback callback = new HibernateCallback() {

			public Object doInHibernate(Session session) throws HibernateException {

				String finalQuery = " and P.idpaciente=" + patientID
						+ " and P.idpaciente = C.paciente.idpaciente";

				// @formatter:off
				Query query = session
						.createQuery("select new com.corecto.web.model.dto.ConsultaPacienteDTO(" +
								"P.idpaciente,O.idos,O.nombre,P.nombre,P.sexo,P.fechanac,P.direccion,P.localidad,P.telefono,P.mail,P.nroOs,P.notas,P.dni) "
								+ " FROM Paciente as P, CatOs as O"
								+ " WHERE P.catOs=O.idos "
								+ finalQuery
								+ " order by P.idpaciente");
				// @formatter:on
				List result = query.list();
				return result;
			}
		};

		listResult = (List<PacienteDTO>) this.getHibernateTemplate().execute(callback);
		LOG.info("Cantidad:" + listResult.size());
		return listResult;
	}

	@SuppressWarnings("unchecked")
	public List<Paciente> getPatientsByFilter(final FilterDTO filter) throws DataAccessException {

		List<Paciente> listResult = new ArrayList<Paciente>();
		HibernateCallback<Object> callback = new HibernateCallback<Object>() {

			public Object doInHibernate(Session session) throws HibernateException {

				StringBuilder queryPatient = new StringBuilder();

				if (StringUtils.isNotBlank(filter.getNombre())) {
					String nombreQ = " and P.nombre like '%" + filter.getNombre() + "%'";
					queryPatient.append(nombreQ);
				}
				if (StringUtils.isNotBlank(filter.getDni())) {
					String dniQ = " and P.dni  like '" + filter.getDni() + "%'";
					queryPatient.append(dniQ);
				}
				if (StringUtils.isNotBlank(filter.getSexo())) {
					String sexoQ = " and P.sexo = '" + filter.getSexo() + "'";
					queryPatient.append(sexoQ);
				}
				// motivo
				StringBuilder queryMotivos = new StringBuilder();
				if (StringUtils.isNotBlank(filter.getConsultaMotivos())) {
					String motivosQ = " and Mo.motivo like '%" + filter.getConsultaMotivos() + "%'";
					queryMotivos.append(motivosQ);
				}
				if (StringUtils.isNotBlank(filter.getConsultaMotivoOtro())) {
					String motivoOtroQ = " and Mo.motivoOtro like '%" + filter.getConsultaMotivoOtro() + "%'";
					queryMotivos.append(motivoOtroQ);
				}
				if (StringUtils.isNotBlank(filter.getFechaInSintoma())) {
					String fechaIniQ = " and Mo.fechaInicio = '" + filter.getFechaInSintoma() + "'";
					queryMotivos.append(fechaIniQ);
				}
				if (StringUtils.isNotBlank(filter.getMotivoEvoMeses())) {
					String evoMesesQ = " and Mo.evoMeses = '" + filter.getMotivoEvoMeses() + "'";
					queryMotivos.append(evoMesesQ);
				}
				StringBuilder otherTables = new StringBuilder();
				StringBuilder otherTablesJoin = new StringBuilder();
				if (queryMotivos.length() > 0) {
					otherTables.append(", Motivo Mo");
					otherTablesJoin.append(" and Mo.consulta.idconsulta = C.idconsulta");
				}
				// antecedentes
				StringBuilder queryAntecedentes = new StringBuilder();
				if (StringUtils.isNotBlank(filter.getPatologicoNinguno())) {
					String patologicoNingunoQ = " and An.patologicoNinguno = "
							+ filter.getPatologicoNinguno();
					queryAntecedentes.append(patologicoNingunoQ);
				}
				if (StringUtils.isNotBlank(filter.getPatologicoAdenoma())) {
					String patologicoNingunoQ = " and An.patologicoAdenoma = "
							+ filter.getPatologicoAdenoma();
					queryAntecedentes.append(patologicoNingunoQ);
				}
				if (StringUtils.isNotBlank(filter.getPatologicoColitis())) {
					String patologicoNingunoQ = " and An.patologicoColitis = "
							+ filter.getPatologicoColitis();
					queryAntecedentes.append(patologicoNingunoQ);
				}
				if (StringUtils.isNotBlank(filter.getPatologicoCrohn())) {
					String patologicoNingunoQ = " and An.patologicoCrohn = " + filter.getPatologicoCrohn();
					queryAntecedentes.append(patologicoNingunoQ);
				}
				if (StringUtils.isNotBlank(filter.getPatologicoHiv())) {
					String patologicoNingunoQ = " and An.patologicoHiv = " + filter.getPatologicoHiv();
					queryAntecedentes.append(patologicoNingunoQ);
				}
				if (StringUtils.isNotBlank(filter.getPatologicoNeoplasia())) {
					String patologicoNingunoQ = " and An.patologicoNeoplasia = "
							+ filter.getPatologicoNeoplasia();
					queryAntecedentes.append(patologicoNingunoQ);
				}
				if (StringUtils.isNotBlank(filter.getNeoplasia())) {
					String neoplasiaQ = " and An.neoplasia like '" + filter.getNeoplasia() + "%'";
					queryAntecedentes.append(neoplasiaQ);
				}
				if (StringUtils.isNotBlank(filter.getFamiliarCancer())) {
					String familarAQ = "";
					String[] familiaCancerTypes = filter.getFamiliarCancer().split("-");
					for (int i = 1; i < familiaCancerTypes.length; i++) {
						familarAQ += "-" + familiaCancerTypes[i];
					}
					familarAQ = " and An.familiarCancer like '%" + familarAQ + "%'";
					queryAntecedentes.append(familarAQ);
				}
				if (!CollectionUtils.isEmpty(filter.getTipoCcrh())) {
					String antCcrhQ = " and An.tipoCcrh in (" + Joiner.on(",").join(filter.getTipoCcrh())
							+ ")";
					queryAntecedentes.append(antCcrhQ);
				}
				if (StringUtils.isNotBlank(filter.getAntecedentesCcrh())) {
					String antecedentesCcrh = " and An.antecedentesCcrh like '%"
							+ filter.getAntecedentesCcrh() + "%'";
					queryAntecedentes.append(antecedentesCcrh);
				}
				if (queryAntecedentes.length() > 0) {
					otherTables.append(", Antecedentes An");
					otherTablesJoin.append(" and An.consulta.idconsulta = C.idconsulta");
				}
				// eva clínica
				StringBuilder queryEvaClinica = new StringBuilder();
				if (StringUtils.isNotBlank(filter.getEvaRecto())) {
					String evaRectoQ = " and Ec.recto like '%" + filter.getEvaRecto() + "%'";
					queryEvaClinica.append(evaRectoQ);
				}
				if (queryEvaClinica.length() > 0) {
					otherTables.append(", EvaClinica Ec");
					otherTablesJoin.append(" and Ec.consulta.idconsulta = C.idconsulta");
				}
				// preconsulta
				StringBuilder queryPreconsulta = new StringBuilder();
				if (StringUtils.isNotBlank(filter.getPeso())) {
					String pesoQ = " and Pe.peso = " + filter.getPeso();
					queryPreconsulta.append(pesoQ);
				}
				if (StringUtils.isNotBlank(filter.getTalla())) {
					String tallaQ = " and Pe.talla = " + filter.getTalla();
					queryPreconsulta.append(tallaQ);
				}
				if (StringUtils.isNotBlank(filter.getSuperficie())) {
					String superficieQ = " and Pe.supcorporal like '%" + filter.getSuperficie() + "%'";
					queryPreconsulta.append(superficieQ);
				}
				if (StringUtils.isNotBlank(filter.getPerformance())) {
					String performanceQ = " and Pe.performanceStatus =  '" + filter.getPerformance() + "'";
					queryPreconsulta.append(performanceQ);
				}
				if (queryPreconsulta.length() > 0) {
					otherTables.append(", Preconsulta Pe");
					otherTablesJoin.append(" and Pe.consulta.idconsulta = C.idconsulta");
				}
				// Examen Proctologico
				StringBuilder queryExaProcto = new StringBuilder();
				if (StringUtils.isNotBlank(filter.getMovilRectal())
						|| StringUtils.isNotBlank(filter.getFijoRectal())) {
					String tactoQ = " and ExPro.tactoRectal like '"
							+ StringUtils.defaultString(filter.getMovilRectal(), "%") + "//"
							+ StringUtils.defaultString(filter.getFijoRectal(), "%") + "'";
					queryExaProcto.append(tactoQ);
				}
				if (StringUtils.isNotBlank(filter.getEsfinterRectal())) {
					String infilTraQ = " and ExPro.tactoRectalInfiltra = '" + filter.getEsfinterRectal()
							+ "'";
					queryExaProcto.append(infilTraQ);
				}
				if (!CollectionUtils.isEmpty(filter.getEe())) {
					String eeQ = " and ExPro.ee in (" + Joiner.on(",").join(filter.getEe()) + ")";
					queryExaProcto.append(eeQ);
				}
				if (!CollectionUtils.isEmpty(filter.getEeTipo())) {
					String eeTipoQ = " and ExPro.eeTipo in (" + Joiner.on(",").join(filter.getEeTipo()) + ")";
					queryExaProcto.append(eeTipoQ);
				}
				if (!CollectionUtils.isEmpty(filter.getEeTipoN())) {
					String eeTipoNQ = " and ExPro.eeTipoN in (" + Joiner.on(",").join(filter.getEeTipoN())
							+ ")";
					queryExaProcto.append(eeTipoNQ);
				}
				if (!CollectionUtils.isEmpty(filter.getEeInfiltra())) {
					String eeInfiltraQ = " and ExPro.eeInfiltra in ("
							+ Joiner.on(",").join(filter.getEeInfiltra()) + ")";
					queryExaProcto.append(eeInfiltraQ);
				}
				if (!CollectionUtils.isEmpty(filter.getEeInfiltraMedida())) {
					String eeInfiltraMedidaQ = " and ExPro.eeInfiltraMedida in ("
							+ Joiner.on(",").join(filter.getEeInfiltraMedida()) + ")";
					queryExaProcto.append(eeInfiltraMedidaQ);
				}
				if (StringUtils.isNotBlank(filter.getEeFecha())) {
					String fechaeeQ = " and ExPro.eeFecha = '" + filter.getEeFecha() + "'";
					queryExaProcto.append(fechaeeQ);
				}
				if (queryExaProcto.length() > 0) {
					otherTables.append(", ExaProcto ExPro");
					otherTablesJoin.append(" and ExPro.consulta.idconsulta = C.idconsulta");
				}
				// estadificacion
				StringBuilder queryEstadificacion = new StringBuilder();
				if (StringUtils.isNotBlank(filter.getRmCentro())) {
					String rmCentroQ = " and Estad.rmCentro like '%" + filter.getRmCentro() + "'";
					queryEstadificacion.append(rmCentroQ);
				}
				if (StringUtils.isNotBlank(filter.getRmFecha())) {
					String getRmFechaQ = " and Estad.rmFecha = '" + filter.getRmFecha() + "'";
					queryEstadificacion.append(getRmFechaQ);
				}
				if (StringUtils.isNotBlank(filter.getRmDistEsfinter())) {
					String rmDistEsfinterQ = " and Estad.rmDistEsfinter like '%" + filter.getRmDistEsfinter()
							+ "'";
					queryEstadificacion.append(rmDistEsfinterQ);
				}
				if (!CollectionUtils.isEmpty(filter.getRmDistAnal())) {
					String rmDistAnalQ = " and Estad.rmDistAnal in ("
							+ Joiner.on(",").join(filter.getRmDistAnal()) + ")";
					queryEstadificacion.append(rmDistAnalQ);
				}
				if (StringUtils.isNotBlank(filter.getRmAltura())) {
					String rmAlturaQ = " and Estad.rmAltura like '%" + filter.getRmAltura() + "'";
					queryEstadificacion.append(rmAlturaQ);
				}
				if (!CollectionUtils.isEmpty(filter.getRmTumor())) {
					String rmTumorQ = " and Estad.rmTumor in (" + Joiner.on(",").join(filter.getRmTumor())
							+ ")";
					queryEstadificacion.append(rmTumorQ);
				}
				if (!CollectionUtils.isEmpty(filter.getRmTumorN())) {
					String rmTumorNQ = " and Estad.rmTumorN in (" + Joiner.on(",").join(filter.getRmTumorN())
							+ ")";
					queryEstadificacion.append(rmTumorNQ);
				}

				if (!CollectionUtils.isEmpty(filter.getCrm())) {
					String rmTumorNQ = " and Estad.crm in (" + Joiner.on(",").join(filter.getCrm()) + ")";
					queryEstadificacion.append(rmTumorNQ);
				}
				if (!CollectionUtils.isEmpty(filter.getEmvi())) {
					String rmTumorNQ = " and Estad.emvi in (" + Joiner.on(",").join(filter.getEmvi()) + ")";
					queryEstadificacion.append(rmTumorNQ);
				}
				if (!CollectionUtils.isEmpty(filter.getDepSatelites())) {
					String rmTumorNQ = " and Estad.depSatelites in ("
							+ Joiner.on(",").join(filter.getDepSatelites()) + ")";
					queryEstadificacion.append(rmTumorNQ);
				}

				if (!CollectionUtils.isEmpty(filter.getTumoRectoInferior())) {
					String rmTumorNQ = " and Estad.tumoRectoInferior in ("
							+ Joiner.on(",").join(filter.getTumoRectoInferior()) + ")";
					queryEstadificacion.append(rmTumorNQ);
				}
				if (!CollectionUtils.isEmpty(filter.getGanglios())) {
					String rmTumorNQ = " and Estad.ganglios in (" + Joiner.on(",").join(filter.getGanglios())
							+ ")";
					queryEstadificacion.append(rmTumorNQ);
				}
				if (!CollectionUtils.isEmpty(filter.getGangliosLate())) {
					String rmTumorNQ = " and Estad.gangliosLate in ("
							+ Joiner.on(",").join(filter.getGangliosLate()) + ")";
					queryEstadificacion.append(rmTumorNQ);
				}
				if (!CollectionUtils.isEmpty(filter.getInfiltraEsfinter())) {
					String rmTumorNQ = " and Estad.infiltraEsfinter in ("
							+ Joiner.on(",").join(filter.getInfiltraEsfinter()) + ")";
					queryEstadificacion.append(rmTumorNQ);
				}
				if (!CollectionUtils.isEmpty(filter.getTcTorax())) {
					String rmTumorNQ = " and Estad.tcTorax in (" + Joiner.on(",").join(filter.getTcTorax())
							+ ")";
					queryEstadificacion.append(rmTumorNQ);
				}
				if (!CollectionUtils.isEmpty(filter.getTcAbd())) {
					String rmTumorNQ = " and Estad.tcAbd in (" + Joiner.on(",").join(filter.getTcAbd()) + ")";
					queryEstadificacion.append(rmTumorNQ);
				}
				if (!CollectionUtils.isEmpty(filter.getPetCt())) {
					String rmTumorNQ = " and Estad.petCt in (" + Joiner.on(",").join(filter.getPetCt()) + ")";
					queryEstadificacion.append(rmTumorNQ);
				}
				if (!CollectionUtils.isEmpty(filter.getMts())) {
					String rmTumorNQ = " and Estad.mts in (" + Joiner.on(",").join(filter.getMts()) + ")";
					queryEstadificacion.append(rmTumorNQ);
				}
				if (StringUtils.isNotBlank(filter.getSuv())) {
					String superficieQ = " and Estad.suv like '%" + filter.getSuv() + "%'";
					queryEstadificacion.append(superficieQ);
				}
				if (StringUtils.isNotBlank(filter.getMarTumFecha())) {
					String superficieQ = " and Estad.marTumFecha =  '" + filter.getMarTumFecha() + "'";
					queryEstadificacion.append(superficieQ);
				}
				if (!CollectionUtils.isEmpty(filter.getCeaAumentado())) {
					String rmTumorNQ = " and Estad.ceaAumentado in ("
							+ Joiner.on(",").join(filter.getCeaAumentado()) + ")";
					queryEstadificacion.append(rmTumorNQ);
				}
				if (!CollectionUtils.isEmpty(filter.getCa19())) {
					String rmTumorNQ = " and Estad.ca19 in (" + Joiner.on(",").join(filter.getCa19()) + ")";
					queryEstadificacion.append(rmTumorNQ);
				}
				if (StringUtils.isNotBlank(filter.getTnmT())) {
					String superficieQ = " and Estad.tnmT like '%" + filter.getTnmT() + "%'";
					queryEstadificacion.append(superficieQ);
				}
				if (StringUtils.isNotBlank(filter.getTnmN())) {
					String superficieQ = " and Estad.tnmN like '%" + filter.getTnmN() + "%'";
					queryEstadificacion.append(superficieQ);
				}
				if (StringUtils.isNotBlank(filter.getTnmM())) {
					String superficieQ = " and Estad.tnmM like '%" + filter.getTnmM() + "%'";
					queryEstadificacion.append(superficieQ);
				}
				if (StringUtils.isNotBlank(filter.getTnmPt())) {
					String superficieQ = " and Estad.tnmPt like '%" + filter.getTnmPt() + "%'";
					queryEstadificacion.append(superficieQ);
				}
				if (StringUtils.isNotBlank(filter.getTnmPn())) {
					String superficieQ = " and Estad.tnmPn like '%" + filter.getTnmPn() + "%'";
					queryEstadificacion.append(superficieQ);
				}
				if (StringUtils.isNotBlank(filter.getTnmPm())) {
					String superficieQ = " and Estad.tnmPm like '%" + filter.getTnmPm() + "%'";
					queryEstadificacion.append(superficieQ);
				}
				if (StringUtils.isNotBlank(filter.getMetastasis())) {
					String superficieQ = " and Estad.metastasis like '%" + filter.getMetastasis() + "%'";
					queryEstadificacion.append(superficieQ);
				}
				if (StringUtils.isNotBlank(filter.getMetastasisOtra())) {
					String superficieQ = " and Estad.metastasisOtra like '%" + filter.getMetastasisOtra()
							+ "%'";
					queryEstadificacion.append(superficieQ);
				}
				if (StringUtils.isNotBlank(filter.getRevRmFecha())) {
					String superficieQ = " and Estad.revRmFecha =  '" + filter.getRevRmFecha() + "'";
					queryEstadificacion.append(superficieQ);
				}
				if (StringUtils.isNotBlank(filter.getRevDistanEsfinter())) {
					String superficieQ = " and Estad.revDistanEsfinter like '%"
							+ filter.getRevDistanEsfinter() + "%'";
					queryEstadificacion.append(superficieQ);
				}
				if (!CollectionUtils.isEmpty(filter.getRevDistanAnal())) {
					String rmTumorNQ = " and Estad.revDistanAnal in ("
							+ Joiner.on(",").join(filter.getRevDistanAnal()) + ")";
					queryEstadificacion.append(rmTumorNQ);
				}
				if (StringUtils.isNotBlank(filter.getRevAltura())) {
					String superficieQ = " and Estad.revAltura like '%" + filter.getRevAltura() + "%'";
					queryPreconsulta.append(superficieQ);
				}
				if (queryEstadificacion.length() > 0) {
					otherTables.append(", Estadificacion Estad");
					otherTablesJoin.append(" and Estad.consulta.idconsulta = C.idconsulta");
				}
				// anatomia patologica
				StringBuilder queryAnaPatologica = new StringBuilder();
				if (!CollectionUtils.isEmpty(filter.getGradoDif())) {
					String getGradoDifQ = " and Apat.gradoDif in ("
							+ Joiner.on(",").join(filter.getGradoDif()) + ")";
					queryAnaPatologica.append(getGradoDifQ);
				}
				if (queryAnaPatologica.length() > 0) {
					otherTables.append(", AnatomiaPatologica Apat");
					otherTablesJoin.append(" and Apat.consulta.idconsulta = C.idconsulta");
				}
				// tratamiento
				StringBuilder queryTratamiento = new StringBuilder();
				if (StringUtils.isNotBlank(filter.getUdaOndoRadio())
						|| StringUtils.isNotBlank(filter.getUdaOndoOtro())) {
					String udaondoQ = " and Trat.udaondo  like '"
							+ StringUtils.defaultString(filter.getUdaOndoRadio(), "%") + "//%"
							+ StringUtils.defaultString(filter.getUdaOndoOtro(), "%") + "'";
					queryTratamiento.append(udaondoQ);
				}
				if (!CollectionUtils.isEmpty(filter.getCirugia())) {
					String cirugiaQ = " and Trat.cirugia in (" + Joiner.on(",").join(filter.getCirugia())
							+ ")";
					queryTratamiento.append(cirugiaQ);
				}
				if (!CollectionUtils.isEmpty(filter.getQuimioterapiaInduc())) {
					List<String> quimioterapiaInducList = Lists.newArrayList();
					String quimioInducOtra = filter.getQuimioterapiaInducOtra();
					for (Integer quimioTerInd : filter.getQuimioterapiaInduc()) {
						quimioterapiaInducList.add("Trat.quimioterapiaInduc ='" + quimioTerInd + "//"
								+ quimioInducOtra + "'");
					}
					String quimioterapiaInducQ = " and (" + Joiner.on(" or ").join(quimioterapiaInducList)
							+ ") ";
					queryTratamiento.append(quimioterapiaInducQ);
				}
				if (StringUtils.isNotBlank(filter.getQuimioteInducNroCiclos())) {
					String quimioteInducNroCiclosQ = " and Trat.quimioteInducNroCiclos = '"
							+ filter.getQuimioteInducNroCiclos() + "'";
					queryTratamiento.append(quimioteInducNroCiclosQ);
				}
				if (!CollectionUtils.isEmpty(filter.getQuimioOtra())) {
					List<String> quimioOtraList = Lists.newArrayList();
					String quimioOtroText = filter.getQuimioOtraOtra();
					for (Integer quimioOtraInd : filter.getQuimioOtra()) {
						quimioOtraList
								.add("Trat.quimioOtra ='" + quimioOtraInd + "//" + quimioOtroText + "'");
					}
					String quimioOtraQ = " and (" + Joiner.on(" or ").join(quimioOtraList) + ") ";
					queryTratamiento.append(quimioOtraQ);
				}
				if (!CollectionUtils.isEmpty(filter.getQuimioterapiaInter())) {
					List<String> quimioterapiaInterList = Lists.newArrayList();
					String quimioterapiaInterOtra = filter.getQuimioterapiaInterOtra();
					for (Integer quimioTerapInter : filter.getQuimioterapiaInter()) {
						quimioterapiaInterList.add("Trat.quimioterapiaInter ='" + quimioTerapInter + "//"
								+ quimioterapiaInterOtra + "'");
					}
					String quimioterapiaInterQ = " and (" + Joiner.on(" or ").join(quimioterapiaInterList)
							+ ") ";
					queryTratamiento.append(quimioterapiaInterQ);
				}
				if (StringUtils.isNotBlank(filter.getQuimioteInterNroCiclos())) {
					String quimioInterNroCiclosQ = " and Trat.quimioteInterNroCiclos = '"
							+ filter.getQuimioteInterNroCiclos() + "'";
					queryTratamiento.append(quimioInterNroCiclosQ);
				}
				if (queryTratamiento.length() > 0) {
					otherTables.append(", Tratamiento Trat");
					otherTablesJoin.append(" and Trat.consulta.idconsulta = C.idconsulta");
				}
				// tratemiento neoady
				StringBuilder queryTratamientoNeoAdy = new StringBuilder();
				if (!CollectionUtils.isEmpty(filter.getRadioterapia())) {
					String radioterapiaQ = " and DescTratNeo.radioterapia in ("
							+ Joiner.on(",").join(filter.getRadioterapia()) + ")";
					queryTratamientoNeoAdy.append(radioterapiaQ);
				}
				if (StringUtils.isNotBlank(filter.getRadioDosis())) {
					String radioDosisQ = " and DescTratNeo.radioDosis = '" + filter.getRadioDosis() + "'";
					queryTratamientoNeoAdy.append(radioDosisQ);
				}
				if (StringUtils.isNotBlank(filter.getRadioFechaInicio())) {
					String radioFechaInicioQ = " and DescTratNeo.radioFechaInicio =  '"
							+ filter.getRadioFechaInicio() + "'";
					queryTratamientoNeoAdy.append(radioFechaInicioQ);
				}
				if (StringUtils.isNotBlank(filter.getRadioFechaFinal())) {
					String radioFechaFinalQ = " and DescTratNeo.radioFechaFinal =  '"
							+ filter.getRadioFechaFinal() + "'";
					queryTratamientoNeoAdy.append(radioFechaFinalQ);
				}
				if (!CollectionUtils.isEmpty(filter.getQuimio())) {
					List<String> quimioList = Lists.newArrayList();
					String quimioEsquema = filter.getQuimioEsquema();
					for (Integer quimio : filter.getQuimio()) {
						quimioList.add(" DescTratNeo.quimioEsquema ='" + quimio + "//" + quimioEsquema + "'");
					}
					String quimioQ = " and (" + Joiner.on(" or ").join(quimioList) + ") ";
					queryTratamientoNeoAdy.append(quimioQ);
				}
				if (StringUtils.isNotBlank(filter.getQuimioNroCiclos())) {
					String radioFechaInicioQ = " and DescTratNeo.quimioNroCiclos =  '"
							+ filter.getQuimioNroCiclos() + "'";
					queryTratamientoNeoAdy.append(radioFechaInicioQ);
				}
				if (StringUtils.isNotBlank(filter.getQuimioFechaInicio())) {
					String quimioFechaInicioQ = " and DescTratNeo.quimioFechaInicio =  '"
							+ filter.getQuimioFechaInicio() + "'";
					queryTratamientoNeoAdy.append(quimioFechaInicioQ);
				}
				if (StringUtils.isNotBlank(filter.getQuimioFechaFinal())) {
					String quimioFechaFinalQ = " and DescTratNeo.quimioFechaFinal =  '"
							+ filter.getQuimioFechaFinal() + "'";
					queryTratamientoNeoAdy.append(quimioFechaFinalQ);
				}
				if (queryTratamientoNeoAdy.length() > 0) {
					otherTables.append(", DescTrataNeo DescTratNeo");
					otherTablesJoin.append(" and DescTratNeo.consulta.idconsulta = C.idconsulta");
				}
				// resp tratamiento neoady
				StringBuilder queryRespTratamientoNeoAdy = new StringBuilder();
				if (StringUtils.isNotBlank(filter.getRmCentroResp())) {
					String rmCentroQ = " and respTratNeo.rmCentro = '" + filter.getRmCentroResp() + "'";
					queryRespTratamientoNeoAdy.append(rmCentroQ);
				}
				if (StringUtils.isNotBlank(filter.getRmFechaResp())) {
					String rmFechaQ = " and respTratNeo.rmFecha =  '" + filter.getRmFechaResp() + "'";
					queryRespTratamientoNeoAdy.append(rmFechaQ);
				}
				if (StringUtils.isNotBlank(filter.getRmDistEsfinterResp())) {
					String rmFechaQ = " and respTratNeo.rmDistEsfinter =  '" + filter.getRmDistEsfinterResp()
							+ "'";
					queryRespTratamientoNeoAdy.append(rmFechaQ);
				}
				if (!CollectionUtils.isEmpty(filter.getRmDistAnalResp())) {
					String rmDistAnalQ = " and respTratNeo.rmDistAnal in ("
							+ Joiner.on(",").join(filter.getRmDistAnalResp()) + ")";
					queryRespTratamientoNeoAdy.append(rmDistAnalQ);
				}
				if (StringUtils.isNotBlank(filter.getRmAlturaResp())) {
					String rmAlturaQ = " and respTratNeo.rmAltura = '" + filter.getRmAlturaResp() + "'";
					queryRespTratamientoNeoAdy.append(rmAlturaQ);
				}
				if (!CollectionUtils.isEmpty(filter.getRmTumorResp())) {
					List<String> tumorList = Lists.newArrayList();
					for (Integer tumor : filter.getRmTumorResp()) {
						tumorList.add(" respTratNeo.rmTumor like '" + tumor + "//%'");
					}
					String tumorQ = " and (" + Joiner.on(" or ").join(tumorList) + ") ";
					queryRespTratamientoNeoAdy.append(tumorQ);
				}
				if (!CollectionUtils.isEmpty(filter.getRmTumorNResp())) {
					List<String> tumorList = Lists.newArrayList();
					for (Integer tumorN : filter.getRmTumorNResp()) {
						tumorList.add(" respTratNeo.rmTumor like '%//" + tumorN + "'");
					}
					String tumorNQ = " and (" + Joiner.on(" or ").join(tumorList) + ") ";
					queryRespTratamientoNeoAdy.append(tumorNQ);
				}
				if (!CollectionUtils.isEmpty(filter.getCrmResp())) {
					String rmDistAnalQ = " and respTratNeo.crm in ("
							+ Joiner.on(",").join(filter.getCrmResp()) + ")";
					queryRespTratamientoNeoAdy.append(rmDistAnalQ);
				}
				if (!CollectionUtils.isEmpty(filter.getEmviResp())) {
					String rmDistAnalQ = " and respTratNeo.emvi in ("
							+ Joiner.on(",").join(filter.getEmviResp()) + ")";
					queryRespTratamientoNeoAdy.append(rmDistAnalQ);
				}
				if (!CollectionUtils.isEmpty(filter.getDepSatelitesResp())) {
					String rmDistAnalQ = " and respTratNeo.depSatelites in ("
							+ Joiner.on(",").join(filter.getDepSatelitesResp()) + ")";
					queryRespTratamientoNeoAdy.append(rmDistAnalQ);
				}
				if (!CollectionUtils.isEmpty(filter.getEstadifTumor())) {
					String rmDistAnalQ = " and respTratNeo.estadifTumor in ("
							+ Joiner.on(",").join(filter.getEstadifTumor()) + ")";
					queryRespTratamientoNeoAdy.append(rmDistAnalQ);
				}
				if (!CollectionUtils.isEmpty(filter.getGradoRegre())) {
					String rmDistAnalQ = " and respTratNeo.gradoRegre in ("
							+ Joiner.on(",").join(filter.getGradoRegre()) + ")";
					queryRespTratamientoNeoAdy.append(rmDistAnalQ);
				}
				if (!CollectionUtils.isEmpty(filter.getGangliosImguiResp())) {
					String rmDistAnalQ = " and respTratNeo.gangliosImgui in ("
							+ Joiner.on(",").join(filter.getGangliosImguiResp()) + ")";
					queryRespTratamientoNeoAdy.append(rmDistAnalQ);
				}
				if (!CollectionUtils.isEmpty(filter.getGangliosLateral())) {
					String rmDistAnalQ = " and respTratNeo.gangliosLateral in ("
							+ Joiner.on(",").join(filter.getGangliosLateral()) + ")";
					queryRespTratamientoNeoAdy.append(rmDistAnalQ);
				}
				if (!CollectionUtils.isEmpty(filter.getInfiltraEsf())) {
					String rmDistAnalQ = " and respTratNeo.infiltraEsf in ("
							+ Joiner.on(",").join(filter.getInfiltraEsf()) + ")";
					queryRespTratamientoNeoAdy.append(rmDistAnalQ);
				}
				if (!CollectionUtils.isEmpty(filter.getEvaRespuesta())) {
					String rmDistAnalQ = " and respTratNeo.evaRespuesta in ("
							+ Joiner.on(",").join(filter.getEvaRespuesta()) + ")";
					queryRespTratamientoNeoAdy.append(rmDistAnalQ);
				}
				if (queryRespTratamientoNeoAdy.length() > 0) {
					otherTables.append(", RespuestaTrataNeoDTO respTratNeo");
					otherTablesJoin.append(" and respTratNeo.idconsulta = C.idconsulta");
				}
				// conducta trat neoady
				StringBuilder queryConductaPostNeo = new StringBuilder();
				if (!CollectionUtils.isEmpty(filter.getCirugiaCond())) {
					List<String> tumorList = Lists.newArrayList();
					for (Integer cirugia : filter.getCirugiaCond()) {
						tumorList.add(" conductaNeo.cirugia like '" + cirugia + "//%'");
					}
					String tumorQ = " and (" + Joiner.on(" or ").join(tumorList) + ") ";
					queryConductaPostNeo.append(tumorQ);
				}
				if (!CollectionUtils.isEmpty(filter.getCirugiaProcedCond())) {
					List<String> tumorList = Lists.newArrayList();
					for (Integer cirugia : filter.getCirugiaProcedCond()) {
						tumorList.add(" conductaNeo.cirugia like '%//" + cirugia + "'");
					}
					String tumorQ = " and (" + Joiner.on(" or ").join(tumorList) + ") ";
					queryConductaPostNeo.append(tumorQ);
				}
				if (!CollectionUtils.isEmpty(filter.getMilesCilindrico())) {
					List<String> quimioterapiaInterList = Lists.newArrayList();
					String milesCilindricoOtro = filter.getMilesCilindricoOtro();
					for (Integer milisCilindricco : filter.getMilesCilindrico()) {
						quimioterapiaInterList.add(" conductaNeo.milesCilindrico ='" + milisCilindricco
								+ "//" + milesCilindricoOtro + "'");
					}
					String quimioterapiaInterQ = " and (" + Joiner.on(" or ").join(quimioterapiaInterList)
							+ ") ";
					queryConductaPostNeo.append(quimioterapiaInterQ);
				}
				if (!CollectionUtils.isEmpty(filter.getUrgencia())) {
					String rmDistAnalQ = " and conductaNeo.urgencia in ("
							+ Joiner.on(",").join(filter.getUrgencia()) + ")";
					queryConductaPostNeo.append(rmDistAnalQ);
				}
				if (StringUtils.isNotBlank(filter.getUrgenciaFecha())) {
					String rmFechaQ = " and conductaNeo.urgenciaFecha =  '" + filter.getUrgenciaFecha() + "'";
					queryConductaPostNeo.append(rmFechaQ);
				}
				if (StringUtils.isNotBlank(filter.getCirujano())) {
					String rmFechaQ = " and conductaNeo.cirujano =  '" + filter.getCirujano() + "'";
					queryConductaPostNeo.append(rmFechaQ);
				}
				if (!CollectionUtils.isEmpty(filter.getWaitAndSee())) {
					String rmDistAnalQ = " and conductaNeo.WS in ("
							+ Joiner.on(",").join(filter.getWaitAndSee()) + ")";
					queryConductaPostNeo.append(rmDistAnalQ);
				}
				if (StringUtils.isNotBlank(filter.getFechaInicio())) {
					String rmFechaQ = " and conductaNeo.fechaInicio =  '" + filter.getFechaInicio() + "'";
					queryConductaPostNeo.append(rmFechaQ);
				}
				if (queryConductaPostNeo.length() > 0) {
					otherTables.append(", ConductaPostNeo conductaNeo");
					otherTablesJoin.append(" and conductaNeo.consulta.idconsulta = C.idconsulta");
				}
				// ana patologia post
				StringBuilder queryAnatomiaPatologicaPost = new StringBuilder();
				if (!CollectionUtils.isEmpty(filter.getTumor())) {
					List<String> tumorList = Lists.newArrayList();
					for (Integer tumor : filter.getTumor()) {
						tumorList.add(" anatPatPost.tumor like '" + tumor + "//%'");
					}
					String tumorQ = " and (" + Joiner.on(" or ").join(tumorList) + ") ";
					queryAnatomiaPatologicaPost.append(tumorQ);
				}
				if (!CollectionUtils.isEmpty(filter.getTumorN())) {
					List<String> tumorList = Lists.newArrayList();
					for (Integer tumorN : filter.getTumorN()) {
						tumorList.add(" anatPatPost.tumor like '%//" + tumorN + "'");
					}
					String tumorNQ = " and (" + Joiner.on(" or ").join(tumorList) + ") ";
					queryAnatomiaPatologicaPost.append(tumorNQ);
				}
				if (StringUtils.isNotBlank(filter.getGanResecados())) {
					String rmFechaQ = " and anatPatPost.ganResecados =  '" + filter.getGanResecados() + "'";
					queryAnatomiaPatologicaPost.append(rmFechaQ);
				}
				if (StringUtils.isNotBlank(filter.getGanPositivos())) {
					String rmFechaQ = " and anatPatPost.ganPositivos =  '" + filter.getGanPositivos() + "'";
					queryAnatomiaPatologicaPost.append(rmFechaQ);
				}
				if (!CollectionUtils.isEmpty(filter.getInvVascular())) {
					String rmDistAnalQ = " and anatPatPost.invVascular in ("
							+ Joiner.on(",").join(filter.getInvVascular()) + ")";
					queryAnatomiaPatologicaPost.append(rmDistAnalQ);
				}
				if (!CollectionUtils.isEmpty(filter.getInvPeri())) {
					String rmDistAnalQ = " and anatPatPost.invPeri in ("
							+ Joiner.on(",").join(filter.getInvPeri()) + ")";
					queryAnatomiaPatologicaPost.append(rmDistAnalQ);
				}
				if (!CollectionUtils.isEmpty(filter.getLinfa())) {
					String rmDistAnalQ = " and anatPatPost.linfa in ("
							+ Joiner.on(",").join(filter.getLinfa()) + ")";
					queryAnatomiaPatologicaPost.append(rmDistAnalQ);
				}
				if (!CollectionUtils.isEmpty(filter.getBuddingTumoral())) {
					String rmDistAnalQ = " and anatPatPost.buddingTumoral in ("
							+ Joiner.on(",").join(filter.getBuddingTumoral()) + ")";
					queryAnatomiaPatologicaPost.append(rmDistAnalQ);
				}
				if (!CollectionUtils.isEmpty(filter.getPushingBorder())) {
					String rmDistAnalQ = " and anatPatPost.pushingBorder in ("
							+ Joiner.on(",").join(filter.getPushingBorder()) + ")";
					queryAnatomiaPatologicaPost.append(rmDistAnalQ);
				}
				if (StringUtils.isNotBlank(filter.getGradoRegresion())) {
					String rmFechaQ = " and anatPatPost.gradoRegresion =  '" + filter.getGradoRegresion()
							+ "'";
					queryAnatomiaPatologicaPost.append(rmFechaQ);
				}
				if (StringUtils.isNotBlank(filter.getCap())) {
					String rmFechaQ = " and anatPatPost.cap =  '" + filter.getCap() + "'";
					queryAnatomiaPatologicaPost.append(rmFechaQ);
				}
				if (!CollectionUtils.isEmpty(filter.getRtaComPato())) {
					String rmDistAnalQ = " and anatPatPost.rtaComPato in ("
							+ Joiner.on(",").join(filter.getRtaComPato()) + ")";
					queryAnatomiaPatologicaPost.append(rmDistAnalQ);
				}
				if (!CollectionUtils.isEmpty(filter.getIhq())) {
					String rmDistAnalQ = " and anatPatPost.ihq in (" + Joiner.on(",").join(filter.getIhq())
							+ ")";
					queryAnatomiaPatologicaPost.append(rmDistAnalQ);
				}
				if (!CollectionUtils.isEmpty(filter.getKras())) {
					List<String> krasList = Lists.newArrayList();
					for (Integer kras : filter.getKras()) {
						krasList.add(" anatPatPost.kras like '" + kras + "//%'");
					}
					String tumorQ = " and (" + Joiner.on(" or ").join(krasList) + ") ";
					queryAnatomiaPatologicaPost.append(tumorQ);
				}
				if (!CollectionUtils.isEmpty(filter.getKrasTipo())) {
					List<String> krasTipoList = Lists.newArrayList();
					for (Integer krasTipo : filter.getKrasTipo()) {
						krasTipoList.add(" anatPatPost.tumor like '%//" + krasTipo + "'");
					}
					String tumorNQ = " and (" + Joiner.on(" or ").join(krasTipoList) + ") ";
					queryAnatomiaPatologicaPost.append(tumorNQ);
				}
				if (queryAnatomiaPatologicaPost.length() > 0) {
					otherTables.append(", AnatomiaPatologicaPost anatPatPost");
					otherTablesJoin.append(" and anatPatPost.consulta.idconsulta = C.idconsulta");
				}
				// tratamiento adyuvante post
				StringBuilder queryTratamientoAdyu = new StringBuilder();
				if (!CollectionUtils.isEmpty(filter.getQuimioterapia())) {
					List<String> quimioterapiaInterList = Lists.newArrayList();
					String quimioOtro = filter.getQuimioterapiaOtro();
					for (Integer quimioTerap : filter.getQuimioterapia()) {
						quimioterapiaInterList.add(" tratAdyuPost.quimioterapia ='1//" + quimioTerap + "//"
								+ quimioOtro + "'");
					}
					String quimioterapiaInterQ = " and (" + Joiner.on(" or ").join(quimioterapiaInterList)
							+ ") ";
					queryTratamientoAdyu.append(quimioterapiaInterQ);
				}
				if (StringUtils.isNotBlank(filter.getQuimioNroCiclosPost())) {
					String rmFechaQ = " and tratAdyuPost.quimioNroCiclos =  '"
							+ filter.getQuimioNroCiclosPost() + "'";
					queryTratamientoAdyu.append(rmFechaQ);
				}
				if (!CollectionUtils.isEmpty(filter.getRadioterapiaPost())) {
					String rmDistAnalQ = " and tratAdyuPost.radioterapia in ("
							+ Joiner.on(",").join(filter.getRadioterapiaPost()) + ")";
					queryTratamientoAdyu.append(rmDistAnalQ);
				}
				if (StringUtils.isNotBlank(filter.getRadioDosisPost())) {
					String rmFechaQ = " and tratAdyuPost.radioDosis =  '" + filter.getRadioDosisPost() + "'";
					queryTratamientoAdyu.append(rmFechaQ);
				}
				if (StringUtils.isNotBlank(filter.getRadioFechaInicioPost())) {
					String rmFechaQ = " and tratAdyuPost.radioFechaInicio =  '"
							+ filter.getRadioFechaInicioPost() + "'";
					queryTratamientoAdyu.append(rmFechaQ);
				}
				if (StringUtils.isNotBlank(filter.getRadioFechaFinalPost())) {
					String rmFechaQ = " and tratAdyuPost.radioFechaFinalPost =  '"
							+ filter.getRadioFechaFinalPost() + "'";
					queryTratamientoAdyu.append(rmFechaQ);
				}
				if (!CollectionUtils.isEmpty(filter.getSuspendio())) {
					List<String> quimioterapiaInterList = Lists.newArrayList();
					String suspendioDia = filter.getSuspendioDia();
					for (Integer suspendio : filter.getSuspendio()) {
						quimioterapiaInterList.add(" tratAdyuPost.suspendio ='" + suspendio + "//"
								+ suspendioDia + "'");
					}
					String quimioterapiaInterQ = " and (" + Joiner.on(" or ").join(quimioterapiaInterList)
							+ ") ";
					queryTratamientoAdyu.append(quimioterapiaInterQ);
				}
				if (queryTratamientoAdyu.length() > 0) {
					otherTables.append(", TratamientoAdyu tratAdyuPost");
					otherTablesJoin.append(" and tratAdyuPost.consulta.idconsulta = C.idconsulta");
				}
				// -----------

				// finally check if we need to add Consulta
				if (otherTables.length() > 0) {
					otherTables.insert(0, ", Consulta C");
					otherTablesJoin.insert(0, " and P.idpaciente = C.paciente.idpaciente");
				}
				// @formatter:off
				String queryString = " SELECT P FROM Paciente P " + otherTables.toString()
						+ " WHERE P.idpaciente is not null " 
						+ otherTablesJoin.toString()
						+ queryPatient.toString()
						+ queryMotivos.toString()
						+ queryAntecedentes.toString()
						+ queryEvaClinica.toString()
						+ queryPreconsulta.toString() 
						+ queryExaProcto.toString() 
						+ queryEstadificacion.toString()
						+ queryAnaPatologica.toString()
						+ queryTratamiento.toString() 
						+ queryTratamientoNeoAdy.toString()
						+ queryRespTratamientoNeoAdy.toString()
						+ queryAnatomiaPatologicaPost.toString()
						+ queryTratamientoAdyu.toString()
						+ " ORDER BY P.nombre";
				// @formatter:on
				LOG.info(queryString);
				Query query = session.createQuery(queryString);
				return query.list();

			}
		};

		listResult = (List<Paciente>) this.getHibernateTemplate().execute(callback);
		LOG.info("Cantidad:" + listResult.size());
		return listResult;
	}

	// public List<Paciente> getPatientsByFilter(final FilterDTO filter) throws
	// DataAccessException {
	//
	// List<Paciente> listResult = new ArrayList<Paciente>();
	// HibernateCallback callback = new HibernateCallback() {
	//
	// public Object doInHibernate(Session session) throws HibernateException,
	// SQLException {
	//
	// String name = "";
	// String dni = "";
	// if(!filter.getNombre().isEmpty()){
	// name=" LOWER(C.nombre) LIKE '%"+filter.getNombre().toLowerCase()+"%' and";
	// }
	// if(!filter.getDni().isEmpty()){
	// dni=" C.dni LIKE '"+filter.getDni()+"%' and";
	// }
	//
	// String orderBy = "C.nombre";
	// Query query = session.createQuery(
	// "select C "
	// + " FROM Paciente as C" + " WHERE"+name+dni
	// + " C.idpaciente is not null order by "+orderBy);
	//
	// List result = query.list();
	// return result;
	//
	// }
	// };
	//
	// listResult = (List<Paciente>)
	// this.getHibernateTemplate().execute(callback);
	// LOG.info("Cantidad:"+listResult.size());
	// return listResult;
	// }

	@SuppressWarnings("unchecked")
	public Paciente loadPatientById(final Long idPatient) throws DataAccessException {

		List<Paciente> lstResult = (List<Paciente>) getHibernateTemplate().find(
				"select C from Paciente as C where C.idpaciente=" + idPatient);

		if (lstResult.isEmpty()) {
			return null;
		} else
			return lstResult.get(0);
	}

	/*
	 * 
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
	 * 
	 * @SuppressWarnings("unchecked") public Cliente loadClientByName(final
	 * String name) throws DataAccessException {
	 * 
	 * List<Cliente> lstCliente = getHibernateTemplate().find(
	 * "select C from Cliente as C where C.nombre='" + name + "'");
	 * 
	 * if (lstCliente.isEmpty()) { return null; } else return lstCliente.get(0);
	 * }
	 * 
	 * 
	 * @SuppressWarnings("unchecked") public EstadoCli
	 * loadEstadoClientById(final Integer idEstadoClient) throws
	 * DataAccessException {
	 * 
	 * List<EstadoCli> lstCliente = getHibernateTemplate().find(
	 * "select C from EstadoCli as C where C.idestadocli=" + idEstadoClient);
	 * 
	 * if (lstCliente.isEmpty()) { return null; } else return lstCliente.get(0);
	 * }
	 * 
	 * @SuppressWarnings("unchecked") public Localidad loadLocalidadById(final
	 * Integer idLocalidad) throws DataAccessException {
	 * 
	 * List<Localidad> lstResults = getHibernateTemplate().find(
	 * "select C from Localidad as C where C.idlocalidad=" + idLocalidad);
	 * 
	 * if (lstResults.isEmpty()) { return null; } else return lstResults.get(0);
	 * }
	 * 
	 * @SuppressWarnings("unchecked") public List<Localidad>
	 * loadAllLocalidades() throws DataAccessException {
	 * 
	 * List<Localidad> lstResults = getHibernateTemplate().find(
	 * "select C from Localidad as C");
	 * 
	 * if (lstResults.isEmpty()) { return null; } else return lstResults; }
	 * 
	 * @SuppressWarnings("unchecked") public List<CatDnitipo> loadAllTypeDni()
	 * throws DataAccessException {
	 * 
	 * List<CatDnitipo> lstResults = getHibernateTemplate().find(
	 * "select T from CatDnitipo as T");
	 * 
	 * if (lstResults.isEmpty()) { return null; } else return lstResults; }
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
	 * @SuppressWarnings("unchecked") public String loadLastClientNum() throws
	 * DataAccessException {
	 * 
	 * List<Cliente> listResult =null;
	 * 
	 * HibernateCallback callback = new HibernateCallback() {
	 * 
	 * public Object doInHibernate(Session session) throws HibernateException,
	 * SQLException {
	 * 
	 * DetachedCriteria maxId = DetachedCriteria.forClass(Cliente.class)
	 * .setProjection( Projections.max("idcliente") ); Criteria criteria =
	 * session.createCriteria(Cliente.class).add(
	 * Property.forName("idcliente").eq(maxId));
	 * 
	 * return criteria.list(); } };
	 * 
	 * listResult = (List<Cliente>)
	 * this.getHibernateTemplate().execute(callback);
	 * 
	 * return listResult.get(0).getNumerocli(); }
	 */

	@SuppressWarnings("unchecked")
	public List<CatOs> loadAllCatOS() throws DataAccessException {
		List<CatOs> lstResults = (List<CatOs>) getHibernateTemplate().find("select E from CatOs as E");

		if (lstResults.isEmpty()) {
			return null;
		} else
			return lstResults;
	}

	public long updatePatient(Paciente paciente) throws DataAccessException {
		LOG.info("PatientDAOImpl.updatePatient()");
		getHibernateTemplate().update(paciente);
		return paciente.getIdpaciente();
	}

	public void deletePatient(Paciente paciente) throws DataAccessException {
		LOG.info("deletePatient()");
		getHibernateTemplate().delete(paciente);
	}
}
