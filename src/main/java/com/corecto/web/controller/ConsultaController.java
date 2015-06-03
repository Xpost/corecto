/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
import com.corecto.web.service.ConsultaService;
import com.google.common.collect.Maps;

import fr.xebia.audit.Audited;

//import fr.xebia.audit.Audited;

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
@Controller
public class ConsultaController {

	Logger LOG = LoggerFactory.getLogger(ConsultaController.class);

	@Autowired
	ConsultaService consultaService;

	@Audited(message = "Accion: Cargar consulta")
	@RequestMapping(value = "/loadConsultaId.json", method = RequestMethod.GET)
	public @ResponseBody
	long loadConsultaId(HttpServletRequest request, HttpServletResponse response) {
		LOG.info("ConsultaController.loadConsultaId()");
		long returnConsultaId = -1;
		try {
			Object idPatient = request.getSession().getAttribute("PACIENTE_ID");
			if (idPatient != null) {
				returnConsultaId = consultaService.loadConsulta((Long) idPatient);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

		return returnConsultaId;
	}

	@Audited(message = "Accion: Render preconsulta")
	@RequestMapping(value = "/consultInfoData.json", method = RequestMethod.GET)
	public @ResponseBody
	Map<String, Object> renderPreconsulta(
			@RequestParam(value = "idPat", required = false, defaultValue = "") Long idPaciente,
			@RequestParam(value = "dtPart", required = false, defaultValue = "0") int dataPart,
			HttpServletRequest request, HttpServletResponse response) {
		LOG.info("ConsultaController.renderPreconsulta()");
		Map<String, Object> consultaDataRendered = Maps.newHashMap();
		try {
			if (dataPart == 0) {
				consultaDataRendered = consultaService.loadConsultaRenderedFirstData(idPaciente);
			} else if (dataPart == 1) {
				consultaDataRendered = consultaService.loadConsultaRenderedSecondData(idPaciente);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return consultaDataRendered;
	}

	@Audited(message = "Accion: Cargar preconsulta")
	@RequestMapping(value = "/loadPreconsulta", method = RequestMethod.GET)
	public @ResponseBody
	PreconsultaDTO loadPreconsulta(
			@RequestParam(value = "idConsulta", required = false, defaultValue = "") Long idConsulta,
			HttpServletRequest request, HttpServletResponse response) {
		LOG.info("ConsultaController.loadPreconsulta()");
		PreconsultaDTO preconsultaDTO = null;
		try {
			preconsultaDTO = consultaService.loadPreconsulta(idConsulta);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return preconsultaDTO;
	}

	@Audited(message = "Accion: Agregar Preconsulta")
	@RequestMapping(value = "/addNewPreconsulta", method = RequestMethod.POST)
	public @ResponseBody
	long saveNewPresonculta(@RequestBody PreconsultaDTO preconsultaDTO) {
		LOG.info("ConsultaController.saveNewPresonculta()");
		long returnNewId = -1;
		try {
			returnNewId = consultaService.savePreconsulta(preconsultaDTO);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

		return returnNewId;
	}

	@Audited(message = "Accion: Cargar motivo")
	@RequestMapping(value = "/loadMotivo", method = RequestMethod.GET)
	public @ResponseBody
	MotivoDTO loadMotivo(
			@RequestParam(value = "idConsulta", required = false, defaultValue = "") Long idConsulta,
			HttpServletRequest request, HttpServletResponse response) {
		LOG.info("ConsultaController.loadMotivo()");
		MotivoDTO motivoDto = null;
		try {
			motivoDto = consultaService.loadMotivo(idConsulta);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return motivoDto;
	}

	@Audited(message = "Accion: Agregar Motivo")
	@RequestMapping(value = "/addNewMotivo", method = RequestMethod.POST)
	public @ResponseBody
	long saveNewMotivo(@RequestBody MotivoDTO motivoDTO) {
		LOG.info("ConsultaController.saveNewMotivo()");
		long returnNewId = -1;
		try {
			returnNewId = consultaService.saveMotivo(motivoDTO);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

		return returnNewId;
	}

	@Audited(message = "Accion: Cargar antecedentes")
	@RequestMapping(value = "/loadAntecedentes", method = RequestMethod.GET)
	public @ResponseBody
	AntecedentesDTO loadAntecedentes(
			@RequestParam(value = "idConsulta", required = false, defaultValue = "") Long idConsulta,
			HttpServletRequest request, HttpServletResponse response) {
		LOG.info("ConsultaController.loadAntecedentes()");
		AntecedentesDTO antecedentesDTO = null;
		try {
			antecedentesDTO = consultaService.loadAntecedente(idConsulta);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return antecedentesDTO;
	}

	@Audited(message = "Accion: Agregar Antecedente")
	@RequestMapping(value = "/addNewAntecedente", method = RequestMethod.POST)
	public @ResponseBody
	long saveNewAntecedente(@RequestBody AntecedentesDTO antecedentesDTO) {
		LOG.info("ConsultaController.saveNewAntecedente()");
		long returnNewId = -1;
		try {
			returnNewId = consultaService.saveAntecedentes(antecedentesDTO);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

		return returnNewId;
	}

	@Audited(message = "Accion: Cargar Evaluación clinica")
	@RequestMapping(value = "/loadEvaClinica", method = RequestMethod.GET)
	public @ResponseBody
	EvaClinicaDTO loadEvaClinica(
			@RequestParam(value = "idConsulta", required = false, defaultValue = "") Long idConsulta,
			HttpServletRequest request, HttpServletResponse response) {
		LOG.info("ConsultaController.loadEvaClinica()");
		EvaClinicaDTO evaClinicaDTO = null;
		try {
			evaClinicaDTO = consultaService.loadEvaClinica(idConsulta);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return evaClinicaDTO;
	}

	@Audited(message = "Accion: Agregar Evaluacion clinica")
	@RequestMapping(value = "/addNewEvaClinica", method = RequestMethod.POST)
	public @ResponseBody
	long saveNewEvaClinica(@RequestBody EvaClinicaDTO evaClinicaDTO) {
		LOG.info("ConsultaController.saveNewEvaClinica()");
		long returnNewId = -1;
		try {
			returnNewId = consultaService.saveEvaClinica(evaClinicaDTO);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

		return returnNewId;
	}

	@Audited(message = "Accion: Cargar Examen proctológico")
	@RequestMapping(value = "/loadExaProctologico", method = RequestMethod.GET)
	public @ResponseBody
	ExaProctoDTO loadExaProctologico(
			@RequestParam(value = "idConsulta", required = false, defaultValue = "") Long idConsulta,
			HttpServletRequest request, HttpServletResponse response) {
		LOG.info("ConsultaController.loadExaProctologico()");
		ExaProctoDTO exaProctoDTO = null;
		try {
			exaProctoDTO = consultaService.loadExaProctologico(idConsulta);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return exaProctoDTO;
	}

	@Audited(message = "Accion: Agregar examen proctológico")
	@RequestMapping(value = "/addNewExaProcto", method = RequestMethod.POST)
	public @ResponseBody
	long saveNewExaProctologico(@RequestBody ExaProctoDTO exaProctoDTO) {
		LOG.info("ConsultaController.saveNewExaProctologico()");
		long returnNewId = -1;
		try {
			returnNewId = consultaService.saveExaProctologico(exaProctoDTO);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

		return returnNewId;
	}

	@Audited(message = "Accion: Cargar Estadificación")
	@RequestMapping(value = "/loadEstadificacion", method = RequestMethod.GET)
	public @ResponseBody
	EstadificacionDTO loadEstadificacion(
			@RequestParam(value = "idConsulta", required = false, defaultValue = "") Long idConsulta,
			HttpServletRequest request, HttpServletResponse response) {
		LOG.info("ConsultaController.loadEstadificacion()");
		EstadificacionDTO estadificacionDTO = null;
		try {
			estadificacionDTO = consultaService.loadEstadificacion(idConsulta);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return estadificacionDTO;
	}

	@Audited(message = "Accion: Agregar Estadificacion")
	@RequestMapping(value = "/addNewEstadificacion", method = RequestMethod.POST)
	public @ResponseBody
	long saveNewEstadificacion(@RequestBody EstadificacionDTO estadificacionDTO) {
		LOG.info("ConsultaController.saveNewEstadificacion()");
		long returnNewId = -1;
		try {
			returnNewId = consultaService.saveEstadificacion(estadificacionDTO);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

		return returnNewId;
	}

	@Audited(message = "Accion: Cargar Anatomia Patalogica")
	@RequestMapping(value = "/loadAnaPatologica", method = RequestMethod.GET)
	public @ResponseBody
	AnotomiaPatologicaDTO loadAnaPatologica(
			@RequestParam(value = "idConsulta", required = false, defaultValue = "") Long idConsulta,
			HttpServletRequest request, HttpServletResponse response) {
		LOG.info("ConsultaController.loadAnaPatologica()");
		AnotomiaPatologicaDTO anotomiaPatologicaDTO = null;
		try {
			anotomiaPatologicaDTO = consultaService.loadAnaPatologica(idConsulta);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return anotomiaPatologicaDTO;
	}

	@Audited(message = "Accion: Agregar Anatomia Patalogica")
	@RequestMapping(value = "/addNewAnaPatologica", method = RequestMethod.POST)
	public @ResponseBody
	long saveNewAnatomiaPagologica(@RequestBody AnotomiaPatologicaDTO anotomiaPatologicaDTO) {
		LOG.info("ConsultaController.saveNewAnatomiaPagologica()");
		long returnNewId = -1;
		try {
			returnNewId = consultaService.saveAnaPatologica(anotomiaPatologicaDTO);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

		return returnNewId;
	}

	@Audited(message = "Accion: Cargar Tratamiento")
	@RequestMapping(value = "/loadTratamiento", method = RequestMethod.GET)
	public @ResponseBody
	TratamientoDTO loadTratamiento(
			@RequestParam(value = "idConsulta", required = false, defaultValue = "") Long idConsulta,
			HttpServletRequest request, HttpServletResponse response) {
		LOG.info("ConsultaController.loadTratamiento()");
		TratamientoDTO tratamientoDTO = null;
		try {
			tratamientoDTO = consultaService.loadTratamiento(idConsulta);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tratamientoDTO;
	}

	@Audited(message = "Accion: Agregar Tratamiento")
	@RequestMapping(value = "/addTratamiento", method = RequestMethod.POST)
	public @ResponseBody
	long saveNewTratamiento(@RequestBody TratamientoDTO tratamientoDTO) {
		LOG.info("ConsultaController.saveNewTratamiento()");
		long returnNewId = -1;
		try {
			returnNewId = consultaService.saveTratamiento(tratamientoDTO);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

		return returnNewId;
	}

	@Audited(message = "Accion: Cargar Desc Tratamiento NeoAdyuante")
	@RequestMapping(value = "/loadDescTrataNeoadyuante", method = RequestMethod.GET)
	public @ResponseBody
	DescTrataNeoDTO loadDescTrataNeoadyuante(
			@RequestParam(value = "idConsulta", required = false, defaultValue = "") Long idConsulta,
			HttpServletRequest request, HttpServletResponse response) {
		LOG.info("ConsultaController.loadTratamiento()");
		DescTrataNeoDTO descTrataNeoDTO = null;
		try {
			descTrataNeoDTO = consultaService.loadDescTrataNeoadyuante(idConsulta);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return descTrataNeoDTO;
	}

	@Audited(message = "Accion: Agregar Desc Tratamiento NeoAdyuante")
	@RequestMapping(value = "/addNewdescTrataNeoadyuante", method = RequestMethod.POST)
	public @ResponseBody
	long saveNewDescTrataNeoadyuante(@RequestBody DescTrataNeoDTO descTrataNeoDTO) {
		LOG.info("ConsultaController.saveNewDescTrataNeoadyuante()");
		long returnNewId = -1;
		try {
			returnNewId = consultaService.saveDescTrataNeoadyuante(descTrataNeoDTO);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

		return returnNewId;
	}

	@Audited(message = "Accion: Cargar Respuesta NeoAdyuante")
	@RequestMapping(value = "/loadRespuestaNeoadyuante", method = RequestMethod.GET)
	public @ResponseBody
	RespuestaTrataNeoDTO loadRespuestaNeoadyuante(
			@RequestParam(value = "idConsulta", required = false, defaultValue = "") Long idConsulta,
			HttpServletRequest request, HttpServletResponse response) {
		LOG.info("ConsultaController.loadRespuestaNeoadyuante()");
		RespuestaTrataNeoDTO respuestaTrataNeoDTO = null;
		try {
			respuestaTrataNeoDTO = consultaService.loadRespuestaTrataNeoadyuante(idConsulta);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return respuestaTrataNeoDTO;
	}

	@Audited(message = "Accion: Agregar Respuesta NeoAdyuante")
	@RequestMapping(value = "/addNewRespuestaNeoadyuante", method = RequestMethod.POST)
	public @ResponseBody
	long saveNewRespTrataNeoadyuante(@RequestBody RespuestaTrataNeoDTO respuestaTrataNeoDTO) {
		LOG.info("ConsultaController.saveNewRespTrataNeoadyuante()");
		long returnNewId = -1;
		try {
			returnNewId = consultaService.saveRespuestaTrataNeoadyuante(respuestaTrataNeoDTO);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

		return returnNewId;
	}

	@Audited(message = "Accion: Cargar Conducta post neoadyuante")
	@RequestMapping(value = "/loadConductaPostNeoadyuante", method = RequestMethod.GET)
	public @ResponseBody
	ConductaPostNeoDTO loadConductaPostNeoadyuante(
			@RequestParam(value = "idConsulta", required = false, defaultValue = "") Long idConsulta,
			HttpServletRequest request, HttpServletResponse response) {
		LOG.info("ConsultaController.loadConductaPostNeoadyuante()");
		ConductaPostNeoDTO conductaPostNeoDTO = null;
		try {
			conductaPostNeoDTO = consultaService.loadConducataPostNeoAdyuante(idConsulta);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conductaPostNeoDTO;
	}

	@Audited(message = "Accion: Agregar Conducta post neoadyuante")
	@RequestMapping(value = "/addNewConductaPostNeo", method = RequestMethod.POST)
	public @ResponseBody
	long saveNewConductaPostNeoadyuante(@RequestBody ConductaPostNeoDTO conductaPostNeoDTO) {
		LOG.info("ConsultaController.saveNewConductaPostNeoadyuante()");
		long returnNewId = -1;
		try {
			returnNewId = consultaService.saveConducataPostNeoAdyuante(conductaPostNeoDTO);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

		return returnNewId;
	}

	@Audited(message = "Accion: Cargar Anatomia Patologica post")
	@RequestMapping(value = "/loadAnaPatologicaPost", method = RequestMethod.GET)
	public @ResponseBody
	AnatomiaPatologicaPostDTO loadAnaPatologicaPost(
			@RequestParam(value = "idConsulta", required = false, defaultValue = "") Long idConsulta,
			HttpServletRequest request, HttpServletResponse response) {
		LOG.info("ConsultaController.loadAnaPatologicaPost()");
		AnatomiaPatologicaPostDTO patologicaPostDTO = null;
		try {
			patologicaPostDTO = consultaService.loadAnatomiaPatologicaPost(idConsulta);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return patologicaPostDTO;
	}

	@Audited(message = "Accion: Agregar Anatomia Patologica post")
	@RequestMapping(value = "/addNewAnaPatoPost", method = RequestMethod.POST)
	public @ResponseBody
	long saveNewAnaPatologicaPost(@RequestBody AnatomiaPatologicaPostDTO patologicaPostDTO) {
		LOG.info("ConsultaController.saveNewAnaPatologicaPost()");
		long returnNewId = -1;
		try {
			returnNewId = consultaService.saveAnatomiaPatologicaPost(patologicaPostDTO);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

		return returnNewId;
	}

	@Audited(message = "Accion: Cargar Tratamiento adyuvante")
	@RequestMapping(value = "/loadTrataAdyuvante", method = RequestMethod.GET)
	public @ResponseBody
	TratamientoAdyuDTO loadTrataAdyuvante(
			@RequestParam(value = "idConsulta", required = false, defaultValue = "") Long idConsulta,
			HttpServletRequest request, HttpServletResponse response) {
		LOG.info("ConsultaController.loadTrataAdyuvante()");
		TratamientoAdyuDTO tratamientoAdyuDTO = null;
		try {
			tratamientoAdyuDTO = consultaService.loadTratamientoAdyuvante(idConsulta);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tratamientoAdyuDTO;
	}

	@Audited(message = "Accion: Agregar Tratamiento adyuvante")
	@RequestMapping(value = "/addNewTrataAdyuvante", method = RequestMethod.POST)
	public @ResponseBody
	long saveNewTrataAdyuvante(@RequestBody TratamientoAdyuDTO tratamientoAdyuDTO) {
		LOG.info("ConsultaController.saveNewTrataAdyuvante()");
		long returnNewId = -1;
		try {
			returnNewId = consultaService.saveTratamientoAdyuvante(tratamientoAdyuDTO);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

		return returnNewId;
	}

	/*
	 * // @Autowired // EmailSenderService emailSenderService;
	 * 
	 * @Audited(message = "Accion: Busqueda inical de Clientes")
	 * 
	 * @RequestMapping(value = "/searchClientByName", method =
	 * RequestMethod.POST) public @ResponseBody Object[]
	 * searchClientByName(@RequestParam(value = "nameStartWith", required =
	 * false, defaultValue = "") String name,
	 * 
	 * @RequestParam(value = "maxRows", required = false, defaultValue = "5")
	 * int maxRows) { List<ClienteDTO> listClients = new
	 * ArrayList<ClienteDTO>(); try { listClients =
	 * clientService.listClientsByName(name,"","", maxRows); } catch (Exception
	 * e) { e.printStackTrace(); }
	 * 
	 * return listClients.toArray(); }
	 * 
	 * 
	 * 
	 * 
	 * 
	 * @RequestMapping(value = "/editClient", method = RequestMethod.POST)
	 * public @ResponseBody boolean editClient(@RequestBody ClienteDTO
	 * newCliente) { LOG.info("ClientController.editClient()"); try {
	 * clientService.saveorUpdateClient(newCliente); } catch (Exception e) {
	 * e.printStackTrace(); return false; }
	 * 
	 * return true; }
	 * 
	 * 
	 * 
	 * 
	 * // @Audited(message = "Accion: Ver historial pedidos")
	 * 
	 * @RequestMapping(value = "/loadListClientsByParameter", method =
	 * RequestMethod.GET) public @ResponseBody PageResult
	 * loadlistClientsByParameters(@RequestParam(value = "name", required =
	 * false, defaultValue = "") String name,
	 * 
	 * @RequestParam(value = "lastName", required = false, defaultValue = "")
	 * String lastName,
	 * 
	 * @RequestParam(value = "cuit", required = false, defaultValue = "") String
	 * cuit,
	 * 
	 * @RequestParam(value = "score", required = false, defaultValue = "")
	 * String score,
	 * 
	 * @RequestParam(value = "sidx", required = false, defaultValue = "") String
	 * fieldName,
	 * 
	 * @RequestParam(value = "sord", required = false, defaultValue = "") String
	 * order) { LOG.info("ClientController.listClients()"); List<ClienteDTO>
	 * listClientes = new ArrayList<ClienteDTO>(); PageResult pageResult = new
	 * PageResult(); try { listClientes =
	 * clientService.listClientsByParameters(name
	 * .isEmpty()?null:name.toLowerCase(),
	 * lastName.isEmpty()?null:lastName.toLowerCase(), cuit.isEmpty()?null:cuit,
	 * score.isEmpty()?null:score,fieldName,order); pageResult.setPage("1");
	 * pageResult.setTotal("1"); pageResult.setRecords(listClientes.size() +
	 * ""); pageResult.setRows(listClientes); } catch (Exception e) {
	 * e.printStackTrace(); }
	 * 
	 * return pageResult; }
	 * 
	 * @Audited(message = "Accion: Eliminar Cliente")
	 * 
	 * @RequestMapping(value = "/delClient", method = RequestMethod.GET) public
	 * 
	 * @ResponseBody boolean deleteClient(@RequestParam(value = "idClient",
	 * required = false, defaultValue = "") Integer idClient) {
	 * LOG.info("ClientController.deleteClient()"); try {
	 * clientService.deleteClientById(idClient); } catch (Exception e) {
	 * e.printStackTrace(); return false; }
	 * 
	 * return true; }
	 * 
	 * @RequestMapping(value = "/loadClientById", method = RequestMethod.GET)
	 * public @ResponseBody ClienteDTO loadClientById(@RequestParam(value =
	 * "idClient", required = false, defaultValue = "") Integer idClient) {
	 * LOG.info("ClientController.loadClientById()"); ClienteDTO clienteDTO =
	 * null; try { clienteDTO = clientService.loadClientById(idClient); } catch
	 * (Exception e) { e.printStackTrace(); }
	 * 
	 * return clienteDTO; }
	 * 
	 * // @Audited(message = "Accion: Eliminar alertas")
	 * 
	 * @RequestMapping(value = "/loadLastClientNum", method = RequestMethod.GET)
	 * public @ResponseBody Integer loadLastClientId() { Integer lastId = -1;
	 * try { lastId = Integer.parseInt(clientService.loadClientLastNum()); }
	 * catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return lastId; }
	 */

}
