package com.corecto.web.model.values;

public enum PacienteSexo {

	M("Masculino"),F("Femenino");
	
	private String value;
	
	 PacienteSexo(String param) {
		this.value=param;
	}
	
	public static PacienteSexo getPacienteByName(String param) {
		for (PacienteSexo element : PacienteSexo.values()) {
			if(element.name().contentEquals(param.toUpperCase())){
				return element;
			} 
		}
		return null;
	}

	public String getValue() {
		return value;
	}

	
	
}
