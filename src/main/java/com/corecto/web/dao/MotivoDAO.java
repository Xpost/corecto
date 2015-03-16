package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.Motivo;

public interface MotivoDAO extends DAO {

	long saveNewMotivo(Motivo preconsulta) throws DataAccessException;

	long updateMotivo(Motivo motivo) throws DataAccessException;

	Motivo loadMotivoById(final Long idMotivo) throws DataAccessException;

	Motivo loadMotivoByConsulta(final Long idConsulta) throws DataAccessException;

}