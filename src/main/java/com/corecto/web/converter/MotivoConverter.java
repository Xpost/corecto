/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.converter;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.corecto.web.model.pojo.extra.Motivo;
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
public class MotivoConverter extends AbstractConverter<Motivo> {

	@Override
	public List<RenderField> getRenderList() {
		return listRenderFields;
	}

	// @formatter:off
	Map<String, String> motivoMap = new ImmutableMap.Builder<String, String>()
			.put("motivo1","Dolor abodminal")
			.put("motivo2","Dolor pelviano")
			.put("motivo3","Enterorragia")
			.put("motivo4","Diarrea")
			.put("motivo5","Tumor palpable")
			.put("motivo6","Perdida de peso")
			.put("motivo7","Constipación")
			.put("motivo8","Adenopatías").build();
	

	private ImmutableList<RenderField> listRenderFields = new ImmutableList.Builder<RenderField>()
			 .add(new RenderField("idmotivo","idmotivo",null))
			 .add(new RenderField("motivo","Motivo de la consulta",new SeparatorMapValueResolver(motivoMap)))
			 .add(new RenderField("motivoOtro","Otro motivo",null))
			 .add(new RenderField("fechaInicio","Fecha de inicio de sintomas",null))
			 .add(new RenderField("evoMeses","Tiempo de evolución en meses",null))
			 .build();


	

	
	

}