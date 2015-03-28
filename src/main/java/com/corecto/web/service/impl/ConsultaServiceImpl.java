/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.corecto.web.dao.AnatomiaPatologicaPostDAO;
import com.corecto.web.dao.AnotomiaPatologicaDAO;
import com.corecto.web.dao.AntecedentesDAO;
import com.corecto.web.dao.ConductaPostNeoDAO;
import com.corecto.web.dao.DescTrataNeoDAO;
import com.corecto.web.dao.EstadificacionDAO;
import com.corecto.web.dao.EvaClinicaDAO;
import com.corecto.web.dao.ExaProctoDAO;
import com.corecto.web.dao.MotivoDAO;
import com.corecto.web.dao.PatientDAO;
import com.corecto.web.dao.PreconsultaDAO;
import com.corecto.web.dao.RespuestaTrataNeoDAO;
import com.corecto.web.dao.TratamientoAdyuDAO;
import com.corecto.web.dao.TratamientoDAO;
import com.corecto.web.dao.impl.DAOLocator;
import com.corecto.web.model.dto.AnatomiaPatologicaPostDTO;
import com.corecto.web.model.dto.AnotomiaPatologicaDTO;
import com.corecto.web.model.dto.AntecedentesDTO;
import com.corecto.web.model.dto.ConductaPostNeoDTO;
import com.corecto.web.model.dto.ConsultaDTO;
import com.corecto.web.model.dto.DescTrataNeoDTO;
import com.corecto.web.model.dto.EstadificacionDTO;
import com.corecto.web.model.dto.EvaClinicaDTO;
import com.corecto.web.model.dto.ExaProctoDTO;
import com.corecto.web.model.dto.MotivoDTO;
import com.corecto.web.model.dto.PreconsultaDTO;
import com.corecto.web.model.dto.RespuestaTrataNeoDTO;
import com.corecto.web.model.dto.TratamientoAdyuDTO;
import com.corecto.web.model.dto.TratamientoDTO;
import com.corecto.web.model.pojo.extra.AnatomiaPatologica;
import com.corecto.web.model.pojo.extra.AnatomiaPatologicaPost;
import com.corecto.web.model.pojo.extra.Antecedentes;
import com.corecto.web.model.pojo.extra.CatHospital;
import com.corecto.web.model.pojo.extra.ConductaPostNeo;
import com.corecto.web.model.pojo.extra.Consulta;
import com.corecto.web.model.pojo.extra.DescTrataNeo;
import com.corecto.web.model.pojo.extra.Estadificacion;
import com.corecto.web.model.pojo.extra.EvaClinica;
import com.corecto.web.model.pojo.extra.ExaProcto;
import com.corecto.web.model.pojo.extra.Motivo;
import com.corecto.web.model.pojo.extra.Paciente;
import com.corecto.web.model.pojo.extra.Preconsulta;
import com.corecto.web.model.pojo.extra.RespuestaTrataNeo;
import com.corecto.web.model.pojo.extra.Tratamiento;
import com.corecto.web.model.pojo.extra.TratamientoAdyu;
import com.corecto.web.service.ConsultaService;

/**
 * TODO comment<br>
 * <br>
 * <b>Change log:</b>
 * <ul>
 * v
 * <li>1.0 20/02/2013 - Xpost - initial version</li>
 * </ul>
 * 
 * @author Xpost
 * @version 1.0
 */
@Transactional
@Service
public class ConsultaServiceImpl implements ConsultaService {

	Logger LOG = LoggerFactory.getLogger(ConsultaServiceImpl.class);
	private SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy");

	public Long loadConsulta(long idPaciente) {

		PatientDAO patientDAO = DAOLocator.getInstance().lookup(PatientDAO.class.getName());
		Consulta consulta = patientDAO.loadConsultaByIdClient(idPaciente);
		if (consulta == null) {
			consulta = new Consulta();
			CatHospital catHospital = new CatHospital();
			catHospital.setIdcathospital(1);
			consulta.setCatHospital(catHospital);
			Paciente paciente = new Paciente();
			paciente.setIdpaciente(idPaciente);
			consulta.setPaciente(paciente);
			consulta.setMedico("");
			consulta.setDiaghistologico(true);
			consulta.setFecha(Calendar.getInstance().getTime());
			patientDAO.saveNewConsulta(consulta);
		} else {
			ConsultaDTO consultaDTO = new ConsultaDTO();
			consultaDTO.setIdconsulta(consulta.getIdconsulta());
			consultaDTO.setIdpaciente(idPaciente);
			// consultaDTO.setAnatomiaPatologicaPosts(anatomiaPatologicaPosts);
			// consultaDTO.setAnotomiaPatologica(anotomiaPatologica);
			// consultaDTO.setAntecedenteses(antecedenteses);
			// consultaDTO.setConductaPostNeos(conductaPostNeos);
			// consultaDTO.setDescTrataNeos(descTrataNeos);
			// consultaDTO.setEstadificacions(estadificacions);
			// consultaDTO.setEvaClinicas(evaClinicas);
			// consultaDTO.setExaProctos(exaProctos);
			// consultaDTO.setFecha(fecha);
			//
			// consultaDTO.setMotivos(motivos);
			// consultaDTO.setPreconsultas(preconsultas);
			// consultaDTO.setRespuestaTrataNeos(respuestaTrataNeos);
			// consultaDTO.setTratamientoAdyu(tratamientoAdyu);
			// consultaDTO.setTratamientos(tratamientos);
		}
		return consulta.getIdconsulta();
	}

	public Long savePreconsulta(PreconsultaDTO preconsultaDTO) {
		Preconsulta preconsulta = new Preconsulta();
		Consulta consulta = new Consulta();
		consulta.setIdconsulta(preconsultaDTO.getIdConsulta());
		preconsulta.setConsulta(consulta);
		preconsulta.setComentario(preconsultaDTO.getComentario());
		preconsulta.setPerformanceStatus(preconsultaDTO.getPerformanceStatus());
		preconsulta.setPeso(Double.parseDouble(preconsultaDTO.getPeso()));
		preconsulta.setSupcorporal(Double.parseDouble(preconsultaDTO.getSupcorporal()));
		preconsulta.setTalla(Double.parseDouble(preconsultaDTO.getTalla()));

		PreconsultaDAO preconsultaDAO = DAOLocator.getInstance().lookup(PreconsultaDAO.class.getName());
		if (preconsultaDTO.getIdpreconsulta() != -1L) {
			preconsulta.setIdpreconsulta(preconsultaDTO.getIdpreconsulta());
			return preconsultaDAO.updatePreconsulta(preconsulta);
		} else {
			return preconsultaDAO.saveNewPreconsulta(preconsulta);
		}
	}

	public PreconsultaDTO loadPreconsulta(Long idConsulta) {

		PreconsultaDAO preconsultaDAO = DAOLocator.getInstance().lookup(PreconsultaDAO.class.getName());
		Preconsulta preconsulta = preconsultaDAO.loadPreconsultaByConsulta(idConsulta);
		PreconsultaDTO preconsultaDTO = null;
		if (preconsulta != null) {
			preconsultaDTO = new PreconsultaDTO();
			preconsultaDTO.setComentario(preconsulta.getComentario());
			preconsultaDTO.setIdpreconsulta(preconsulta.getIdpreconsulta());
			preconsultaDTO.setIdConsulta(idConsulta);
			preconsultaDTO.setPerformanceStatus(preconsulta.getPerformanceStatus());
			preconsultaDTO.setPeso(preconsulta.getPeso().toString());
			preconsultaDTO.setSupcorporal(preconsulta.getSupcorporal().toString());
			preconsultaDTO.setTalla(preconsulta.getTalla().toString());
		}
		return preconsultaDTO;
	}

