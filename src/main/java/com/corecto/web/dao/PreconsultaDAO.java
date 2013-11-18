package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.Preconsulta;

public interface PreconsultaDAO extends DAO {

	public  long saveNewPreconsulta(Preconsulta preconsulta)
			throws DataAccessException;

	public  Preconsulta loadPreconsultaById(final Long idpreconsulta)
			throws DataAccessException;

	public  Preconsulta loadPreconsultaByConsulta(final Long idConsulta)
			throws DataAccessException;

}