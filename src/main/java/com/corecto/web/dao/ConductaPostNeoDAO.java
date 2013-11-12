package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.ConductaPostNeo;

public interface ConductaPostNeoDAO {

	public  long saveNewConductaPostNeo(ConductaPostNeo preconsulta)
			throws DataAccessException;

	public  ConductaPostNeo loadConductaPostNeoById(final Long idConductaPostNeo)
			throws DataAccessException;

	public  ConductaPostNeo loadConductaPostNeoByConsulta(final Long idConsulta)
			throws DataAccessException;

}