	public MotivoDTO loadMotivo(Long idConsulta) {

		MotivoDAO motivoDAO = DAOLocator.getInstance().lookup(MotivoDAO.class.getName());
		Motivo motivo = motivoDAO.loadMotivoByConsulta(idConsulta);
		MotivoDTO motivoDTO = null;
		if (motivo != null) {
			motivoDTO = new MotivoDTO();
			motivoDTO.setEvoMeses(motivo.getEvoMeses().toString());
			if (motivo.getFechaInicio() != null) {
				motivoDTO.setFechaInicio(dateFormatter.format(motivo.getFechaInicio()));
			}
			motivoDTO.setIdConsulta(idConsulta);
			motivoDTO.setIdmotivo(motivo.getIdmotivo());
			motivoDTO.setMotivo(motivo.getMotivo());
			motivoDTO.setMotivoOtro(motivo.getMotivoOtro());

		}
		return motivoDTO;
	}

	public Long saveMotivo(MotivoDTO motivoDTO) {
		Motivo motivo = new Motivo();
		Consulta consulta = new Consulta();
		consulta.setIdconsulta(motivoDTO.getIdConsulta());
		motivo.setConsulta(consulta);
		motivo.setEvoMeses(Integer.parseInt(motivoDTO.getEvoMeses()));
		try {
			motivo.setFechaInicio(dateFormatter.parse(motivoDTO.getFechaInicio()));
		} catch (ParseException e) {
			LOG.error(e.getMessage());
			e.printStackTrace();
		}
		motivo.setMotivo(motivoDTO.getMotivo());
		motivo.setMotivoOtro(motivoDTO.getMotivoOtro());
		MotivoDAO motivoDAO = DAOLocator.getInstance().lookup(MotivoDAO.class.getName());
		if (motivoDTO.getIdmotivo() != -1L) {
			motivo.setIdmotivo(motivoDTO.getIdmotivo());
			return motivoDAO.updateMotivo(motivo);
		} else {
			return motivoDAO.saveNewMotivo(motivo);
		}
	}

	public AntecedentesDTO loadAntecedente(Long idConsulta) {

		AntecedentesDAO antecedentesDAO = DAOLocator.getInstance().lookup(AntecedentesDAO.class.getName());
		Antecedentes antecedentes = antecedentesDAO.loadAntecedentesByConsulta(idConsulta);
		AntecedentesDTO antecedentesDTO = null;
		if (antecedentes != null) {
			antecedentesDTO = new AntecedentesDTO();
			antecedentesDTO.setAntecedentesCcrh(antecedentes.getAntecedentesCcrh());
			antecedentesDTO.setFamiliarCancer(antecedentes.getFamiliarCancer());
			antecedentesDTO.setIdantecedente(antecedentes.getIdantecedente());
			antecedentesDTO.setIdConsulta(idConsulta);
			antecedentesDTO.setNeoplasia(antecedentes.getNeoplasia());
			antecedentesDTO.setPersonalAlcohol(antecedentes.getPersonalAlcohol());
			antecedentesDTO.setPersonalCardio(antecedentes.getPersonalCardio());
			antecedentesDTO.setPersonalDbt(antecedentes.getPersonalDbt());
			antecedentesDTO.setPersonalNinguno(antecedentes.getPersonalNinguno());
			antecedentesDTO.setPersonalOtro(antecedentes.getPersonalOtro());
			antecedentesDTO.setPersonalTabaquismo(antecedentes.getPersonalTabaquismo());
			antecedentesDTO.setPatologicoAdenoma(antecedentes.getPatologicoAdenoma());
			antecedentesDTO.setPatologicoColitis(antecedentes.getPatologicoColitis());
			antecedentesDTO.setPatologicoCrohn(antecedentes.getPatologicoCrohn());
			antecedentesDTO.setPatologicoHiv(antecedentes.getPatologicoHiv());
			antecedentesDTO.setPatologicoNeoplasia(antecedentes.getPatologicoNeoplasia());
			antecedentesDTO.setPatologicoAdenoma(antecedentes.getPatologicoAdenoma());
			antecedentesDTO.setPatologicoNinguno(antecedentes.getPatologicoNinguno());
			antecedentesDTO.setTipoCcrh(antecedentes.getTipoCcrh());
		}
		return antecedentesDTO;
	}

	public Long saveAntecedentes(AntecedentesDTO antecedentesDTO) {
		Antecedentes antecedentes = new Antecedentes();
		Consulta consulta = new Consulta();
		consulta.setIdconsulta(antecedentesDTO.getIdConsulta());
		antecedentes.setConsulta(consulta);
		antecedentes.setTipoCcrh(antecedentesDTO.getTipoCcrh());
		antecedentes.setAntecedentesCcrh(antecedentesDTO.getAntecedentesCcrh());
		antecedentes.setFamiliarCancer(antecedentesDTO.getFamiliarCancer());
		antecedentes.setNeoplasia(antecedentesDTO.getNeoplasia());
		antecedentes.setPersonalAlcohol(antecedentesDTO.getPersonalAlcohol());
		antecedentes.setPersonalCardio(antecedentesDTO.getPersonalCardio());
		antecedentes.setPersonalDbt(antecedentesDTO.getPersonalDbt());
		antecedentes.setPersonalNinguno(antecedentesDTO.getPersonalNinguno());
		antecedentes.setPersonalOtro(antecedentesDTO.getPersonalOtro());
		antecedentes.setPersonalTabaquismo(antecedentesDTO.getPersonalTabaquismo());
		antecedentes.setPatologicoAdenoma(antecedentesDTO.getPatologicoAdenoma());
		antecedentes.setPatologicoColitis(antecedentesDTO.getPatologicoColitis());
		antecedentes.setPatologicoCrohn(antecedentesDTO.getPatologicoCrohn());
		antecedentes.setPatologicoHiv(antecedentesDTO.getPatologicoHiv());
		antecedentes.setPatologicoNeoplasia(antecedentesDTO.getPatologicoNeoplasia());
		antecedentes.setPatologicoAdenoma(antecedentesDTO.getPatologicoAdenoma());
		antecedentes.setPatologicoNinguno(antecedentesDTO.getPatologicoNinguno());

		AntecedentesDAO antecedentesDAO = DAOLocator.getInstance().lookup(AntecedentesDAO.class.getName());
		if (antecedentesDTO.getIdantecedente() != -1L) {
			antecedentes.setIdantecedente(antecedentesDTO.getIdantecedente());
			return antecedentesDAO.updateAntecedentes(antecedentes);
		} else {
			return antecedentesDAO.saveNewAntecedentes(antecedentes);
		}
	}

	public EvaClinicaDTO loadEvaClinica(Long idConsulta) {

		EvaClinicaDAO evaClinicaDAO = DAOLocator.getInstance().lookup(EvaClinicaDAO.class.getName());
		EvaClinica evaClinica = evaClinicaDAO.loadEvaClinicaByConsulta(idConsulta);
		EvaClinicaDTO evaClinicaDTO = null;
		if (evaClinica != null) {
			evaClinicaDTO = new EvaClinicaDTO();
			evaClinicaDTO.setAbdomen(evaClinica.getAbdomen());
			evaClinicaDTO.setAdenopatias(evaClinica.getAdenopatias());
			evaClinicaDTO.setColon(evaClinica.getColon());
			evaClinicaDTO.setIdConsulta(idConsulta);
			evaClinicaDTO.setIdevaclinica(evaClinica.getIdevaclinica());
			evaClinicaDTO.setNotas(evaClinica.getNotas());
			evaClinicaDTO.setRecto(evaClinica.getRecto());
		}
		return evaClinicaDTO;
	}

