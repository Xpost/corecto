package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.TratamientoAdyu;

public interface TratamientoAdyuDAO {

	public  long saveNewTratamientoAdyu(TratamientoAdyu preconsulta)
			throws DataAccessException;

	public  TratamientoAdyu loadTratamientoAdyuById(final Long idTratamientoAdyu)
			throws DataAccessException;

	public  TratamientoAdyu loadTratamientoAdyuByConsulta(final Long idConsulta)
			throws DataAccessException;

}