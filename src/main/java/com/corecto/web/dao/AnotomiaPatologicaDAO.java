package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.AnotomiaPatologica;

public interface AnotomiaPatologicaDAO extends DAO {

	  long saveNewAnotomiaPatologica(AnotomiaPatologica anotomiaPatologica)
			throws DataAccessException;
	
	  long updateAnotomiaPatologica(AnotomiaPatologica  anotomiaPatologica) throws DataAccessException;
	

	  AnotomiaPatologica loadAnotomiaPatologicaById(final Long idAnotomiaPatologica)
			throws DataAccessException;

	  AnotomiaPatologica loadAnotomiaPatologicaByConsulta(final Long idConsulta)
			throws DataAccessException;

}