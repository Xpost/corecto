package com.corecto.web.resolver;

import java.util.Map;

public class SimpleMapValueResolver implements ValueResolver {

	private Map<String, String> mapValueRender;

	public SimpleMapValueResolver(Map<String, String> mapValueRender) {
		super();
		this.mapValueRender = mapValueRender;
	}

	public String resolverRender(Object value) {
		return mapValueRender.get(value.toString());
	}

	public Map<String, String> getMapValueRender() {
		return mapValueRender;
	}

	public void setMapValueRender(Map<String, String> mapValueRender) {
		this.mapValueRender = mapValueRender;
	}

}
