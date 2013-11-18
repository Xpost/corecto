package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.Motivo;

public interface MotivoDAO extends DAO {

	public  long saveNewMotivo(Motivo preconsulta)
			throws DataAccessException;

	public  Motivo loadMotivoById(final Long idMotivo)
			throws DataAccessException;

	public  Motivo loadMotivoByConsulta(final Long idConsulta)
			throws DataAccessException;

}