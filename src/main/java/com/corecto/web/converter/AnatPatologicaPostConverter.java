/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.converter;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.corecto.web.model.pojo.extra.AnatomiaPatologicaPost;
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
public class AnatPatologicaPostConverter extends AbstractConverter<AnatomiaPatologicaPost> {

	@Override
	public List<RenderField> getRenderList() {
		return listRenderFields;
	}

	// @formatter:off
	private Map<String, String> biOptionMap = new ImmutableMap.Builder<String, String>()
			.put("0","Si")
			.put("1","No")
			.build();
	
	private Map<String, String> biOptionInverseMap = new ImmutableMap.Builder<String, String>()
			.put("0","No")
			.put("1","Si")
			.build();
	
	private Map<String, String> gradoDifMap = new ImmutableMap.Builder<String, String>()
			.put("0","Diferenciado")
			.put("1","Moderadamente diferenciado")
			.put("2","Poco diferenciado")
			.put("3","Indiferenciado")
			.put("4","No determinado")
			.build();

	private Map<String, String> tumorMap = new ImmutableMap.Builder<String, String>()
			.put("0","1")
			.put("1","2")
			.put("2","3")
			.put("3","4a")
			.put("4","4b")
			.build();
	
	private Map<String, String> tumorNMap = new ImmutableMap.Builder<String, String>()
			.put("0","N0")
			.put("1","N1")
			.put("2","N2")
			.build();
	
	private Map<String, String> KRASMap = new ImmutableMap.Builder<String, String>()
			.put("0","WT")
			.put("1","M")
			.build();
	
	
	private ImmutableList<RenderField> listRenderFields = new ImmutableList.Builder<RenderField>()
			 .add(new RenderField("idanatomiapatopost","idanatomiapatopost",null))
			 .add(new RenderField("nroBiopsia","Nº Biopsia",null))
			 .add(new RenderField("fechaAp","Fecha AP",null))
			 .add(new RenderField("diagHisto","Diagnóstico Histológico",null))
			 .add(new RenderField("gradoDif","Grado de diferenciación",new SimpleMapValueResolver(gradoDifMap)))
			 .add(new RenderField("tumor","Tumor",new SeparatorMapFieldValueResolver(tumorMap,0)))
			 .add(new RenderField("tumor","Tumor N",new SeparatorMapFieldValueResolver(tumorNMap,1)))
			 .add(new RenderField("ganResecados","Ganglios resecados",null))
			 .add(new RenderField("ganPositivos","Ganglios positivos",null))
			 .add(new RenderField("invVascular","Invasión Vascular",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("invPeri","Invasión Perineural",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("linfa","Linfatica",new SimpleMapValueResolver(biOptionMap))) 
			 .add(new RenderField("buddingTumoral","Budding Tumoral",new SimpleMapValueResolver(biOptionMap))) 	 
			 .add(new RenderField("pushingBorder","Pushing Border",new SimpleMapValueResolver(biOptionMap))) 
			 .add(new RenderField("gradoRegresion","Grado de regresión Dvorak",null))
			 .add(new RenderField("cap","Grado de regresión CAP",null))
			 .add(new RenderField("rtaComPato","Rta completa patológica",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("ihq","IHQ",new SimpleMapValueResolver(biOptionMap))) 
			 .add(new RenderField("kras","KRAS",new SeparatorMapFieldValueResolver(biOptionInverseMap,0)))
			 .add(new RenderField("kras","KRAS",new SeparatorMapFieldValueResolver(KRASMap,1)))
			 .build();

}