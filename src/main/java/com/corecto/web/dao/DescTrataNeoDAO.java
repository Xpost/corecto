package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.DescTrataNeo;

public interface DescTrataNeoDAO extends DAO {

	public  long saveNewDescTrataNeo(DescTrataNeo descTrataNeo)
			throws DataAccessException;

	public  DescTrataNeo loadDescTrataNeoById(final Long idDescTrataNeo)
			throws DataAccessException;

	public  DescTrataNeo loadDescTrataNeoByConsulta(final Long idConsulta)
			throws DataAccessException;

}