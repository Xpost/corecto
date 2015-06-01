package com.corecto.web.resolver;

import java.util.Map;

import com.google.common.base.Function;
import com.google.common.base.Joiner;
import com.google.common.collect.FluentIterable;

public class SeparatorMapValueResolver implements ValueResolver {

	private Map<String, String> mapValueRender;

	public SeparatorMapValueResolver(Map<String, String> mapValueRender) {
		super();
		this.mapValueRender = mapValueRender;
	}

	public String resolverRender(Object value) {
		String result = "";

		String[] resultArray = value.toString().replaceFirst("-", "").split("-");
		result = FluentIterable.of(resultArray).transform(new Function<String, String>() {
			public String apply(String input) {
				if (input.contains("*")) {
					String[] sepValue = input.split("\\*");
					return mapValueRender.get(sepValue[0]) + " " + sepValue[1];
				}
				return mapValueRender.get(input);
			}
		}).join(Joiner.on(", ")).toString();
		return result;
	}

	public Map<String, String> getMapValueRender() {
		return mapValueRender;
	}

	public void setMapValueRender(Map<String, String> mapValueRender) {
		this.mapValueRender = mapValueRender;
	}

}
