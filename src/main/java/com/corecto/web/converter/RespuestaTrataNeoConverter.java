/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.converter;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.corecto.web.model.pojo.extra.RespuestaTrataNeo;
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
public class RespuestaTrataNeoConverter extends AbstractConverter<RespuestaTrataNeo> {

	@Override
	public List<RenderField> getRenderList() {
		return listRenderFields;
	}

	// @formatter:off
	private Map<String, String> biOptionMap = new ImmutableMap.Builder<String, String>()
			.put("0","Si")
			.put("1","No")
			.build();
	
	private Map<String, String> biOptionResverseMap = new ImmutableMap.Builder<String, String>()
			.put("1","Si")
			.put("0","No")
			.build();
	
	private Map<String, String> biOptionStatusMap = new ImmutableMap.Builder<String, String>()
			.put("0","Positivo")
			.put("1","Negativo")
			.build();
	
	private Map<String, String> tumorMap = new ImmutableMap.Builder<String, String>()
			.put("0","X")
			.put("1","1")
			.put("2","2")
			.put("3","3a")
			.put("4","3b")
			.put("5","3c")
			.put("6","3d")
			.put("7","4a")
			.put("8","4b")
			.build();
	
	private Map<String, String> tumorNMap = new ImmutableMap.Builder<String, String>()
			.put("0","N0")
			.put("1","N1a")
			.put("2","N1b")
			.put("3","N2a")
			.put("4","N2b")
			.build();
	
	private Map<String, String> tumorN2Map = new ImmutableMap.Builder<String, String>()
			.put("0","N0")
			.put("1","N1")
			.put("2","N2")
			.build();
	
	private Map<String, String> medidaMap = new ImmutableMap.Builder<String, String>()
			.put("0","0-5cm")
			.put("1","5-10 cm")
			.put("2","10-12 cm")
			.put("3","> 12 cm")
			.build();
	
	private Map<String, String> emviStatusMap = new ImmutableMap.Builder<String, String>()
			.put("0","Positivo")
			.put("1","Negativo")
			.put("2","0")
			.put("3","1")
			.put("4","2")
			.put("5","3")
			.put("6","4")
			.build();
	
	private Map<String, String> estadifRectInfMap = new ImmutableMap.Builder<String, String>()
			.put("0","1")
			.put("1","2")
			.put("2","3")
			.put("3","4")
			.build();
	
	private Map<String, String> gradRegresionMap = new ImmutableMap.Builder<String, String>()
			.put("0","5")
			.put("1","4")
			.put("2","3")
			.put("3","2")
			.put("4","1")
			.build();	
	
	private Map<String, String> evalRespMap = new ImmutableMap.Builder<String, String>()
			.put("0","RC")
			.put("1","RP")
			.put("2","EE")
			.put("3","PE")
			.put("4","No evaluable")
			.build();	
	
	private Map<String, String> infiltraEsfinterMap = new ImmutableMap.Builder<String, String>()
			.put("0","No")
			.put("1","Si")
			.put("2","Esfinter interno")
			.put("3","Esfinter externo")
			.put("4","Poco móvil")
			.build();	
	
	private Map<String, String> vccTipoMap = new ImmutableMap.Builder<String, String>()
			.put("0","Completa")
			.put("1","Incompleta")
			.put("2","T.infranqueable")
			.build();		
	

	
	
	private ImmutableList<RenderField> listRenderFields = new ImmutableList.Builder<RenderField>()
			 .add(new RenderField("idrespuestatrataneo","idrespuestatrataneo",null))
			 .add(new RenderField("sz1","RM post tratamiento",null))
			 .add(new RenderField("rmCentro","Centro",null))
			 .add(new RenderField("rmFecha","Fecha",null))
			 .add(new RenderField("rmDistEsfinter","Distancia a la porción superior del esfínter",null))
			 .add(new RenderField("rmDistAnal","Distancia al margen anal",new SimpleMapValueResolver(medidaMap))) 
			 .add(new RenderField("rmAltura","Altura",null))
			 .add(new RenderField("rmTumor","T",new SeparatorMapFieldValueResolver(tumorMap,0)))
			 .add(new RenderField("rmTumor","T_N",new SeparatorMapFieldValueResolver(tumorNMap,1)))
			 .add(new RenderField("crm","CRM",new SimpleMapValueResolver(biOptionStatusMap))) 
			 .add(new RenderField("emvi","EMVI",new SimpleMapValueResolver(emviStatusMap)))		 
			 .add(new RenderField("depSatelites","Depósitos satélites",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("estadifTumor","Estadificación tumores de recto inferior",new SimpleMapValueResolver(estadifRectInfMap)))
			 .add(new RenderField("gradoRegre","Grado de regresión",new SimpleMapValueResolver(gradRegresionMap)))	
			 
			 .add(new RenderField("gangliosImgui","Ganglios Inguinales",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("gangliosLateral","Ganglios Laterales",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("infiltraEsf","Infiltra Esfinter",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("evaRespuesta","Evaluación de la respuesta",new SimpleMapValueResolver(evalRespMap)))
			 .add(new RenderField("sz2","Exámen Proctologico",null))
			 .add(new RenderField("tactoRectal","Tacto rectal Movil",new SeparatorMapFieldValueResolver(biOptionResverseMap,0)))	
			 .add(new RenderField("tactoRectal","Tacto rectal Fijo",new SeparatorMapFieldValueResolver(biOptionResverseMap,1)))	
			 .add(new RenderField("exaInfiltraEsf","Infiltra esfinter_sz2",new SimpleMapValueResolver(infiltraEsfinterMap)))	
			 
			 .add(new RenderField("rsc","RSC Presente",new SeparatorMapFieldValueResolver(biOptionResverseMap,0)))
			 .add(new RenderField("rsc","RSC Medida",new SeparatorMapFieldValueResolver(medidaMap,1)))
			 .add(new RenderField("rscAltura","RSC Altura",null))	
			 .add(new RenderField("rscFecha","RSC Fecha",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("vcc","VCC Presente",new SeparatorMapFieldValueResolver(biOptionResverseMap,0)))
			 .add(new RenderField("vcc","VCC Tipo",new SeparatorMapFieldValueResolver(vccTipoMap,1)))
			 .add(new RenderField("vcc","VCC Medida",new SeparatorMapFieldValueResolver(medidaMap,2)))
			 .add(new RenderField("vccAltura","VCC Altura",null))
			 .add(new RenderField("vccFecha","VCC Fecha",null))
			 .add(new RenderField("ee","EE Presente",new SeparatorMapFieldValueResolver(biOptionResverseMap,0)))
			 .add(new RenderField("ee","EE Tumor",new SeparatorMapFieldValueResolver(estadifRectInfMap,1)))
			 .add(new RenderField("ee","EE Tumor N",new SeparatorMapFieldValueResolver(tumorN2Map,2)))
			 .add(new RenderField("eeInfiltraEsf","EE Infiltra esfinter",new SeparatorMapFieldValueResolver(biOptionResverseMap,0)))
			 .add(new RenderField("eeInfiltraEsf","EE Medida",new SeparatorMapFieldValueResolver(medidaMap,1)))
			 .add(new RenderField("eeFecha","EE Fecha",null))
			 .build();
	



	
}