/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.converter;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.corecto.web.model.pojo.extra.Antecedentes;
import com.corecto.web.resolver.SeparatorMapValueResolver;
import com.corecto.web.resolver.SimpleMapValueResolver;
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
public class AntecedentesConverter extends AbstractConverter<Antecedentes> {

	@Override
	public List<RenderField> getRenderList() {
		return listRenderFields;
	}

	// @formatter:off
	Map<String, String> antecedentesFamCancerMap = new ImmutableMap.Builder<String, String>()
			.put("checkfamMenorNin","Ninguno")
			.put("checkfamMenor60","Familiar de 1º grado < 60 años")
			.put("checkfamMayor60","Familiar de 1º grado > 60 años")
			.put("checkfamSegundoGrado","Familiar de 2º grado")
			.build();
	
	Map<String, String> antecedentesSindromeMap = new ImmutableMap.Builder<String, String>()
			.put("1","No")
			.put("2","No sabe")
			.put("3","En estudio")
			.put("4","Si")
			.build();
	
	Map<String, String> sindromeCCRHMap = new ImmutableMap.Builder<String, String>()
			.put("checkPAF","PAF")
			.put("checkLYNCH","LYNCH")
			.put("checkMYH","MYH")
			.build();
	

	private ImmutableList<RenderField> listRenderFields = new ImmutableList.Builder<RenderField>()
			 .add(new RenderField("idantecedente","idantecedente",null))
			 .add(new RenderField("sz","Personales",null))
			 .add(new RenderField("personalTabaquismo","Tabaquismo",null))
			 .add(new RenderField("personalCardio","Cardiovasculares",null))
			 .add(new RenderField("personalAlcohol","Alcohólismo",null))
			 .add(new RenderField("personalDbt","DBT",null))
			 .add(new RenderField("personalNinguno","Ninguno",null))
			 .add(new RenderField("personalOtro","Otro",null))
			 .add(new RenderField("sz1","Personales patológicos",null))
			 .add(new RenderField("patologicoNinguno","Ninguno",null))
			 .add(new RenderField("patologicoColitis","Colitis ulcerativa ",null))
			 .add(new RenderField("patologicoAdenoma","Adenoma Velloso",null))
			 .add(new RenderField("patologicoCrohn","Enfermedad de CROHN ",null))
			 .add(new RenderField("patologicoNeoplasia","Neoplasia maligna ",null))
			 .add(new RenderField("neoplasia","Cual neoplasia",null))
			 .add(new RenderField("patologicoHiv","HIV",null))
			 .add(new RenderField("familiarCancer","Familiares de cáncer de colon o recto",new SeparatorMapValueResolver(antecedentesFamCancerMap)))
			 .add(new RenderField("tipoCcrh","Antecedente de Síndrome CCRH",new SimpleMapValueResolver(antecedentesSindromeMap)))
			 .add(new RenderField("antecedentesCcrh","Síndrome CCRH",new SeparatorMapValueResolver(sindromeCCRHMap)))
			 .build();


}