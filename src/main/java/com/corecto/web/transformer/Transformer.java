package com.corecto.web.transformer;

public interface Transformer<I,T> {

	
		T transform(I target );
}