	public Long saveEvaClinica(EvaClinicaDTO evaClinicaDTO) {
		EvaClinica evaClinica = new EvaClinica();
		Consulta consulta = new Consulta();
		consulta.setIdconsulta(evaClinicaDTO.getIdConsulta());
		evaClinica.setConsulta(consulta);
		evaClinica.setAbdomen(evaClinicaDTO.getAbdomen());
		evaClinica.setAdenopatias(evaClinicaDTO.getAdenopatias());
		evaClinica.setColon(evaClinicaDTO.getColon());
		evaClinica.setNotas(evaClinicaDTO.getNotas());
		evaClinica.setRecto(evaClinicaDTO.getRecto());

		EvaClinicaDAO evaClinicaDAO = DAOLocator.getInstance().lookup(EvaClinicaDAO.class.getName());
		if (evaClinicaDTO.getIdevaclinica() != -1L) {
			evaClinica.setIdevaclinica(evaClinicaDTO.getIdevaclinica());
			return evaClinicaDAO.updateEvaClinica(evaClinica);
		} else {
			return evaClinicaDAO.saveNewEvaClinica(evaClinica);
		}
	}

	public ExaProctoDTO loadExaProctologico(Long idConsulta) {
		ExaProctoDAO exaProctoDAO = DAOLocator.getInstance().lookup(ExaProctoDAO.class.getName());
		ExaProcto exaProcto = exaProctoDAO.loadExaProctoByConsulta(idConsulta);
		ExaProctoDTO exaProctoDTO = null;
		if (exaProcto != null) {
			exaProctoDTO = new ExaProctoDTO();
			exaProctoDTO.setEe(exaProcto.getEe());
			exaProctoDTO.setEeTipo(exaProcto.getEeTipo());
			exaProctoDTO.setEeTipoN(exaProcto.getEeTipoN());
			if (exaProcto.getEeFecha() != null) {
				exaProctoDTO.setEeFecha(dateFormatter.format(exaProcto.getEeFecha()));
			}
			exaProctoDTO.setEeInfiltra(exaProcto.getEeInfiltra());
			exaProctoDTO.setEeInfiltraMedida(exaProcto.getEeInfiltraMedida());
			exaProctoDTO.setIdConsulta(idConsulta);
			exaProctoDTO.setIdexaprocto(exaProcto.getIdexaprocto());
			exaProctoDTO.setRsc(exaProcto.getRsc());
			exaProctoDTO.setRscAltura(exaProcto.getRscAltura());
			if (exaProcto.getRscFecha() != null) {
				exaProctoDTO.setRscFecha(dateFormatter.format(exaProcto.getRscFecha()));
			}
			exaProctoDTO.setTactoRectal(exaProcto.getTactoRectal());
			exaProctoDTO.setTactoRectalInfiltra(exaProcto.getTactoRectalInfiltra());
			exaProctoDTO.setVcc(exaProcto.getVcc());
			exaProctoDTO.setVccAltura(exaProcto.getVccAltura());
			if (exaProcto.getVccFecha() != null) {
				exaProctoDTO.setVccFecha(dateFormatter.format(exaProcto.getVccFecha()));
			}
		}
		return exaProctoDTO;
	}

	public Long saveExaProctologico(ExaProctoDTO exaProctoDTO) {
		ExaProcto exaProcto = new ExaProcto();
		Consulta consulta = new Consulta();
		consulta.setIdconsulta(exaProctoDTO.getIdConsulta());
		exaProcto.setConsulta(consulta);
		exaProcto.setEe(exaProctoDTO.getEe());
		exaProcto.setEeTipo(exaProctoDTO.getEeTipo());
		exaProcto.setEeTipoN(exaProctoDTO.getEeTipoN());
		try {
			exaProcto.setEeFecha(dateFormatter.parse(exaProctoDTO.getEeFecha()));
			exaProcto.setVccFecha(dateFormatter.parse(exaProctoDTO.getVccFecha()));
			exaProcto.setRscFecha(dateFormatter.parse(exaProctoDTO.getRscFecha()));

		} catch (ParseException e) {
			LOG.error(e.getMessage());
			e.printStackTrace();
		}

		exaProcto.setEeInfiltra(exaProctoDTO.getEeInfiltra());
		exaProcto.setEeInfiltraMedida(exaProctoDTO.getEeInfiltraMedida());
		exaProcto.setRsc(exaProctoDTO.getRsc());
		exaProcto.setRscAltura(exaProctoDTO.getRscAltura());
		exaProcto.setTactoRectal(exaProctoDTO.getTactoRectal());
		exaProcto.setTactoRectalInfiltra(exaProctoDTO.getTactoRectalInfiltra());
		exaProcto.setVcc(exaProctoDTO.getVcc());
		exaProcto.setVccAltura(exaProctoDTO.getVccAltura());

		ExaProctoDAO exaProctoDAO = DAOLocator.getInstance().lookup(ExaProctoDAO.class.getName());

		if (exaProctoDTO.getIdexaprocto() != -1L) {
			exaProcto.setIdexaprocto(exaProctoDTO.getIdexaprocto());
			return exaProctoDAO.updateExaProcto(exaProcto);
		} else {
			return exaProctoDAO.saveNewExaProcto(exaProcto);
		}
	}

	public EstadificacionDTO loadEstadificacion(Long idConsulta) {
		EstadificacionDAO estadificacionDAO = DAOLocator.getInstance().lookup(
				EstadificacionDAO.class.getName());
		Estadificacion estadificacion = estadificacionDAO.loadEstadificacionByConsulta(idConsulta);
		EstadificacionDTO estadificacionDTO = null;
		if (estadificacion != null) {
			estadificacionDTO = new EstadificacionDTO();
			estadificacionDTO.setCa19(estadificacion.getCa19());
			estadificacionDTO.setCeaAumentado(estadificacion.getCeaAumentado());
			estadificacionDTO.setCrm(estadificacion.getCrm());
			estadificacionDTO.setDepSatelites(estadificacion.getDepSatelites());
			estadificacionDTO.setEmvi(estadificacion.getEmvi());
			estadificacionDTO.setGanglios(estadificacion.getGanglios());
			estadificacionDTO.setGangliosLate(estadificacion.getGangliosLate());
			estadificacionDTO.setIdConsulta(idConsulta);
			estadificacionDTO.setIdestadificacion(estadificacion.getIdestadificacion());
			estadificacionDTO.setInfiltraEsfinter(estadificacion.getInfiltraEsfinter());
			if (estadificacion.getMarTumFecha() != null) {
				estadificacionDTO.setMarTumFecha(dateFormatter.format(estadificacion.getMarTumFecha()));
			}
			estadificacionDTO.setMetastasis(estadificacion.getMetastasis());
			estadificacionDTO.setMetastasisOtra(estadificacion.getMetastasisOtra());
			estadificacionDTO.setMts(estadificacion.getMts());
			estadificacionDTO.setPetCt(estadificacion.getPetCt());
			estadificacionDTO.setRevAltura(estadificacion.getRevAltura());
			estadificacionDTO.setRevCrm(estadificacion.getRevCrm());
			estadificacionDTO.setRevDistanAnal(estadificacion.getRevDistanAnal());
			estadificacionDTO.setRevDistanEsfinter(estadificacion.getRevDistanEsfinter());
			estadificacionDTO.setRevEmvi(estadificacion.getRevEmvi());
			estadificacionDTO.setRevEstadifTumores(estadificacion.getRevEstadifTumores());
			estadificacionDTO.setRevGanIngui(estadificacion.getRevGanIngui());
			estadificacionDTO.setRevGanLateral(estadificacion.getRevGanLateral());
			estadificacionDTO.setRevInfiltraEsf(estadificacion.getRevInfiltraEsf());
			if (estadificacion.getRevRmFecha() != null) {
				estadificacionDTO.setRevRmFecha(dateFormatter.format(estadificacion.getRevRmFecha()));
			}
			estadificacionDTO.setRevTumor(estadificacion.getRevTumor());
			estadificacionDTO.setRmAltura(estadificacion.getRmAltura());
			estadificacionDTO.setRmCentro(estadificacion.getRmCentro());
			estadificacionDTO.setRmDistAnal(estadificacion.getRmDistAnal());
			estadificacionDTO.setRmDistEsfinter(estadificacion.getRmDistEsfinter());
			if (estadificacion.getRmFecha() != null) {
				estadificacionDTO.setRmFecha(dateFormatter.format(estadificacion.getRmFecha()));
			}
			estadificacionDTO.setRmTumor(estadificacion.getRmTumor());
			estadificacionDTO.setRmTumorN(estadificacion.getRmTumorN());
			estadificacionDTO.setSuv(estadificacion.getSuv());
			estadificacionDTO.setTcAbd(estadificacion.getTcAbd());
			estadificacionDTO.setTcTorax(estadificacion.getTcTorax());
			estadificacionDTO.setTnmM(estadificacion.getTnmM());
			estadificacionDTO.setTnmN(estadificacion.getTnmN());
			estadificacionDTO.setTnmPm(estadificacion.getTnmPm());
			estadificacionDTO.setTnmPn(estadificacion.getTnmPn());
			estadificacionDTO.setTnmPt(estadificacion.getTnmPt());
			estadificacionDTO.setTnmT(estadificacion.getTnmT());
			estadificacionDTO.setTumoRectoInferior(estadificacion.getTumoRectoInferior());

		}
		return estadificacionDTO;
	}

