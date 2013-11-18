package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.AnotomiaPatologica;

public interface AnotomiaPatologicaDAO extends DAO {

	public  long saveNewAnotomiaPatologica(AnotomiaPatologica anotomiaPatologica)
			throws DataAccessException;

	public  AnotomiaPatologica loadAnotomiaPatologicaById(final Long idAnotomiaPatologica)
			throws DataAccessException;

	public  AnotomiaPatologica loadAnotomiaPatologicaByConsulta(final Long idConsulta)
			throws DataAccessException;

}