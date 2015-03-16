package com.corecto.web.service;

import java.util.List;
import java.util.Map;

import com.corecto.web.model.dto.FilterDTO;
import com.corecto.web.model.dto.PacienteDTO;



public interface PatientService {


//    void saveorUpdateClient(ClienteDTO clientDTO);
//
//    List<ClienteDTO> listClientsByParameters(String name, String lastName, String cuit, String score, String fieldOrder, String order);
//	
	Map<String,Object> loadAllAddPatientCat();
    long savePatient(PacienteDTO pacienteDTO);
    List<PacienteDTO> listPatients(String name, Long patientID, String direction, String fieldOrder, String order);
    List<PacienteDTO> listPatientByName(String name, String fieldOrder, String order, int maxResult);
    List<PacienteDTO> listPatientByFilter(FilterDTO filterDTO);
    Long alreadyHasConsultCreated(Long patientID);
    void deletePatientById(Long patientId);
    void updatePatient(PacienteDTO pacienteDTO);

//
//	ReportData loadCPForReport(Integer ocId);
//	
//    ClienteDTO loadClientById(Integer clientId);
//
//	String loadClientLastNum();


}
