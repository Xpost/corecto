package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.Tratamiento;

public interface TratamientoDAO {

	public  long saveNewTratamiento(Tratamiento preconsulta)
			throws DataAccessException;

	public  Tratamiento loadTratamientoById(final Long idTratamiento)
			throws DataAccessException;

	public  Tratamiento loadTratamientoByConsulta(final Long idConsulta)
			throws DataAccessException;

}