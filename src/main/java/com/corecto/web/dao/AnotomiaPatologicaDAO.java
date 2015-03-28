package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.AnatomiaPatologica;

public interface AnotomiaPatologicaDAO extends DAO {

	long saveNewAnotomiaPatologica(AnatomiaPatologica anotomiaPatologica) throws DataAccessException;

	long updateAnotomiaPatologica(AnatomiaPatologica anotomiaPatologica) throws DataAccessException;

	AnatomiaPatologica loadAnotomiaPatologicaById(final Long idAnotomiaPatologica) throws DataAccessException;

	AnatomiaPatologica loadAnotomiaPatologicaByConsulta(final Long idConsulta) throws DataAccessException;

}