	public Long saveEstadificacion(EstadificacionDTO estadificacionDTO) {
		Estadificacion estadificacion = new Estadificacion();
		Consulta consulta = new Consulta();
		consulta.setIdconsulta(estadificacionDTO.getIdConsulta());
		estadificacion.setConsulta(consulta);
		estadificacion.setCa19(estadificacionDTO.getCa19());
		estadificacion.setCeaAumentado(estadificacionDTO.getCeaAumentado());
		estadificacion.setCrm(estadificacionDTO.getCrm());
		estadificacion.setDepSatelites(estadificacionDTO.getDepSatelites());
		estadificacion.setEmvi(estadificacionDTO.getEmvi());
		estadificacion.setGanglios(estadificacionDTO.getGanglios());
		estadificacion.setGangliosLate(estadificacionDTO.getGangliosLate());
		estadificacion.setInfiltraEsfinter(estadificacionDTO.getInfiltraEsfinter());
		try {
			estadificacion.setMarTumFecha(dateFormatter.parse(estadificacionDTO.getMarTumFecha()));
			estadificacion.setRmFecha(dateFormatter.parse(estadificacionDTO.getRmFecha()));
			estadificacion.setRevRmFecha(dateFormatter.parse(estadificacionDTO.getRevRmFecha()));
		} catch (ParseException e) {
			LOG.error(e.getMessage());
			e.printStackTrace();
		}

		estadificacion.setMetastasis(estadificacionDTO.getMetastasis());
		estadificacion.setMetastasisOtra(estadificacionDTO.getMetastasisOtra());
		estadificacion.setMts(estadificacionDTO.getMts());
		estadificacion.setPetCt(estadificacionDTO.getPetCt());
		estadificacion.setRevAltura(estadificacionDTO.getRevAltura());
		estadificacion.setRevCrm(estadificacionDTO.getCrm());
		estadificacion.setRevEmvi(estadificacionDTO.getRevEmvi());
		estadificacion.setRevEstadifTumores(estadificacionDTO.getRevEstadifTumores());
		estadificacion.setRevGanIngui(estadificacionDTO.getRevGanIngui());
		estadificacion.setRevGanLateral(estadificacionDTO.getRevGanLateral());
		estadificacion.setRevInfiltraEsf(estadificacionDTO.getRevInfiltraEsf());
		estadificacion.setRevTumor(estadificacionDTO.getRevTumor());
		estadificacion.setRevDistanAnal(estadificacionDTO.getRevDistanAnal());
		estadificacion.setRevDistanEsfinter(estadificacionDTO.getRevDistanEsfinter());

		estadificacion.setRmTumor(estadificacionDTO.getRmTumor());
		estadificacion.setRmTumorN(estadificacionDTO.getRmTumorN());
		estadificacion.setRmAltura(estadificacionDTO.getRmAltura());
		estadificacion.setRmCentro(estadificacionDTO.getRmCentro());
		estadificacion.setRmDistAnal(estadificacionDTO.getRmDistAnal());
		estadificacion.setRmDistEsfinter(estadificacionDTO.getRmDistEsfinter());
		estadificacion.setSuv(estadificacionDTO.getSuv());
		estadificacion.setTcAbd(estadificacionDTO.getTcAbd());
		estadificacion.setTcTorax(estadificacionDTO.getTcTorax());
		estadificacion.setTnmM(estadificacionDTO.getTnmM());
		estadificacion.setTnmN(estadificacionDTO.getTnmN());
		estadificacion.setTnmT(estadificacionDTO.getTnmT());
		estadificacion.setTnmPm(estadificacionDTO.getTnmPm());
		estadificacion.setTnmPn(estadificacionDTO.getTnmPn());
		estadificacion.setTnmPt(estadificacionDTO.getTnmPt());
		estadificacion.setTumoRectoInferior(estadificacionDTO.getTumoRectoInferior());

		EstadificacionDAO estadificacionDAO = DAOLocator.getInstance().lookup(
				EstadificacionDAO.class.getName());

		if (estadificacionDTO.getIdestadificacion() != -1L) {
			estadificacion.setIdestadificacion(estadificacionDTO.getIdestadificacion());
			return estadificacionDAO.updateEstadificacion(estadificacion);
		} else {
			return estadificacionDAO.saveNewEstadificacion(estadificacion);
		}

	}

	public AnotomiaPatologicaDTO loadAnaPatologica(Long idConsulta) {
		AnotomiaPatologicaDAO anotomiaPatologicaDAO = DAOLocator.getInstance().lookup(
				AnotomiaPatologicaDAO.class.getName());
		AnatomiaPatologica anotomiaPatologica = anotomiaPatologicaDAO
				.loadAnotomiaPatologicaByConsulta(idConsulta);
		AnotomiaPatologicaDTO anotomiaPatologicaDTO = null;
		if (anotomiaPatologica != null) {
			anotomiaPatologicaDTO = new AnotomiaPatologicaDTO();
			anotomiaPatologicaDTO.setApSugestiva(anotomiaPatologica.getApSugestiva());
			anotomiaPatologicaDTO.setBaseDiag(anotomiaPatologica.getBaseDiag());
			anotomiaPatologicaDTO.setBaseDiagCirugia(anotomiaPatologica.getBaseDiagCirugia());
			anotomiaPatologicaDTO.setBiopsia(anotomiaPatologica.getBiopsia());
			anotomiaPatologicaDTO.setDiagHistologico(anotomiaPatologica.getDiagHistologico());
			anotomiaPatologicaDTO.setDiagnosticadoEn(anotomiaPatologica.getDiagnosticadoEn());
			anotomiaPatologicaDTO.setExpresionConserv(anotomiaPatologica.getExpresionConserv());
			if (anotomiaPatologica.getFechaDiag() != null) {
				anotomiaPatologicaDTO.setFechaDiag(dateFormatter.format(anotomiaPatologica.getFechaDiag()));
			}
			anotomiaPatologicaDTO.setGradoDif(anotomiaPatologica.getGradoDif());
			anotomiaPatologicaDTO.setIdanotomia(anotomiaPatologica.getIdanotomia());
			anotomiaPatologicaDTO.setIdConsulta(idConsulta);
			anotomiaPatologicaDTO.setIhq(anotomiaPatologica.getIhq());
		}
		return anotomiaPatologicaDTO;
	}

