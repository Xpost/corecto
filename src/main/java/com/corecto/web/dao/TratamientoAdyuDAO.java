package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.TratamientoAdyu;

public interface TratamientoAdyuDAO extends DAO {

	long saveNewTratamientoAdyu(TratamientoAdyu preconsulta)
			throws DataAccessException;

	long updateratamientoAdyu(TratamientoAdyu  tratamientoAdyu) throws DataAccessException;
	
	TratamientoAdyu loadTratamientoAdyuById(final Long idTratamientoAdyu)
			throws DataAccessException;

	TratamientoAdyu loadTratamientoAdyuByConsulta(final Long idConsulta)
			throws DataAccessException;

}