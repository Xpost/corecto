package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.RespuestaTrataNeo;

public interface RespuestaTrataNeoDAO extends DAO {

	long saveNewRespuestaTrataNeo(RespuestaTrataNeo respuestaTrataNeo)
			throws DataAccessException;
	
	long updateRespuestaTrataNeo(RespuestaTrataNeo respuestaTrataNeo) throws DataAccessException;		 
	
	RespuestaTrataNeo loadRespuestaTrataNeoById(final Long idRespuestaTrataNeo)
			throws DataAccessException;

	RespuestaTrataNeo loadRespuestaTrataNeoByConsulta(final Long idConsulta)
			throws DataAccessException;

}