	public Long saveAnaPatologica(AnotomiaPatologicaDTO anotomiaPatologicaDTO) {
		AnatomiaPatologica anotomiaPatologica = new AnatomiaPatologica();
		Consulta consulta = new Consulta();
		consulta.setIdconsulta(anotomiaPatologicaDTO.getIdConsulta());
		anotomiaPatologica.setConsulta(consulta);
		anotomiaPatologica.setApSugestiva(anotomiaPatologicaDTO.getApSugestiva());
		anotomiaPatologica.setBaseDiag(anotomiaPatologicaDTO.getBaseDiag());
		anotomiaPatologica.setBaseDiagCirugia(anotomiaPatologicaDTO.getBaseDiagCirugia());
		anotomiaPatologica.setBiopsia(anotomiaPatologicaDTO.getBiopsia());
		anotomiaPatologica.setDiagHistologico(anotomiaPatologicaDTO.getDiagHistologico());
		anotomiaPatologica.setDiagnosticadoEn(anotomiaPatologicaDTO.getDiagnosticadoEn());
		anotomiaPatologica.setExpresionConserv(anotomiaPatologicaDTO.getExpresionConserv());
		try {
			anotomiaPatologica.setFechaDiag(dateFormatter.parse(anotomiaPatologicaDTO.getFechaDiag()));

		} catch (ParseException e) {
			LOG.error(e.getMessage());
			e.printStackTrace();
		}

		anotomiaPatologica.setGradoDif(anotomiaPatologicaDTO.getGradoDif());
		anotomiaPatologica.setIhq(anotomiaPatologicaDTO.getIhq());

		AnotomiaPatologicaDAO anotomiaPatologicaDAO = DAOLocator.getInstance().lookup(
				AnotomiaPatologicaDAO.class.getName());

		if (anotomiaPatologicaDTO.getIdanotomia() != -1L) {
			anotomiaPatologica.setIdanotomia(anotomiaPatologicaDTO.getIdanotomia());
			return anotomiaPatologicaDAO.updateAnotomiaPatologica(anotomiaPatologica);
		} else {
			return anotomiaPatologicaDAO.saveNewAnotomiaPatologica(anotomiaPatologica);
		}

	}

	public TratamientoDTO loadTratamiento(Long idConsulta) {
		TratamientoDAO tratamientoDAO = DAOLocator.getInstance().lookup(TratamientoDAO.class.getName());
		Tratamiento tratamiento = tratamientoDAO.loadTratamientoByConsulta(idConsulta);
		TratamientoDTO tratamientoDTO = null;
		if (tratamiento != null) {
			tratamientoDTO = new TratamientoDTO();
			tratamientoDTO.setCirugia(tratamiento.getCirugia());
			tratamientoDTO.setIdConsulta(idConsulta);
			tratamientoDTO.setIdtratamiento(tratamiento.getIdtratamiento());
			tratamientoDTO.setQuimioOtra(tratamiento.getQuimioOtra());
			tratamientoDTO.setQuimioteInducNroCiclos(tratamiento.getQuimioteInducNroCiclos());
			tratamientoDTO.setQuimioteInterNroCiclos(tratamiento.getQuimioteInterNroCiclos());
			tratamientoDTO.setQuimioterapiaInduc(tratamiento.getQuimioterapiaInduc());
			tratamientoDTO.setQuimioterapiaInter(tratamiento.getQuimioterapiaInter());
			tratamientoDTO.setUdaondo(tratamiento.getUdaondo());
		}
		return tratamientoDTO;
	}

	public Long saveTratamiento(TratamientoDTO tratamientoDTO) {

		Tratamiento tratamiento = new Tratamiento();
		Consulta consulta = new Consulta();
		consulta.setIdconsulta(tratamientoDTO.getIdConsulta());
		tratamiento.setConsulta(consulta);
		tratamiento.setCirugia(tratamientoDTO.getCirugia());
		tratamiento.setQuimioOtra(tratamientoDTO.getQuimioOtra());
		tratamiento.setQuimioteInducNroCiclos(tratamientoDTO.getQuimioteInducNroCiclos());
		tratamiento.setQuimioteInterNroCiclos(tratamientoDTO.getQuimioteInterNroCiclos());
		tratamiento.setQuimioterapiaInduc(tratamientoDTO.getQuimioterapiaInduc());
		tratamiento.setQuimioterapiaInter(tratamientoDTO.getQuimioterapiaInter());
		tratamiento.setUdaondo(tratamientoDTO.getUdaondo());

		TratamientoDAO tratamientoDAO = DAOLocator.getInstance().lookup(TratamientoDAO.class.getName());

		if (tratamientoDTO.getIdtratamiento() != -1L) {
			tratamiento.setIdtratamiento(tratamientoDTO.getIdtratamiento());
			return tratamientoDAO.updateTratamiento(tratamiento);
		} else {
			return tratamientoDAO.saveNewTratamiento(tratamiento);
		}
	}

	public DescTrataNeoDTO loadDescTrataNeoadyuante(Long idConsulta) {
		DescTrataNeoDAO descTrataNeoDAO = DAOLocator.getInstance().lookup(DescTrataNeoDAO.class.getName());
		DescTrataNeo descTrataNeo = descTrataNeoDAO.loadDescTrataNeoByConsulta(idConsulta);
		DescTrataNeoDTO descTrataNeoDTO = null;
		if (descTrataNeo != null) {
			descTrataNeoDTO = new DescTrataNeoDTO();
			descTrataNeoDTO.setIdConsulta(idConsulta);
			descTrataNeoDTO.setIddesctrataneo(descTrataNeo.getIddesctrataneo());
			descTrataNeoDTO.setQuimioEsquema(descTrataNeo.getQuimioEsquema());
			descTrataNeoDTO.setQuimioNroCiclos(descTrataNeo.getQuimioNroCiclos());
			if (descTrataNeo.getQuimioFechaFinal() != null) {
				descTrataNeoDTO.setQuimioFechaFinal(dateFormatter.format(descTrataNeo.getQuimioFechaFinal()));
			}
			if (descTrataNeo.getQuimioFechaInicio() != null) {
				descTrataNeoDTO
						.setQuimioFechaInicio(dateFormatter.format(descTrataNeo.getQuimioFechaInicio()));
			}
			if (descTrataNeo.getRadioFechaFinal() != null) {
				descTrataNeoDTO.setRadioFechaFinal(dateFormatter.format(descTrataNeo.getRadioFechaFinal()));
			}
			if (descTrataNeo.getRadioFechaInicio() != null) {
				descTrataNeoDTO.setRadioFechaInicio(dateFormatter.format(descTrataNeo.getRadioFechaInicio()));
			}
			descTrataNeoDTO.setRadioDosis(descTrataNeo.getRadioDosis());
			descTrataNeoDTO.setRadioSuspendio(descTrataNeo.getRadioSuspendio());
			descTrataNeoDTO.setRadioterapia(descTrataNeo.getRadioterapia());
			descTrataNeoDTO.setToxGrado(descTrataNeo.getToxGrado());
			descTrataNeoDTO.setToxicidad(descTrataNeo.getToxicidad());
		}
		return descTrataNeoDTO;
	}

