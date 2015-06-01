package com.corecto.web.resolver;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SeparatorMapFieldValueResolver implements ValueResolver {

	Logger LOG = LoggerFactory.getLogger(SeparatorMapFieldValueResolver.class);

	private Map<String, String> mapValueRender;
	private int indexField;

	public SeparatorMapFieldValueResolver(Map<String, String> mapValueRender, int indexField) {
		super();
		this.mapValueRender = mapValueRender;
		this.indexField = indexField;
	}

	public String resolverRender(Object value) {
		String result = "";
		String tempValue = "";
		try {
			tempValue = value.toString().split("//")[indexField];
		} catch (ArrayIndexOutOfBoundsException e) {
			LOG.warn("Posiblemente sin datos cargados para valor compuesto: " + value + " en index: "
					+ indexField);
			return "";
		}
		result = mapValueRender != null ? mapValueRender.get(tempValue) : tempValue;

		if (result == null) {
			return "";
		}
		return result;

	}

	public Map<String, String> getMapValueRender() {
		return mapValueRender;
	}

	public void setMapValueRender(Map<String, String> mapValueRender) {
		this.mapValueRender = mapValueRender;
	}

	public int getIndexField() {
		return indexField;
	}

	public void setIndexField(int indexField) {
		this.indexField = indexField;
	}

}
