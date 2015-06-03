/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.converter;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.corecto.web.model.pojo.extra.TratamientoAdyu;
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
public class TratamientoAdyuConverter extends AbstractConverter<TratamientoAdyu> {

	@Override
	public List<RenderField> getRenderList() {
		return listRenderFields;
	}

	// @formatter:off
	private Map<String, String> biOptionMap = new ImmutableMap.Builder<String, String>()
			.put("0","No")
			.put("1","Si")
			.build();
	
	private Map<String, String> quimioInducMap = new ImmutableMap.Builder<String, String>()
			.put("0","XELOX")
			.put("1","BFOL")
			.put("2","FOLFOX")
			.put("3","CAPECITABINA")
			.put("4","Otro")
			.build();

	private ImmutableList<RenderField> listRenderFields = new ImmutableList.Builder<RenderField>()
			 .add(new RenderField("idtratamientoadyu","idtratamientoadyu",null))
			 .add(new RenderField("quimioterapia","Hay Tratamiento adyuvante?",new SeparatorMapFieldValueResolver(biOptionMap, 0)))
			 .add(new RenderField("quimioterapia","Quimioterapia",new SeparatorMapFieldValueResolver(quimioInducMap, 1)))
			 .add(new RenderField("quimioterapia","Quimioterapia Otro",new SeparatorMapFieldValueResolver(null, 2)))
			 .add(new RenderField("quimioNroCiclos","N Ciclos",null))
			 .add(new RenderField("radioterapia","Radioterapia",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("radioDosis","Dosis total",null))
			 .add(new RenderField("radioFechaInicio","Fecha inicio",null))
			 .add(new RenderField("radioFechaFinal","Fecha final",null))
			 .add(new RenderField("suspendio","Suspendio",new SeparatorMapFieldValueResolver(biOptionMap, 0)))
			 .add(new RenderField("suspendio","Susp. Dias",new SeparatorMapFieldValueResolver(null, 1)))
			 .add(new RenderField("notas","Notas",null))
			 .build();

	
}