	public Long saveDescTrataNeoadyuante(DescTrataNeoDTO descTrataNeoDTO) {

		DescTrataNeo descTrataNeo = new DescTrataNeo();
		Consulta consulta = new Consulta();
		consulta.setIdconsulta(descTrataNeoDTO.getIdConsulta());
		descTrataNeo.setConsulta(consulta);
		descTrataNeo.setQuimioEsquema(descTrataNeoDTO.getQuimioEsquema());

		try {
			descTrataNeo.setQuimioFechaFinal(dateFormatter.parse(descTrataNeoDTO.getQuimioFechaFinal()));
			descTrataNeo.setQuimioFechaInicio(dateFormatter.parse(descTrataNeoDTO.getQuimioFechaInicio()));
			descTrataNeo.setRadioFechaFinal(dateFormatter.parse(descTrataNeoDTO.getRadioFechaFinal()));
			descTrataNeo.setRadioFechaInicio(dateFormatter.parse(descTrataNeoDTO.getRadioFechaInicio()));

		} catch (ParseException e) {
			LOG.error(e.getMessage());
			e.printStackTrace();
		}

		descTrataNeo.setQuimioNroCiclos(descTrataNeoDTO.getQuimioNroCiclos());
		descTrataNeo.setRadioDosis(descTrataNeoDTO.getRadioDosis());
		descTrataNeo.setRadioSuspendio(descTrataNeoDTO.getRadioSuspendio());
		descTrataNeo.setRadioterapia(descTrataNeoDTO.getRadioterapia());
		descTrataNeo.setToxGrado(descTrataNeoDTO.getToxGrado());
		descTrataNeo.setToxicidad(descTrataNeoDTO.getToxicidad());

		DescTrataNeoDAO descTrataNeoDAO = DAOLocator.getInstance().lookup(DescTrataNeoDAO.class.getName());

		if (descTrataNeoDTO.getIddesctrataneo() != -1L) {
			descTrataNeo.setIddesctrataneo(descTrataNeoDTO.getIddesctrataneo());
			return descTrataNeoDAO.updateDescTrataNeo(descTrataNeo);
		} else {
			return descTrataNeoDAO.saveNewDescTrataNeo(descTrataNeo);
		}
	}

	public RespuestaTrataNeoDTO loadRespuestaTrataNeoadyuante(Long idConsulta) {
		RespuestaTrataNeoDAO respuestaTrataNeoDAO = DAOLocator.getInstance().lookup(
				RespuestaTrataNeoDAO.class.getName());
		RespuestaTrataNeo respuestaTrataNeo = respuestaTrataNeoDAO
				.loadRespuestaTrataNeoByConsulta(idConsulta);
		RespuestaTrataNeoDTO respuestaTrataNeoDTO = null;
		if (respuestaTrataNeo != null) {
			respuestaTrataNeoDTO = new RespuestaTrataNeoDTO();
			respuestaTrataNeoDTO.setCrm(respuestaTrataNeo.getCrm());
			respuestaTrataNeoDTO.setDepSatelites(respuestaTrataNeo.getDepSatelites());
			respuestaTrataNeoDTO.setEe(respuestaTrataNeo.getEe());
			if (respuestaTrataNeo.getEeFecha() != null) {
				respuestaTrataNeoDTO.setEeFecha(dateFormatter.format(respuestaTrataNeo.getEeFecha()));
			}
			respuestaTrataNeoDTO.setEeInfiltraEsf(respuestaTrataNeo.getEeInfiltraEsf());
			respuestaTrataNeoDTO.setEmvi(respuestaTrataNeo.getEmvi());
			respuestaTrataNeoDTO.setEstadifTumor(respuestaTrataNeo.getEstadifTumor());
			respuestaTrataNeoDTO.setEvaRespuesta(respuestaTrataNeo.getEvaRespuesta());
			respuestaTrataNeoDTO.setExaInfiltraEsf(respuestaTrataNeo.getExaInfiltraEsf());
			respuestaTrataNeoDTO.setGangliosImgui(respuestaTrataNeo.getGangliosImgui());
			respuestaTrataNeoDTO.setGangliosLateral(respuestaTrataNeo.getGangliosLateral());
			respuestaTrataNeoDTO.setGradoRegre(respuestaTrataNeo.getGradoRegre());
			respuestaTrataNeoDTO.setIdConsulta(idConsulta);
			respuestaTrataNeoDTO.setIdrespuestatrataneo(respuestaTrataNeo.getIdrespuestatrataneo());
			respuestaTrataNeoDTO.setInfiltraEsf(respuestaTrataNeo.getInfiltraEsf());
			respuestaTrataNeoDTO.setRmAltura(respuestaTrataNeo.getRmAltura());
			respuestaTrataNeoDTO.setRmCentro(respuestaTrataNeo.getRmCentro());
			respuestaTrataNeoDTO.setRmDistAnal(respuestaTrataNeo.getRmDistAnal());
			respuestaTrataNeoDTO.setRmDistEsfinter(respuestaTrataNeo.getRmDistEsfinter());
			respuestaTrataNeoDTO.setRmTumor(respuestaTrataNeo.getRmTumor());
			respuestaTrataNeoDTO.setRsc(respuestaTrataNeo.getRsc());
			respuestaTrataNeoDTO.setRscAltura(respuestaTrataNeo.getRscAltura());
			if (respuestaTrataNeo.getRmFecha() != null) {
				respuestaTrataNeoDTO.setRmFecha(dateFormatter.format(respuestaTrataNeo.getRmFecha()));
			}
			if (respuestaTrataNeo.getRscFecha() != null) {
				respuestaTrataNeoDTO.setRscFecha(dateFormatter.format(respuestaTrataNeo.getRscFecha()));
			}
			if (respuestaTrataNeo.getVccFecha() != null) {
				respuestaTrataNeoDTO.setVccFecha(dateFormatter.format(respuestaTrataNeo.getVccFecha()));
			}
			respuestaTrataNeoDTO.setTactoRectal(respuestaTrataNeo.getTactoRectal());
			respuestaTrataNeoDTO.setVcc(respuestaTrataNeo.getVcc());
			respuestaTrataNeoDTO.setVccAltura(respuestaTrataNeo.getVccAltura());
		}
		return respuestaTrataNeoDTO;
	}

	public Long saveRespuestaTrataNeoadyuante(RespuestaTrataNeoDTO respuestaTrataNeoDTO) {
		RespuestaTrataNeo respuestaTrataNeov = new RespuestaTrataNeo();
		Consulta consulta = new Consulta();
		consulta.setIdconsulta(respuestaTrataNeoDTO.getIdConsulta());
		respuestaTrataNeov.setConsulta(consulta);
		respuestaTrataNeov.setCrm(respuestaTrataNeoDTO.getCrm());
		respuestaTrataNeov.setDepSatelites(respuestaTrataNeoDTO.getDepSatelites());
		respuestaTrataNeov.setEe(respuestaTrataNeoDTO.getEe());
		try {
			if (!respuestaTrataNeoDTO.getEeFecha().isEmpty())
				respuestaTrataNeov.setEeFecha(dateFormatter.parse(respuestaTrataNeoDTO.getEeFecha()));
			if (!respuestaTrataNeoDTO.getRmFecha().isEmpty())
				respuestaTrataNeov.setRmFecha(dateFormatter.parse(respuestaTrataNeoDTO.getRmFecha()));
			if (!respuestaTrataNeoDTO.getRscFecha().isEmpty())
				respuestaTrataNeov.setRscFecha(dateFormatter.parse(respuestaTrataNeoDTO.getRscFecha()));
			if (!respuestaTrataNeoDTO.getVccFecha().isEmpty())
				respuestaTrataNeov.setVccFecha(dateFormatter.parse(respuestaTrataNeoDTO.getVccFecha()));
		} catch (ParseException e) {
			LOG.error(e.getMessage());
			e.printStackTrace();
		}

		respuestaTrataNeov.setEeInfiltraEsf(respuestaTrataNeoDTO.getEeInfiltraEsf());
		respuestaTrataNeov.setEmvi(respuestaTrataNeoDTO.getEmvi());
		respuestaTrataNeov.setEstadifTumor(respuestaTrataNeoDTO.getEstadifTumor());
		respuestaTrataNeov.setEvaRespuesta(respuestaTrataNeoDTO.getEvaRespuesta());
		respuestaTrataNeov.setExaInfiltraEsf(respuestaTrataNeoDTO.getExaInfiltraEsf());
		respuestaTrataNeov.setGangliosImgui(respuestaTrataNeoDTO.getGangliosImgui());
		respuestaTrataNeov.setGangliosLateral(respuestaTrataNeoDTO.getGangliosLateral());
		respuestaTrataNeov.setGradoRegre(respuestaTrataNeoDTO.getGradoRegre());
		respuestaTrataNeov.setInfiltraEsf(respuestaTrataNeoDTO.getInfiltraEsf());
		respuestaTrataNeov.setRmAltura(respuestaTrataNeoDTO.getRmAltura());
		respuestaTrataNeov.setRmCentro(respuestaTrataNeoDTO.getRmCentro());
		respuestaTrataNeov.setRmDistAnal(respuestaTrataNeoDTO.getRmDistAnal());
		respuestaTrataNeov.setRmDistEsfinter(respuestaTrataNeoDTO.getRmDistEsfinter());
		respuestaTrataNeov.setRmTumor(respuestaTrataNeoDTO.getRmTumor());
		respuestaTrataNeov.setRsc(respuestaTrataNeoDTO.getRsc());
		respuestaTrataNeov.setRscAltura(respuestaTrataNeoDTO.getRscAltura());
		respuestaTrataNeov.setTactoRectal(respuestaTrataNeoDTO.getTactoRectal());
		respuestaTrataNeov.setVcc(respuestaTrataNeoDTO.getVcc());
		respuestaTrataNeov.setVccAltura(respuestaTrataNeoDTO.getVccAltura());

		RespuestaTrataNeoDAO respuestaTrataNeoDAO = DAOLocator.getInstance().lookup(
				RespuestaTrataNeoDAO.class.getName());

		if (respuestaTrataNeoDTO.getIdrespuestatrataneo() != -1L) {
			respuestaTrataNeov.setIdrespuestatrataneo(respuestaTrataNeoDTO.getIdrespuestatrataneo());
			return respuestaTrataNeoDAO.updateRespuestaTrataNeo(respuestaTrataNeov);
		} else {
			return respuestaTrataNeoDAO.saveNewRespuestaTrataNeo(respuestaTrataNeov);
		}
	}

