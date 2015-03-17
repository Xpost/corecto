package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.EvaClinica;

public interface EvaClinicaDAO extends DAO {

	long saveNewEvaClinica(EvaClinica preconsulta) throws DataAccessException;

	long updateEvaClinica(EvaClinica evaClinica) throws DataAccessException;

	EvaClinica loadEvaClinicaById(final Long idevaclinica) throws DataAccessException;

	EvaClinica loadEvaClinicaByConsulta(final Long idConsulta) throws DataAccessException;

}