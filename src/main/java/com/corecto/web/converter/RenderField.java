package com.corecto.web.converter;

import java.util.Date;

import org.apache.commons.lang3.time.DateFormatUtils;

import com.corecto.web.resolver.ValueResolver;

public class RenderField {

	private String field;
	private String label;
	private ValueResolver valueResolver;

	public RenderField() {
	}

	public RenderField(String field, String label, ValueResolver valueResolver) {
		super();
		this.field = field;
		this.label = label;
		this.valueResolver = valueResolver;
	}

	public String getRenderedValue(Object value) {
		if (value instanceof String || value instanceof Integer || value instanceof Long) {
			return valueResolver != null ? valueResolver.resolverRender(value.toString()) : value.toString();
		}
		if (value instanceof Boolean) {
			return value == Boolean.TRUE ? "Si" : "No";
		}
		if (value instanceof Date) {
			return DateFormatUtils.format((Date) value, "dd/MM/yyyy");
		}
		if (value instanceof Double) {
			return String.format("%.2f", value);
		}
		return "";
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public ValueResolver getValueResolver() {
		return valueResolver;
	}

	public void setValueResolver(ValueResolver valueResolver) {
		this.valueResolver = valueResolver;
	}

}
