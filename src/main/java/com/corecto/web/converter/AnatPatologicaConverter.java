/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.converter;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.corecto.web.model.pojo.extra.AnatomiaPatologica;
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
public class AnatPatologicaConverter extends AbstractConverter<AnatomiaPatologica> {

	@Override
	public List<RenderField> getRenderList() {
		return listRenderFields;
	}

	// @formatter:off
	private Map<String, String> biOptionMap = new ImmutableMap.Builder<String, String>()
			.put("0","Si")
			.put("1","No")
			.build();
	
	private Map<String, String> gradoDif = new ImmutableMap.Builder<String, String>()
			.put("0","Diferenciado")
			.put("1","Moderadamente diferenciado")
			.put("2","Poco diferenciado")
			.put("3","Indiferenciado")
			.put("4","Anillo de sello")
			.put("5","Mucina")
			.build();
	
	private Map<String, String> cirugiaMap = new ImmutableMap.Builder<String, String>()
			.put("0","Si")
			.put("1","No")
			.put("2","Otros")
			.put("3","RSC")
			.put("4","VCC")
			.build();
	
	private ImmutableList<RenderField> listRenderFields = new ImmutableList.Builder<RenderField>()
			 .add(new RenderField("idanotomia","idestadificacion",null))
			 .add(new RenderField("biopsia","Nº Biopsia",null))
			 .add(new RenderField("fechaDiag","Fecha Biopsia",null))
			 .add(new RenderField("diagHistologico","Diagnóstico Histológico",null))
			 .add(new RenderField("apSugestiva","AP Sugestiva de IMS",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("ihq","IHQ",new SimpleMapValueResolver(biOptionMap)))
			 .add(new RenderField("expresionConserv","Expresión conservada",new SeparatorMapFieldValueResolver(biOptionMap,0)))
			 .add(new RenderField("expresionConserv","Exp. conv. Nota",new SeparatorMapFieldValueResolver(null,1)))
			 .add(new RenderField("diagnosticadoEn","Diagnosticado en",null))
			 .add(new RenderField("gradoDif","Grado de diferenciación",new SimpleMapValueResolver(gradoDif)))
			 .add(new RenderField("baseDiagCirugia","Base del diagnóstico (Cirugía)",new SimpleMapValueResolver(cirugiaMap))) 
			 .add(new RenderField("baseDiag","Base diag. Otros",null))		 
			 .build();

}