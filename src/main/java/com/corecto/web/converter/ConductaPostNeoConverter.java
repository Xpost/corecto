/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.converter;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.corecto.web.model.pojo.extra.ConductaPostNeo;
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
public class ConductaPostNeoConverter extends AbstractConverter<ConductaPostNeo> {

	@Override
	public List<RenderField> getRenderList() {
		return listRenderFields;
	}

	// @formatter:off
	private Map<String, String> biOptionMap = new ImmutableMap.Builder<String, String>()
			.put("0","No")
			.put("1","Si")
			.build();
	
	private Map<String, String> procedMap = new ImmutableMap.Builder<String, String>()
			.put("0","RA")
			.put("1","RAUB")
			.build();
	
	private Map<String, String> biOptionNegatedMap = new ImmutableMap.Builder<String, String>()
			.put("0","Si")
			.put("1","No")
			.build();
	
	private ImmutableList<RenderField> listRenderFields = new ImmutableList.Builder<RenderField>()
			 .add(new RenderField("idconductapostneo","idconductapostneo",null))
			 .add(new RenderField("cirugia","Cirugia Presente",new SeparatorMapFieldValueResolver(biOptionMap,0)))
			 .add(new RenderField("cirugia","Cirugia Procedimiento",new SeparatorMapFieldValueResolver(procedMap,1)))
			 .add(new RenderField("milesCilindrico","Miles cilíndrico",new SeparatorMapFieldValueResolver(biOptionNegatedMap,0)))
			 .add(new RenderField("milesCilindrico","Miles cilíndrico Otro",new SeparatorMapFieldValueResolver(null,1)))
			 .add(new RenderField("urgencia","Urgencia",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("urgenciaFecha","Urgencia Fecha",null))
			 .add(new RenderField("cirujano","Cirujano Nombre",null))
			 .add(new RenderField("WS","WAIT AND SEE",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("fechaInicio","Fecha inicio",null))
			 .build();

}