package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.ExaProcto;

public interface ExaProctoDAO extends DAO {

	long saveNewExaProcto(ExaProcto exaProcto) throws DataAccessException;

	long updateExaProcto(ExaProcto exaProcto) throws DataAccessException;

	ExaProcto loadExaProctoById(final Long idExaProcto) throws DataAccessException;

	ExaProcto loadExaProctoByConsulta(final Long idConsulta) throws DataAccessException;

}