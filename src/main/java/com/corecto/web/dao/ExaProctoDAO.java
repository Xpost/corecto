package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.ExaProcto;

public interface ExaProctoDAO {

	public  long saveNewExaProcto(ExaProcto exaProcto)
			throws DataAccessException;

	public  ExaProcto loadExaProctoById(final Long idExaProcto)
			throws DataAccessException;

	public  ExaProcto loadExaProctoByConsulta(final Long idConsulta)
			throws DataAccessException;

}