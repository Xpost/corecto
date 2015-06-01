/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.converter;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.corecto.web.model.pojo.extra.EvaClinica;
import com.corecto.web.resolver.SeparatorMapValueResolver;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;

/**
 * TODO comment<br>
 * <br>
 * <b>Change log:</b>
 * <ul>
 * <li>1.0 27/04/2013 - Xpost - initial version</li>
 * </ul>
 * 
 * @author Xpost
 * @version 1.0
 */
@Component
public class EvaClinicaConverter extends AbstractConverter<EvaClinica> {

	@Override
	public List<RenderField> getRenderList() {
		return listRenderFields;
	}

	// @formatter:off
	private Map<String, String> abdomenMap = new ImmutableMap.Builder<String, String>()
			.put("haAbdomen1","Tumor palpable")
			.put("haAbdomen2","Móvil")
			.put("haAbdomen3","Fija")
			.put("haAbdomen4","Hepatomegalia")
			.put("haAbdomen5","Ascitis")
			.build();
	
	private Map<String, String> colonMap = new ImmutableMap.Builder<String, String>()
			.put("haColon1","Ciego")
			.put("haColon2","Apéndice")
			.put("haColon3","Colon ascendente")
			.put("haColon4","Colon descendente")
			.put("haColon5","Colon sigmoideo")
			.put("haColon6","Colon transverso")
			.build();
	
	private Map<String, String> rectoMap = new ImmutableMap.Builder<String, String>()
			.put("haRecto1","Tercio superior")
			.put("haRecto2","Tercio medio")
			.put("haRecto3","Tercio inferior ")
			.build();
	
	private Map<String, String> adenopatiaMap = new ImmutableMap.Builder<String, String>()
			.put("haAdenopatia1","No")
			.put("haAdenopatia2","Inguinales")
			.put("haAdenopatia3","Cervicales")
			.put("haAdenopatia4","Otras")
			.build();

	private ImmutableList<RenderField> listRenderFields = new ImmutableList.Builder<RenderField>()
			 .add(new RenderField("idevaclinica","idevaclinica",null))
			 .add(new RenderField("sz","Hallazgos clínicos",null))
			 .add(new RenderField("abdomen","Abdomen",new SeparatorMapValueResolver(abdomenMap)))
			 .add(new RenderField("colon","Colon",new SeparatorMapValueResolver(colonMap)))
			 .add(new RenderField("recto","Recto",new SeparatorMapValueResolver(rectoMap)))
			 .add(new RenderField("adenopatias","Adenopatias",new SeparatorMapValueResolver(adenopatiaMap)))
			 .add(new RenderField("notas","Notas",null))
			 .build();

}