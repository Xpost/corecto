package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.EvaClinica;

public interface EvaClinicaDAO {

	public  long saveNewEvaClinica(EvaClinica  preconsulta)
			throws DataAccessException;

	public  EvaClinica loadEvaClinicaById(final Long idevaclinica)
			throws DataAccessException;

	public  EvaClinica loadEvaClinicaByConsulta(final Long idConsulta)
			throws DataAccessException;

}