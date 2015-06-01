/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.text.WordUtils;
import org.joda.time.LocalDateTime;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.corecto.web.dao.PatientDAO;
import com.corecto.web.dao.impl.DAOLocator;
import com.corecto.web.model.dto.FilterDTO;
import com.corecto.web.model.dto.PacienteDTO;
import com.corecto.web.model.pojo.extra.CatOs;
import com.corecto.web.model.pojo.extra.Paciente;
import com.corecto.web.model.values.PacienteSexo;
import com.corecto.web.service.PatientService;

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
@EnableTransactionManagement(order = 1)
@Service
public class PatientServiceImpl implements PatientService {

	org.slf4j.Logger LOG = LoggerFactory.getLogger(PatientServiceImpl.class);
	private SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy");

	private PatientDAO getPatientDAO() {
		return DAOLocator.getInstance().lookup(PatientDAO.class.getName());
	}

	public long savePatient(PacienteDTO pacienteDTO) {

		Paciente paciente = new Paciente();
		CatOs catOs = new CatOs();
		catOs.setIdos(pacienteDTO.getIdos());
		paciente.setCatOs(catOs);
		paciente.setDireccion(pacienteDTO.getDireccion());
		paciente.setLocalidad(pacienteDTO.getLocalidad());
		try {
			paciente.setFechanac(dateFormatter.parse(pacienteDTO.getFechanac()));
		} catch (ParseException e) {
			LOG.error(e.getMessage());
			e.printStackTrace();
		}
		paciente.setMail(pacienteDTO.getMail());
		paciente.setNombre(pacienteDTO.getNombre());
		paciente.setNroOs(pacienteDTO.getNroOs());
		paciente.setDni(pacienteDTO.getDni());
		paciente.setSexo(pacienteDTO.getSexo());
		String[] numbers = pacienteDTO.getTelefono().split("@@");
		paciente.setTelefono(numbers[0]);
		paciente.setFechaAgregado(LocalDateTime.now().toDate());
		paciente.setAgregadoPor("test");

		return getPatientDAO().saveNewPatient(paciente);

	}

	public void updatePatient(PacienteDTO pacienteDTO) {

		// Try to load Client by Name
		Paciente paciente = getPatientDAO().loadPatientById(pacienteDTO.getIdpaciente());

		paciente.setDireccion(pacienteDTO.getDireccion());
		paciente.setDni(pacienteDTO.getDni());
		CatOs catOs = new CatOs();
		catOs.setIdos(pacienteDTO.getIdos());
		paciente.setCatOs(catOs);
		try {
			if (pacienteDTO.getFechanac() != null && !pacienteDTO.getFechanac().isEmpty()) {
				paciente.setFechanac(dateFormatter.parse(pacienteDTO.getFechanac()));
			}
		} catch (ParseException e) {
			LOG.error(e.getMessage());
			e.printStackTrace();
		}
		paciente.setLocalidad(pacienteDTO.getLocalidad());
		paciente.setMail(pacienteDTO.getMail());
		paciente.setNombre(pacienteDTO.getNombre());
		paciente.setNotas(pacienteDTO.getNotas());
		paciente.setNroOs(pacienteDTO.getNroOs());
		paciente.setSexo(pacienteDTO.getSexo());
		paciente.setTelefono(pacienteDTO.getTelefono());
		paciente.setFechaModificado(LocalDateTime.now().toDate());
		paciente.setModificadoPor("test");

		getPatientDAO().updatePatient(paciente);

	}

	public Long alreadyHasConsultCreated(Long patientID) {

		Long idConsulta = getPatientDAO().checkConsultByPatientId(patientID);

		return idConsulta == null ? -1l : idConsulta;

	}

