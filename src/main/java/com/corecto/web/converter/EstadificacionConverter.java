/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.converter;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.corecto.web.model.pojo.extra.Estadificacion;
import com.corecto.web.resolver.SeparatorMapFieldValueResolver;
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
public class EstadificacionConverter extends AbstractConverter<Estadificacion> {

	@Override
	public List<RenderField> getRenderList() {
		return listRenderFields;
	}

	// @formatter:off
	private Map<String, String> biOptionMap = new ImmutableMap.Builder<String, String>()
			.put("0","Si")
			.put("1","No")
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
			.put("1","N0")
			.put("2","N1a")
			.put("3","N1b")
			.put("4","N2a")
			.put("5","N2b")
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
	
	private Map<String, String> metastasisMap = new ImmutableMap.Builder<String, String>()
			.put("metastaDist1","Ninguna")
			.put("metastaDist2","Hueso")
			.put("metastaDist3","Pulmón")
			.put("metastaDist4","Desc.")
			.put("metastaDist5","Piel y TCS")
			.put("metastaDist6","Cerebro")
			.put("metastaDist7","Ganglios Dist")
			.put("metastaDist8","Ovario")
			.put("metastaDist9","Hígado")
			.build();
	

	private ImmutableList<RenderField> listRenderFields = new ImmutableList.Builder<RenderField>()
			 .add(new RenderField("idestadificacion","idestadificacion",null))
			 .add(new RenderField("sz","RM",null))
			 .add(new RenderField("rmCentro","Centro",null))
			 .add(new RenderField("rmFecha","Fecha",null))
			 .add(new RenderField("rmDistEsfinter","Distancia a la porción superior del esfínter",null))
			 .add(new RenderField("rmDistAnal","Distancia al margen anal",new SimpleMapValueResolver(medidaMap)))
			 .add(new RenderField("rmAltura","Altura",null))
			 .add(new RenderField("rmTumor","T",new SimpleMapValueResolver(tumorMap)))
			 .add(new RenderField("rmTumorN","T_N",new SimpleMapValueResolver(tumorNMap)))
			 .add(new RenderField("crm","CRM",new SimpleMapValueResolver(biOptionStatusMap))) 
			 .add(new RenderField("emvi","EMVI",new SimpleMapValueResolver(emviStatusMap)))		 
			 .add(new RenderField("depSatelites","Depósitos satélites",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("tumoRectoInferior","Estadificación tumores de recto inferior",new SimpleMapValueResolver(estadifRectInfMap)))
			 .add(new RenderField("ganglios","Ganglios Inguinales",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("gangliosLate","Ganglios Laterales",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("infiltraEsfinter","Infiltra Esfinter",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("tcTorax","TC torax",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("tcAbd","TC abdomen-pelvis",new SimpleMapValueResolver(biOptionMap)))	
			 .add(new RenderField("petCt","PET-CT",new SimpleMapValueResolver(biOptionMap)))	
			 .add(new RenderField("mts","MTS",new SimpleMapValueResolver(biOptionMap)))	
			 .add(new RenderField("suv","SUV",null))	
			 .add(new RenderField("sz1","Marcadores tumorales",null))
			 .add(new RenderField("marTumFecha","Fecha_sz1",null))	
			 .add(new RenderField("ceaAumentado","CEA aumentado_sz1",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("ca19","CA 19-9 aumentado_sz1",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("tnmT","TNM T",null))
			 .add(new RenderField("tnmN","TNM N",null))
			 .add(new RenderField("tnmM","TNM M",null))
			 .add(new RenderField("tnmPt","pTNM T",null))
			 .add(new RenderField("tnmPn","pTNM N",null))
			 .add(new RenderField("tnmPm","pTNM M",null))
			 .add(new RenderField("metastasis","Metástasis a distancia",new SeparatorMapValueResolver(metastasisMap)))
			 .add(new RenderField("metastasisOtra","Otra met.",null))			 
			 .add(new RenderField("sz2","Revisión RM en Correcto",null))
			 .add(new RenderField("revRmFecha","Fecha_sz2",null))
			 .add(new RenderField("revDistanEsfinter","Distancia a la porción superior del esfínter_sz2",null))
			 .add(new RenderField("revDistanAnal","Distancia al margen anal_sz2",new SimpleMapValueResolver(medidaMap)))
			 .add(new RenderField("revAltura","Altura_sz2",null))
			 .add(new RenderField("revTumor","T_sz2",new SeparatorMapFieldValueResolver(tumorMap, 0)))
			 .add(new RenderField("revTumor","T_N_sz2",new SeparatorMapFieldValueResolver(tumorN2Map, 1)))
			 .add(new RenderField("revCrm","CRM_sz2",new SimpleMapValueResolver(biOptionStatusMap)))
			 .add(new RenderField("revEmvi","EMVI_sz2",new SimpleMapValueResolver(emviStatusMap)))
			 .add(new RenderField("revEstadifTumores","Estadificación tumores de recto inferior_sz2",new SimpleMapValueResolver(estadifRectInfMap)))
			 .add(new RenderField("revGanIngui","Ganglios Inguinales_sz2",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("revGanLateral","Ganglios Laterales_sz2",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("revInfiltraEsf","Infiltra Esfinter_sz2",new SimpleMapValueResolver(biOptionMap)))
			 .build();
	


	
}