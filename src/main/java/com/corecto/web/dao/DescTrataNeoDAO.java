package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.DescTrataNeo;

public interface DescTrataNeoDAO extends DAO {

	long saveNewDescTrataNeo(DescTrataNeo descTrataNeo)
			throws DataAccessException;
	
	long updateDescTrataNeo(DescTrataNeo  descTrataNeo) throws DataAccessException;

	DescTrataNeo loadDescTrataNeoById(final Long idDescTrataNeo)
			throws DataAccessException;

	DescTrataNeo loadDescTrataNeoByConsulta(final Long idConsulta)
			throws DataAccessException;

}