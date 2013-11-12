package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.RespuestaTrataNeo;

public interface RespuestaTrataNeoDAO {

	public  long saveNewRespuestaTrataNeo(RespuestaTrataNeo respuestaTrataNeo)
			throws DataAccessException;

	public  RespuestaTrataNeo loadRespuestaTrataNeoById(final Long idRespuestaTrataNeo)
			throws DataAccessException;

	public  RespuestaTrataNeo loadRespuestaTrataNeoByConsulta(final Long idConsulta)
			throws DataAccessException;

}