	public ConductaPostNeoDTO loadConducataPostNeoAdyuante(Long idConsulta) {
		ConductaPostNeoDAO conductaPostNeoDAO = DAOLocator.getInstance().lookup(
				ConductaPostNeoDAO.class.getName());
		ConductaPostNeo conductaPostNeo = conductaPostNeoDAO.loadConductaPostNeoByConsulta(idConsulta);
		ConductaPostNeoDTO conductaPostNeoDTO = null;
		if (conductaPostNeo != null) {
			conductaPostNeoDTO = new ConductaPostNeoDTO();
			conductaPostNeoDTO.setCirugia(conductaPostNeo.getCirugia());
			conductaPostNeoDTO.setCirujano(conductaPostNeo.getCirujano());
			if (conductaPostNeo.getFechaInicio() != null) {
				conductaPostNeoDTO.setFechaInicio(dateFormatter.format(conductaPostNeo.getFechaInicio()));
			}
			conductaPostNeoDTO.setIdconductapostneo(conductaPostNeo.getIdconductapostneo());
			conductaPostNeoDTO.setIdConsulta(idConsulta);
			conductaPostNeoDTO.setMilesCilindrico(conductaPostNeo.getMilesCilindrico());
			conductaPostNeoDTO.setUrgencia(conductaPostNeo.getUrgencia());
			if (conductaPostNeo.getUrgenciaFecha() != null) {
				conductaPostNeoDTO.setUrgenciaFecha(dateFormatter.format(conductaPostNeo.getUrgenciaFecha()));
			}
			conductaPostNeoDTO.setWaitAndSee(conductaPostNeo.getWS());
		}
		return conductaPostNeoDTO;
	}

	public Long saveConducataPostNeoAdyuante(ConductaPostNeoDTO conductaPostNeoDTO) {
		ConductaPostNeo conductaPostNeo = new ConductaPostNeo();
		Consulta consulta = new Consulta();
		consulta.setIdconsulta(conductaPostNeoDTO.getIdConsulta());
		conductaPostNeo.setConsulta(consulta);
		conductaPostNeo.setCirugia(conductaPostNeoDTO.getCirugia());
		conductaPostNeo.setCirujano(conductaPostNeoDTO.getCirujano());
		try {
			conductaPostNeo.setFechaInicio(dateFormatter.parse(conductaPostNeoDTO.getFechaInicio()));
			conductaPostNeo.setUrgenciaFecha(dateFormatter.parse(conductaPostNeoDTO.getUrgenciaFecha()));
		} catch (ParseException e) {
			LOG.error(e.getMessage());
			e.printStackTrace();
		}
		conductaPostNeo.setMilesCilindrico(conductaPostNeoDTO.getMilesCilindrico());
		conductaPostNeo.setUrgencia(conductaPostNeoDTO.getUrgencia());
		conductaPostNeo.setWS(conductaPostNeoDTO.getWaitAndSee());

		ConductaPostNeoDAO conductaPostNeoDAO = DAOLocator.getInstance().lookup(
				ConductaPostNeoDAO.class.getName());

		if (conductaPostNeoDTO.getIdconductapostneo() != -1L) {
			conductaPostNeo.setIdconductapostneo(conductaPostNeoDTO.getIdconductapostneo());
			return conductaPostNeoDAO.updateConductaPostNeo(conductaPostNeo);
		} else {
			return conductaPostNeoDAO.saveNewConductaPostNeo(conductaPostNeo);
		}
	}

	public AnatomiaPatologicaPostDTO loadAnatomiaPatologicaPost(Long idConsulta) {
		AnatomiaPatologicaPostDAO anatomiaPatologicaPostDAO = DAOLocator.getInstance().lookup(
				AnatomiaPatologicaPostDAO.class.getName());
		AnatomiaPatologicaPost anatomiaPatologicaPost = anatomiaPatologicaPostDAO
				.loadAnatomiaPatologicaPostByConsulta(idConsulta);
		AnatomiaPatologicaPostDTO anatomiaPatologicaPostDTO = null;
		if (anatomiaPatologicaPost != null) {
			anatomiaPatologicaPostDTO = new AnatomiaPatologicaPostDTO();
			anatomiaPatologicaPostDTO.setBuddingTumoral(anatomiaPatologicaPost.getBuddingTumoral());
			anatomiaPatologicaPostDTO.setCap(anatomiaPatologicaPost.getCap());
			anatomiaPatologicaPostDTO.setDiagHisto(anatomiaPatologicaPost.getDiagHisto());
			if (anatomiaPatologicaPost.getFechaAp() != null) {
				anatomiaPatologicaPostDTO
						.setFechaAp(dateFormatter.format(anatomiaPatologicaPost.getFechaAp()));
			}
			anatomiaPatologicaPostDTO.setGanPositivos(anatomiaPatologicaPost.getGanPositivos());
			anatomiaPatologicaPostDTO.setGanResecados(anatomiaPatologicaPost.getGanResecados());
			anatomiaPatologicaPostDTO.setGradoDif(anatomiaPatologicaPost.getGradoDif());
			anatomiaPatologicaPostDTO.setGradoRegresion(anatomiaPatologicaPost.getGradoRegresion());
			anatomiaPatologicaPostDTO.setIdanatomiapatopost(anatomiaPatologicaPost.getIdanatomiapatopost());
			anatomiaPatologicaPostDTO.setIdConsulta(idConsulta);
			anatomiaPatologicaPostDTO.setIhq(anatomiaPatologicaPost.getIhq());
			anatomiaPatologicaPostDTO.setInvPeri(anatomiaPatologicaPost.getInvPeri());
			anatomiaPatologicaPostDTO.setInvVascular(anatomiaPatologicaPost.getInvVascular());
			anatomiaPatologicaPostDTO.setKras(anatomiaPatologicaPost.getKras());
			anatomiaPatologicaPostDTO.setLinfa(anatomiaPatologicaPost.getLinfa());
			anatomiaPatologicaPostDTO.setNroBiopsia(anatomiaPatologicaPost.getNroBiopsia());
			anatomiaPatologicaPostDTO.setPushingBorder(anatomiaPatologicaPost.getPushingBorder());
			anatomiaPatologicaPostDTO.setRtaComPato(anatomiaPatologicaPost.getRtaComPato());
			anatomiaPatologicaPostDTO.setTumor(anatomiaPatologicaPost.getTumor());
		}
		return anatomiaPatologicaPostDTO;
	}

