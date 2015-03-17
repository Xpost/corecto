package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.AnatomiaPatologicaPost;

public interface AnatomiaPatologicaPostDAO extends DAO {

	long saveNewAnatomiaPatologicaPost(AnatomiaPatologicaPost preconsulta)
			throws DataAccessException;

	long updateAnatomiaPatologicaPost(AnatomiaPatologicaPost anatomiaPatologicaPost) throws DataAccessException;

		
	AnatomiaPatologicaPost loadAnatomiaPatologicaPostById(final Long idAnatomiaPatologicaPost)
			throws DataAccessException;

	AnatomiaPatologicaPost loadAnatomiaPatologicaPostByConsulta(final Long idConsulta)
			throws DataAccessException;

}