	public List<PacienteDTO> listPatients(String name, Long patientID, String direction) {
		List<PacienteDTO> resultList = new ArrayList<PacienteDTO>();
		try {
			resultList = getPatientDAO().getPatientsByParameters(patientID, direction);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultList;

	}

	public List<PacienteDTO> listPatientByName(String name, String fieldOrder, String order, int maxResult) {
		List<PacienteDTO> resultList = new ArrayList<PacienteDTO>();
		try {
			List<Paciente> pacientes = getPatientDAO().getPatientsByName(name, fieldOrder, order, maxResult);
			SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy");
			for (Paciente paciente : pacientes) {

				PacienteDTO pacienteDTO = new PacienteDTO();
				pacienteDTO.setDireccion(paciente.getDireccion());
				pacienteDTO.setLocalidad(paciente.getLocalidad());
				if (paciente.getFechanac() != null) {
					pacienteDTO.setFechanac(dateFormatter.format(paciente.getFechanac()));
				}
				pacienteDTO.setIdos(paciente.getCatOs().getIdos());
				pacienteDTO.setIdpaciente(paciente.getIdpaciente());
				pacienteDTO.setMail(paciente.getMail());
				pacienteDTO.setNombre(paciente.getNombre());
				pacienteDTO.setDni(paciente.getDni());
				pacienteDTO.setSexo(PacienteSexo.getPacienteByName(paciente.getSexo()).getValue());
				pacienteDTO.setTelefono(paciente.getTelefono());
				pacienteDTO.setNotas(paciente.getNotas());

				resultList.add(pacienteDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultList;

	}

	public List<PacienteDTO> listPatientByFilter(FilterDTO filterDTO) {
		List<PacienteDTO> resultList = new ArrayList<PacienteDTO>();

		try {
			List<Paciente> pacientes = getPatientDAO().getPatientsByFilter(filterDTO);
			SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy");
			for (Paciente paciente : pacientes) {

				PacienteDTO pacienteDTO = new PacienteDTO();
				pacienteDTO.setDireccion(paciente.getDireccion());
				pacienteDTO.setLocalidad(paciente.getLocalidad());
				if (paciente.getFechanac() != null) {
					pacienteDTO.setFechanac(dateFormatter.format(paciente.getFechanac()));
				}
				pacienteDTO.setIdos(paciente.getCatOs().getIdos());
				pacienteDTO.setIdpaciente(paciente.getIdpaciente());
				pacienteDTO.setMail(paciente.getMail());
				pacienteDTO.setDni(paciente.getDni());
				pacienteDTO.setNombre(WordUtils.capitalize(paciente.getNombre()));
				pacienteDTO.setSexo(PacienteSexo.getPacienteByName(paciente.getSexo()).getValue());
				pacienteDTO.setTelefono(paciente.getTelefono());
				pacienteDTO.setNotas(paciente.getNotas());

				resultList.add(pacienteDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultList;

	}

	public void deletePatientById(Long patientId) {
		Paciente paciente = new Paciente();
		paciente.setIdpaciente(patientId);
		getPatientDAO().deletePatient(paciente);

	}

	/*
	 * 
	 * 
	 * public ClienteDTO loadClientById(Integer clientId) {
	 * LOG.info("loadClientById"); Cliente client =
	 * getClientDAO().loadClientById(clientId); return
	 * clientTransformer.transform(client); }
	 * 
	 * public String loadClientLastNum(){ String lastId= "-1"; try { lastId =
	 * getClientDAO().loadLastClientNum();
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return lastId;
	 * 
	 * }
	 * 
	 * 
	 * 
	 * public ReportData loadCPForReport(Integer ocId){ ReportData reportData =
	 * null; try { Cliente client = getClientDAO().loadClientById(ocId);
	 * reportData = createReportData(client); } catch (Exception e) {
	 * e.printStackTrace(); }
	 * 
	 * return reportData; }
	 * 
	 * private ReportData createReportData(Cliente client) { ReportData
	 * reportData = new ReportData(); ClienteDTO clientDTO =
	 * clientTransformer.transform(client); reportData.setClient(clientDTO); //
	 * if (presup.getFechaentrega()!=null){ //
	 * reportData.setDateDelivery(dateFormatter
	 * .format(presup.getFechaentrega())); // } //
	 * reportData.setDateReport(dateFormatter.format(presup.getFechacompra()));
	 * // reportData.setPayCondition(presup.getCondcompra()); // DecimalFormat
	 * df = new DecimalFormat("##.00"); //
	 * reportData.setTotalPriceOrder(df.format(presup.getPreciototal())); //
	 * reportData.setNumPresupuesto(presup.getNrocompra().toString());
	 * 
	 * // List<ProductReportDTO> productReportDTOs = new
	 * ArrayList<ProductReportDTO>(); // for (ProductoOc product :
	 * presup.getProductoOcs()){ //
	 * productReportDTOs.add(productOCTransformer.transform(product)); // } //
	 * reportData.setItems(productReportDTOs); return reportData; }
	 */

	public Map<String, Object> loadAllAddPatientCat() {
		LOG.info("loadAllAddClientCat");
		Map<String, Object> mapElements = new HashMap<String, Object>();
		try {
			List<CatOs> catOs = getPatientDAO().loadAllCatOS();
			mapElements.put("obraSociales", catOs);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mapElements;

	}

}
