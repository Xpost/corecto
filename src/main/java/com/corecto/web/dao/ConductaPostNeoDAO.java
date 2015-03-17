package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.ConductaPostNeo;

public interface ConductaPostNeoDAO extends DAO {

	long saveNewConductaPostNeo(ConductaPostNeo preconsulta)
			throws DataAccessException;
	
	long updateConductaPostNeo(ConductaPostNeo  conductaPostNeo) throws DataAccessException;

	ConductaPostNeo loadConductaPostNeoById(final Long idConductaPostNeo)
			throws DataAccessException;

	ConductaPostNeo loadConductaPostNeoByConsulta(final Long idConsulta)
			throws DataAccessException;

}