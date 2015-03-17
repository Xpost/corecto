package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.Estadificacion;

public interface EstadificacionDAO extends DAO {

	  long saveNewEstadificacion(Estadificacion preconsulta)
			throws DataAccessException;
	
	  long updateEstadificacion(Estadificacion estadificacion) throws DataAccessException;

	  Estadificacion loadEstadificacionById(final Long idEstadificacion)
			throws DataAccessException;

	  Estadificacion loadEstadificacionByConsulta(final Long idConsulta)
			throws DataAccessException;

}