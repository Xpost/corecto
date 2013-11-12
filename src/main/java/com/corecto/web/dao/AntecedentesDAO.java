package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.Antecedentes;

public interface AntecedentesDAO {

	public  long saveNewAntecedentes(Antecedentes preconsulta)
			throws DataAccessException;

	public  Antecedentes loadAntecedentesById(final Long idAntecedentes)
			throws DataAccessException;

	public  Antecedentes loadAntecedentesByConsulta(final Long idConsulta)
			throws DataAccessException;

}