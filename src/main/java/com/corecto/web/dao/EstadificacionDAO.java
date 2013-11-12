package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.Estadificacion;

public interface EstadificacionDAO {

	public  long saveNewEstadificacion(Estadificacion preconsulta)
			throws DataAccessException;

	public  Estadificacion loadEstadificacionById(final Long idEstadificacion)
			throws DataAccessException;

	public  Estadificacion loadEstadificacionByConsulta(final Long idConsulta)
			throws DataAccessException;

}