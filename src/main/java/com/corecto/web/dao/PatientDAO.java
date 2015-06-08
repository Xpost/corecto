package com.corecto.web.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.dto.FilterDTO;
import com.corecto.web.model.dto.PacienteDTO;
import com.corecto.web.model.pojo.extra.CatOs;
import com.corecto.web.model.pojo.extra.Consulta;
import com.corecto.web.model.pojo.extra.Paciente;

public interface PatientDAO extends DAO {

	List<Paciente> getPatientsByName(final String name, final String fieldSort, final String sort,
			final int maxResult) throws DataAccessException;

	long saveNewConsulta(Consulta consulta) throws DataAccessException;

	long saveNewPatient(Paciente paciente) throws DataAccessException;

	List<CatOs> loadAllCatOS() throws DataAccessException;

	List<PacienteDTO> getPatientsByParameters(final Long patientID, final String direction)
			throws DataAccessException;

	Consulta loadConsultaByIdClient(long idPaciente) throws DataAccessException;

	Long checkConsultByPatientId(Long patientId) throws DataAccessException;

	void deletePatient(Paciente paciente) throws DataAccessException;

	List<Paciente> getPatientsByFilter(final FilterDTO filter) throws DataAccessException;

	Paciente loadPatientById(Long idPatient) throws DataAccessException;

	long updatePatient(Paciente paciente) throws DataAccessException;

}
