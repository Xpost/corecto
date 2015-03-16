package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.Preconsulta;

public interface PreconsultaDAO extends DAO {

	long saveNewPreconsulta(Preconsulta preconsulta) throws DataAccessException;

	long updatePreconsulta(Preconsulta preconsulta) throws DataAccessException;

	Preconsulta loadPreconsultaById(final Long idpreconsulta) throws DataAccessException;

	Preconsulta loadPreconsultaByConsulta(final Long idConsulta) throws DataAccessException;

}