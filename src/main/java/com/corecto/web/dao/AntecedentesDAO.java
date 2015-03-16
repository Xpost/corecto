package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.Antecedentes;

public interface AntecedentesDAO extends DAO {

	long saveNewAntecedentes(Antecedentes preconsulta) throws DataAccessException;

	long updateAntecedentes(Antecedentes antecedentes) throws DataAccessException;

	Antecedentes loadAntecedentesById(final Long idAntecedentes) throws DataAccessException;

	Antecedentes loadAntecedentesByConsulta(final Long idConsulta) throws DataAccessException;

}