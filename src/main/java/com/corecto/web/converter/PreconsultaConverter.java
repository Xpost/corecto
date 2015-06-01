/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.converter;

import java.util.List;

import org.springframework.stereotype.Component;

import com.corecto.web.model.pojo.extra.Preconsulta;
import com.google.common.collect.ImmutableList;

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
public class PreconsultaConverter extends AbstractConverter<Preconsulta> {

	// @formatter:off
	private List<RenderField> listRenderFields = new ImmutableList.Builder<RenderField>()
			 .add(new RenderField("idpreconsulta","idpreconsulta",null)) 
			 .add(new RenderField("peso","Peso",null))
			 .add(new RenderField("talla","Talla",null))
			 .add(new RenderField("supcorporal","Superficie corporal",null))
			 .add(new RenderField("performanceStatus","Performance Status",null))
			 .add(new RenderField("comentario","Comentario",null))
			.build();

	@Override
	public List<RenderField> getRenderList() {
		return listRenderFields;
	}
	
	
	
	

}