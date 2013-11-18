package com.corecto.web.dao;

import org.springframework.dao.DataAccessException;

import com.corecto.web.model.pojo.extra.AnatomiaPatologicaPost;

public interface AnatomiaPatologicaPostDAO extends DAO {

	public  long saveNewAnatomiaPatologicaPost(AnatomiaPatologicaPost preconsulta)
			throws DataAccessException;

	public  AnatomiaPatologicaPost loadAnatomiaPatologicaPostById(final Long idAnatomiaPatologicaPost)
			throws DataAccessException;

	public  AnatomiaPatologicaPost loadAnatomiaPatologicaPostByConsulta(final Long idConsulta)
			throws DataAccessException;

}