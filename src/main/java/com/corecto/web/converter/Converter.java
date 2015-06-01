package com.corecto.web.converter;

import java.util.Map;

public interface Converter<I> {

	Map<String, Object> convertToMap(I target);

}