	public Long saveAnatomiaPatologicaPost(AnatomiaPatologicaPostDTO anatomiaPatologicaPostDTO) {
		AnatomiaPatologicaPost anatomiaPatologicaPost = new AnatomiaPatologicaPost();
		Consulta consulta = new Consulta();
		consulta.setIdconsulta(anatomiaPatologicaPostDTO.getIdConsulta());
		anatomiaPatologicaPost.setConsulta(consulta);
		anatomiaPatologicaPost.setBuddingTumoral(anatomiaPatologicaPostDTO.getBuddingTumoral());
		anatomiaPatologicaPost.setCap(anatomiaPatologicaPostDTO.getCap());
		anatomiaPatologicaPost.setDiagHisto(anatomiaPatologicaPostDTO.getDiagHisto());
		try {
			anatomiaPatologicaPost.setFechaAp(dateFormatter.parse(anatomiaPatologicaPostDTO.getFechaAp()));
		} catch (ParseException e) {
			LOG.error(e.getMessage());
			e.printStackTrace();
		}

		anatomiaPatologicaPost.setGanPositivos(anatomiaPatologicaPostDTO.getGanPositivos());
		anatomiaPatologicaPost.setGanResecados(anatomiaPatologicaPostDTO.getGanResecados());
		anatomiaPatologicaPost.setGradoDif(anatomiaPatologicaPostDTO.getGradoDif());
		anatomiaPatologicaPost.setGradoRegresion(anatomiaPatologicaPostDTO.getGradoRegresion());
		anatomiaPatologicaPost.setIhq(anatomiaPatologicaPostDTO.getIhq());
		anatomiaPatologicaPost.setInvPeri(anatomiaPatologicaPostDTO.getInvPeri());
		anatomiaPatologicaPost.setInvVascular(anatomiaPatologicaPostDTO.getInvVascular());
		anatomiaPatologicaPost.setKras(anatomiaPatologicaPostDTO.getKras());
		anatomiaPatologicaPost.setLinfa(anatomiaPatologicaPostDTO.getLinfa());
		anatomiaPatologicaPost.setNroBiopsia(anatomiaPatologicaPostDTO.getNroBiopsia());
		anatomiaPatologicaPost.setPushingBorder(anatomiaPatologicaPostDTO.getPushingBorder());
		anatomiaPatologicaPost.setRtaComPato(anatomiaPatologicaPostDTO.getRtaComPato());
		anatomiaPatologicaPost.setTumor(anatomiaPatologicaPostDTO.getTumor());

		AnatomiaPatologicaPostDAO anatomiaPatologicaPostDAO = DAOLocator.getInstance().lookup(
				AnatomiaPatologicaPostDAO.class.getName());

		if (anatomiaPatologicaPostDTO.getIdanatomiapatopost() != -1L) {
			anatomiaPatologicaPost.setIdanatomiapatopost(anatomiaPatologicaPostDTO.getIdanatomiapatopost());
			return anatomiaPatologicaPostDAO.updateAnatomiaPatologicaPost(anatomiaPatologicaPost);
		} else {
			return anatomiaPatologicaPostDAO.saveNewAnatomiaPatologicaPost(anatomiaPatologicaPost);
		}

	}

	public TratamientoAdyuDTO loadTratamientoAdyuvante(Long idConsulta) {
		TratamientoAdyuDAO tratamientoAdyuDAO = DAOLocator.getInstance().lookup(
				TratamientoAdyuDAO.class.getName());
		TratamientoAdyu tratamientoAdyu = tratamientoAdyuDAO.loadTratamientoAdyuByConsulta(idConsulta);
		TratamientoAdyuDTO tratamientoAdyuDTO = null;
		if (tratamientoAdyu != null) {
			tratamientoAdyuDTO = new TratamientoAdyuDTO();
			tratamientoAdyuDTO.setIdConsulta(idConsulta);
			tratamientoAdyuDTO.setIdtratamientoadyu(tratamientoAdyu.getIdtratamientoadyu());
			tratamientoAdyuDTO.setNotas(tratamientoAdyu.getNotas());
			tratamientoAdyuDTO.setQuimioNroCiclos(tratamientoAdyu.getQuimioNroCiclos());
			tratamientoAdyuDTO.setQuimioterapia(tratamientoAdyu.getQuimioterapia());
			tratamientoAdyuDTO.setRadioDosis(tratamientoAdyu.getRadioDosis());
			if (tratamientoAdyu.getRadioFechaFinal() != null) {
				tratamientoAdyuDTO.setRadioFechaFinal(dateFormatter.format(tratamientoAdyu
						.getRadioFechaFinal()));
			}
			if (tratamientoAdyu.getRadioFechaInicio() != null) {
				tratamientoAdyuDTO.setRadioFechaInicio(dateFormatter.format(tratamientoAdyu
						.getRadioFechaInicio()));
			}
			tratamientoAdyuDTO.setRadioterapia(tratamientoAdyu.getRadioterapia());
			tratamientoAdyuDTO.setSuspendio(tratamientoAdyu.getSuspendio());

		}
		return tratamientoAdyuDTO;
	}

	public Long saveTratamientoAdyuvante(TratamientoAdyuDTO tratamientoAdyuDTO) {
		TratamientoAdyu tratamientoAdyu = new TratamientoAdyu();
		Consulta consulta = new Consulta();
		consulta.setIdconsulta(tratamientoAdyuDTO.getIdConsulta());
		tratamientoAdyu.setConsulta(consulta);
		tratamientoAdyu.setNotas(tratamientoAdyuDTO.getNotas());
		tratamientoAdyu.setQuimioNroCiclos(tratamientoAdyuDTO.getQuimioNroCiclos());
		tratamientoAdyu.setQuimioterapia(tratamientoAdyuDTO.getQuimioterapia());
		tratamientoAdyu.setRadioDosis(tratamientoAdyuDTO.getRadioDosis());
		try {
			tratamientoAdyu.setRadioFechaFinal(dateFormatter.parse(tratamientoAdyuDTO.getRadioFechaFinal()));
			tratamientoAdyu
					.setRadioFechaInicio(dateFormatter.parse(tratamientoAdyuDTO.getRadioFechaInicio()));
		} catch (ParseException e) {
			LOG.error(e.getMessage());
			e.printStackTrace();
		}

		tratamientoAdyu.setRadioterapia(tratamientoAdyuDTO.getRadioterapia());
		tratamientoAdyu.setSuspendio(tratamientoAdyuDTO.getSuspendio());

		TratamientoAdyuDAO tratamientoAdyuDAO = DAOLocator.getInstance().lookup(
				TratamientoAdyuDAO.class.getName());
		if (tratamientoAdyuDTO.getIdtratamientoadyu() != -1L) {
			tratamientoAdyu.setIdtratamientoadyu(tratamientoAdyuDTO.getIdtratamientoadyu());
			return tratamientoAdyuDAO.updateratamientoAdyu(tratamientoAdyu);
		} else {
			return tratamientoAdyuDAO.saveNewTratamientoAdyu(tratamientoAdyu);
		}
	}
}
