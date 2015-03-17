package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.Tratamiento;

public interface TratamientoDAO extends DAO {

	long saveNewTratamiento(Tratamiento preconsulta)
			throws DataAccessException;
	
	long updateTratamiento(Tratamiento  tratamiento) throws DataAccessException;

	Tratamiento loadTratamientoById(final Long idTratamiento)
			throws DataAccessException;

	Tratamiento loadTratamientoByConsulta(final Long idConsulta)
			throws DataAccessException;

}