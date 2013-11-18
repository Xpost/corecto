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
import com.corecto.web.model.dto.DescTrataNeoDTO;
import com.corecto.web.model.dto.EstadificacionDTO;
import com.corecto.web.model.dto.EvaClinicaDTO;
import com.corecto.web.model.dto.ExaProctoDTO;
import com.corecto.web.model.dto.MotivoDTO;
import com.corecto.web.model.dto.PreconsultaDTO;
import com.corecto.web.model.dto.RespuestaTrataNeoDTO;
import com.corecto.web.model.dto.TratamientoAdyuDTO;
import com.corecto.web.model.dto.TratamientoDTO;
import com.corecto.web.model.pojo.extra.AnatomiaPatologicaPost;
import com.corecto.web.model.pojo.extra.AnotomiaPatologica;
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
 * <ul>v
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
		if (consulta==null){
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
		
		return preconsultaDAO.saveNewPreconsulta(preconsulta);
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
		
		return motivoDAO.saveNewMotivo(motivo);
	}



	public Long saveAntecedentes(AntecedentesDTO antecedentesDTO) {
		Antecedentes antecedentes = new Antecedentes();
		Consulta consulta = new Consulta();
		consulta.setIdconsulta(antecedentesDTO.getIdConsulta());
		antecedentes.setConsulta(consulta);
		antecedentes.setAntecedentesCcrh(antecedentesDTO.getAntecedentesCcrh());
		antecedentes.setFamiliarCancer(antecedentesDTO.getFamiliarCancer());
		antecedentes.setNeoplasia(antecedentesDTO.getNeoplasia());
		antecedentes.setPersonales(antecedentesDTO.getPersonales());
		antecedentes.setPersonalesPatologicos(antecedentesDTO.getPersonalesPatologicos());

		AntecedentesDAO antecedentesDAO = DAOLocator.getInstance().lookup(AntecedentesDAO.class.getName());	
		return antecedentesDAO.saveNewAntecedentes(antecedentes);
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
		return evaClinicaDAO.saveNewEvaClinica(evaClinica);
	}



	public Long saveExaProctologico(ExaProctoDTO exaProctoDTO) {
		ExaProcto exaProcto = new ExaProcto();
		Consulta consulta = new Consulta();
		consulta.setIdconsulta(exaProctoDTO.getIdConsulta());
		exaProcto.setConsulta(consulta);
		exaProcto.setEe(exaProctoDTO.getEe());
	     try {
				exaProcto.setEeFecha(dateFormatter.parse(exaProctoDTO.getEeFecha()));
				exaProcto.setVccFecha(dateFormatter.parse(exaProctoDTO.getVccFecha()));
				exaProcto.setRscFecha(dateFormatter.parse(exaProctoDTO.getRscFecha()));
			
		} catch (ParseException e) {
			LOG.error(e.getMessage());
			e.printStackTrace();
		}		
	     
		exaProcto.setEeInfiltra(exaProctoDTO.getEeInfiltra());
		exaProcto.setRsc(exaProctoDTO.getRsc());
		exaProcto.setRscAltura(exaProctoDTO.getRscAltura());
		exaProcto.setTactoRectal(exaProctoDTO.getTactoRectal());
		exaProcto.setTactoRectalInfiltra(exaProctoDTO.getTactoRectalInfiltra());
		exaProcto.setVcc(exaProctoDTO.getVcc());
		exaProcto.setVccAltura(exaProctoDTO.getVccAltura());
		
		ExaProctoDAO exaProctoDAO = DAOLocator.getInstance().lookup(ExaProctoDAO.class.getName());	
		return exaProctoDAO.saveNewExaProcto(exaProcto);	
		
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
		estadificacion.setRevDistanAnal(estadificacionDTO.getRevDistanAnal());
		estadificacion.setRevDistanEsfinter(estadificacionDTO.getRevDistanEsfinter());
		
		estadificacion.setRmTumor(estadificacionDTO.getRmTumor());
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
		
		EstadificacionDAO estadificacionDAO = DAOLocator.getInstance().lookup(EstadificacionDAO.class.getName());	
		return estadificacionDAO.saveNewEstadificacion(estadificacion);
		
	}



	public Long saveAnaPatologica(AnotomiaPatologicaDTO anotomiaPatologicaDTO) {
		AnotomiaPatologica anotomiaPatologica = new AnotomiaPatologica();
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
		
		AnotomiaPatologicaDAO anotomiaPatologicaDAO = DAOLocator.getInstance().lookup(AnotomiaPatologicaDAO.class.getName());	
		return anotomiaPatologicaDAO.saveNewAnotomiaPatologica(anotomiaPatologica);

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
		return tratamientoDAO.saveNewTratamiento(tratamiento);
		
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
		return descTrataNeoDAO.saveNewDescTrataNeo(descTrataNeo);
	}



	public Long saveRespuestaTrataNeoadyuante(
			RespuestaTrataNeoDTO respuestaTrataNeoDTO) {
		RespuestaTrataNeo respuestaTrataNeov= new RespuestaTrataNeo();
		Consulta consulta = new Consulta();
		consulta.setIdconsulta(respuestaTrataNeoDTO.getIdConsulta());
		respuestaTrataNeov.setConsulta(consulta);		
		respuestaTrataNeov.setCrm(respuestaTrataNeoDTO.getCrm());
		respuestaTrataNeov.setDepSatelites(respuestaTrataNeoDTO.getDepSatelites());
		respuestaTrataNeov.setEe(respuestaTrataNeoDTO.getEe());
		try {
			respuestaTrataNeov.setEeFecha(dateFormatter.parse(respuestaTrataNeoDTO.getEeFecha()));
			respuestaTrataNeov.setRmFecha(dateFormatter.parse(respuestaTrataNeoDTO.getRmFecha()));
			respuestaTrataNeov.setRscFecha(dateFormatter.parse(respuestaTrataNeoDTO.getRscFecha()));
			respuestaTrataNeov.setVccFecha(dateFormatter.parse(respuestaTrataNeoDTO.getVccFecha()));
		} catch (ParseException e) {
			LOG.error(e.getMessage());
			e.printStackTrace();
		}
		
		respuestaTrataNeov.setEeInfiltraEsf(respuestaTrataNeoDTO.getEeInfiltraEsf());
		respuestaTrataNeov.setEmvi(respuestaTrataNeoDTO.getEmvi() );
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
		
		RespuestaTrataNeoDAO respuestaTrataNeoDAO = DAOLocator.getInstance().lookup(RespuestaTrataNeoDAO.class.getName());	
		return respuestaTrataNeoDAO.saveNewRespuestaTrataNeo(respuestaTrataNeov);

	}

	public Long saveConducataPostNeoAdyuante(
			ConductaPostNeoDTO conductaPostNeoDTO) {
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
		conductaPostNeo.setWS(conductaPostNeoDTO.getWS());
		
		ConductaPostNeoDAO conductaPostNeoDAO  = DAOLocator.getInstance().lookup(ConductaPostNeoDAO.class.getName());	
		return conductaPostNeoDAO.saveNewConductaPostNeo(conductaPostNeo);
		
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
			tratamientoAdyu.setRadioFechaInicio(dateFormatter.parse(tratamientoAdyuDTO.getRadioFechaInicio()));
		} catch (ParseException e) {
			LOG.error(e.getMessage());
			e.printStackTrace();
		}
		
		tratamientoAdyu.setRadioterapia(tratamientoAdyuDTO.getRadioterapia());
		tratamientoAdyu.setSuspendio(tratamientoAdyuDTO.getSuspendio());
		
		TratamientoAdyuDAO tratamientoAdyuDAO  = DAOLocator.getInstance().lookup(TratamientoAdyuDAO.class.getName());	
		return tratamientoAdyuDAO.saveNewTratamientoAdyu(tratamientoAdyu);
	}



	public Long saveAnatomiaPatologicaPost(
			AnatomiaPatologicaPostDTO anatomiaPatologicaPostDTO) {
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

		AnatomiaPatologicaPostDAO anatomiaPatologicaPostDAO  = DAOLocator.getInstance().lookup(AnatomiaPatologicaPostDAO.class.getName());	
		return anatomiaPatologicaPostDAO.saveNewAnatomiaPatologicaPost(anatomiaPatologicaPost);
	}
}
