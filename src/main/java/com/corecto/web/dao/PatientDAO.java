package com.corecto.web.dao;

import java.util.Date;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.dto.FilterDTO;
import com.corecto.web.model.dto.PacienteDTO;
import com.corecto.web.model.pojo.extra.CatOs;
import com.corecto.web.model.pojo.extra.Consulta;
import com.corecto.web.model.pojo.extra.Paciente;



public interface PatientDAO extends DAO {

//    Cliente loadClientByName(final String name) throws DataAccessException;
//    
//    void deleteClient(Cliente cliente) throws DataAccessException;
//    
//    Cliente loadClientById(final Integer idClient) throws DataAccessException;
//
//    List<Cliente> getClientsByParameters(final String name,final String lastName, final String cuit, final String score,final String fieldSort, final String sort) throws DataAccessException;
//
//    Integer loadLastClientId() throws DataAccessException;
//    
//    EstadoCli loadEstadoClientById(final Integer idEstadoClient) throws DataAccessException;
//    
//    Localidad loadLocalidadById(final Integer idLocalidad) throws DataAccessException;
//
//
//    List<CatDnitipo> loadAllTypeDni() throws DataAccessException;
//    
//    List<EstadoCli> loadAllClientState() throws DataAccessException;
//
//    String loadLastClientNum() throws DataAccessException ;
	
  List<Paciente> getPatientsByName(final String name, final String fieldSort, final String sort, final int maxResult) throws DataAccessException;
	
  long saveNewConsulta(Consulta  consulta) throws DataAccessException ;

  long saveNewPatient(Paciente  paciente) throws DataAccessException;

  List<CatOs> loadAllCatOS() throws DataAccessException;
  
  List<PacienteDTO> getPatientsByParameters(final Date initialDate, final Long patientID, final String direction, final String fieldSort, final String sort) throws DataAccessException;

  Consulta loadConsultaByIdClient(long idPaciente) throws DataAccessException;

  Long checkConsultByPatientId(Long  patientId) throws DataAccessException;

  void deletePatient(Paciente paciente) throws DataAccessException;	
  
  List<Paciente> getPatientsByFilter(final FilterDTO filter) throws DataAccessException;

  Paciente loadPatientById(Long idPatient) throws DataAccessException;
  
  long updatePatient(Paciente  paciente) throws DataAccessException;

}
