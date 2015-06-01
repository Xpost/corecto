package com.corecto.web.converter;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;

import com.google.common.collect.Maps;

public abstract class AbstractConverter<E> implements Converter<E> {

	public abstract List<RenderField> getRenderList();

	public Map<String, Object> convertToMap(E target) {
		Map<String, Object> properties = Maps.newLinkedHashMap();
		for (RenderField renderField : getRenderList()) {
			try {
				if (renderField.getField().contains("sz")) {
					properties.put(renderField.getField(), renderField.getLabel());
					continue;
				}
				Field field = target.getClass().getDeclaredField(renderField.getField());
				field.setAccessible(true);
				properties.put(renderField.getLabel(), renderField.getRenderedValue(field.get(target)));
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchFieldException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return properties;
	}
}
