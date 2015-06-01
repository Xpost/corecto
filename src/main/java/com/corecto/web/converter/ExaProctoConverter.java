/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.converter;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.corecto.web.model.pojo.extra.ExaProcto;
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
public class ExaProctoConverter extends AbstractConverter<ExaProcto> {

	@Override
	public List<RenderField> getRenderList() {
		return listRenderFields;
	}

	// @formatter:off
	private Map<String, String> biOptionMap = new ImmutableMap.Builder<String, String>()
			.put("0","No")
			.put("1","Si")
			.build();
	
	private Map<String, String> infiltraEsfMap = new ImmutableMap.Builder<String, String>()
			.put("0","No")
			.put("1","Si")
			.put("2","Esfinter interno")
			.put("3","Esfinter externo")
			.put("4","Poco móvil")
			.build();
	
	private Map<String, String> medidaMap = new ImmutableMap.Builder<String, String>()
			.put("0","0-5cm")
			.put("1","5-10 cm")
			.put("2","10-12 cm")
			.put("3","> 12 cm")
			.build();
	
	private Map<String, String> vccTipoMap = new ImmutableMap.Builder<String, String>()
			.put("0","Completa")
			.put("1","Incompleta")
			.put("2","T.infranqueable")
			.build();
	
	private Map<String, String> eeTipoMap = new ImmutableMap.Builder<String, String>()
			.put("0","1")
			.put("1","2")
			.put("2","3")
			.put("3","4")
			.build();
	
	private Map<String, String> eeTipoNMap = new ImmutableMap.Builder<String, String>()
			.put("1","N0")
			.put("2","N1")
			.put("3","N2")
			.build();

	private ImmutableList<RenderField> listRenderFields = new ImmutableList.Builder<RenderField>()
			 .add(new RenderField("idexaprocto","idexaprocto",null))
			 .add(new RenderField("sz","Tacto rectal",null))
			 .add(new RenderField("tactoRectal","Movil",new SeparatorMapFieldValueResolver(biOptionMap,0)))
			 .add(new RenderField("tactoRectal","Fijo",new SeparatorMapFieldValueResolver(biOptionMap,1)))
			 .add(new RenderField("tactoRectalInfiltra","Infiltra esfinter",new SimpleMapValueResolver(infiltraEsfMap)))
			 .add(new RenderField("sz1","RSC",null))
			 .add(new RenderField("rsc","Presente",new SeparatorMapFieldValueResolver(biOptionMap,0)))
			 .add(new RenderField("rsc","Medida",new SeparatorMapFieldValueResolver(medidaMap,1)))
			 .add(new RenderField("rscAltura","Altura",null))
			 .add(new RenderField("rscFecha","Fecha",null))
			 .add(new RenderField("sz2","VCC",null))
			 .add(new RenderField("vcc","Presente_sz2",new SeparatorMapFieldValueResolver(biOptionMap,0)))
			 .add(new RenderField("vcc","Tipo_sz2",new SeparatorMapFieldValueResolver(vccTipoMap,1)))
			 .add(new RenderField("vcc","Medida_sz2",new SeparatorMapFieldValueResolver(medidaMap,2)))
			 .add(new RenderField("vccAltura","Altura_sz2",null))
			 .add(new RenderField("vccFecha","Fecha_sz2",null))
			 .add(new RenderField("sz3","EE",null))
			 .add(new RenderField("ee","Presente_sz3",new SimpleMapValueResolver(biOptionMap)))	
			 .add(new RenderField("eeTipo","Tipo_sz3",new SimpleMapValueResolver(eeTipoMap)))	
			 .add(new RenderField("eeTipoN","TipoN_sz3",new SimpleMapValueResolver(eeTipoNMap)))	
			 .add(new RenderField("eeInfiltra","Infiltra esfinter_sz3",new SimpleMapValueResolver(biOptionMap)))	
			 .add(new RenderField("eeInfiltraMedida","Medida_sz3",new SimpleMapValueResolver(medidaMap)))	
			 .add(new RenderField("eeFecha","Fecha_sz3",null))	
			 .build();
	
}