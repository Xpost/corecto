/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.converter;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.corecto.web.model.pojo.extra.Tratamiento;
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
public class TratamientoConverter extends AbstractConverter<Tratamiento> {

	@Override
	public List<RenderField> getRenderList() {
		return listRenderFields;
	}

	// @formatter:off
	private Map<String, String> biOptionMap = new ImmutableMap.Builder<String, String>()
			.put("0","Si")
			.put("1","No")
			.put("2","Otro")
			.build();
	
	private Map<String, String> quimioradioterapiaMap = new ImmutableMap.Builder<String, String>()
			.put("0","Capecitabina")
			.put("1","Otro")
			.build();
	
	private Map<String, String> quimioInducMap = new ImmutableMap.Builder<String, String>()
			.put("0","XELOX")
			.put("1","BFOL")
			.put("2","FOLFOX")
			.put("3","CAPECITABINA")
			.put("4","Otro")
			.build();
	
	private Map<String, String> quimioInterMap = new ImmutableMap.Builder<String, String>()
			.put("0","Si")
			.put("1","No")
			.put("2","Capecitabina")
			.put("3","Otro")
			.build();
	
	private ImmutableList<RenderField> listRenderFields = new ImmutableList.Builder<RenderField>()
			 .add(new RenderField("idtratamiento","idtratamiento",null))
			 .add(new RenderField("udaondo","Udaondo",new SeparatorMapFieldValueResolver(biOptionMap,0)))
			 .add(new RenderField("udaondo","Udaondo Otro",new SeparatorMapFieldValueResolver(null,1)))
			 .add(new RenderField("cirugia","Cirugía (ir a AP)",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("quimioterapiaInduc","Quimioterapia de inducción",new SeparatorMapFieldValueResolver(quimioInducMap,0)))
			 .add(new RenderField("quimioterapiaInduc","Quim. inducción Otro",new SeparatorMapFieldValueResolver(null,1)))
			 .add(new RenderField("quimioteInducNroCiclos","Quim. inducción N Ciclos:",null))
			 .add(new RenderField("quimioOtra","Quimioradioterapia",new SeparatorMapFieldValueResolver(quimioradioterapiaMap,0)))
			 .add(new RenderField("quimioOtra","Quimioradioterapia Otra",new SeparatorMapFieldValueResolver(null,1)))
			 .add(new RenderField("quimioterapiaInter","Quimioterapia de Intervalo precirugia",new SeparatorMapFieldValueResolver(quimioInterMap,0)))
			 .add(new RenderField("quimioterapiaInter","Quim. Int. precirugia Otra",new SeparatorMapFieldValueResolver(null,1)))
			 .add(new RenderField("quimioteInterNroCiclos","Quim. Int. precirugia N Ciclos",null)) 
			 .build();
	
}