/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.converter;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.corecto.web.model.pojo.extra.DescTrataNeo;
import com.corecto.web.resolver.SeparatorMapFieldValueResolver;
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
public class DescTrataNeoConverter extends AbstractConverter<DescTrataNeo> {

	@Override
	public List<RenderField> getRenderList() {
		return listRenderFields;
	}

	// @formatter:off
	private Map<String, String> biOptionMap = new ImmutableMap.Builder<String, String>()
			.put("0","No")
			.put("1","Si")
			.build();
	
	private Map<String, String> biOptionNegatedMap = new ImmutableMap.Builder<String, String>()
			.put("1","No")
			.put("0","Si")
			.build();
	
	private Map<String, String> toxicidadMap = new ImmutableMap.Builder<String, String>()
			.put("0","Quimioterapia")
			.put("1","Radioterapia ")

			.build();

	private ImmutableList<RenderField> listRenderFields = new ImmutableList.Builder<RenderField>()
			 .add(new RenderField("iddesctrataneo","iddesctrataneo",null))
			 .add(new RenderField("radioterapia","Radioterapia",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("radioDosis","Dosis total",null))
			 .add(new RenderField("radioFechaInicio","Fecha inicio",null))
			 .add(new RenderField("radioFechaFinal","Fecha final",null))
			 .add(new RenderField("radioSuspendio","Suspendio",new SeparatorMapFieldValueResolver(biOptionMap, 0)))
			 .add(new RenderField("radioSuspendio","Dias Suspendio",new SeparatorMapFieldValueResolver(null, 1)))
			 .add(new RenderField("quimioEsquema","Hay Quimioterapia?",new SeparatorMapFieldValueResolver(biOptionMap, 0)))
			 .add(new RenderField("quimioEsquema","Esquema",new SeparatorMapFieldValueResolver(null, 1)))
			 .add(new RenderField("quimioNroCiclos","N Ciclos",null))
			 .add(new RenderField("quimioFechaInicio","Quimio Fecha inicio",null))
			 .add(new RenderField("quimioFechaFinal","Quimio Fecha final",null))
			 .add(new RenderField("toxicidad","Toxicidad",new SimpleMapValueResolver(toxicidadMap)))
			 .add(new RenderField("toxGrado","Grado III-IV",new SimpleMapValueResolver(biOptionNegatedMap)))
			 .build();

}