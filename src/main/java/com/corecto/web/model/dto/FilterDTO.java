package com.corecto.web.model.dto;

public class FilterDTO {

	private String nombre;
	private String dni;
	private String sexo;
	// motivos consulta
	private String consultaMotivos;
	private String consultaMotivoOtro;
	private String fechaInSintoma;
	private String motivoEvoMeses;
	// preconsulta
	private String peso;
	private String talla;
	private String superficie;
	private String performance;
	// examen Procto
	private String movilRectal;
	private String fijoRectal;
	private String esfinterRectal;
	// tratamiento
	private String udaOndoRadio;
	private String udaOndoOtro;

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getMovilRectal() {
		return movilRectal;
	}

	public void setMovilRectal(String movilRectal) {
		this.movilRectal = movilRectal;
	}

	public String getFijoRectal() {
		return fijoRectal;
	}

	public void setFijoRectal(String fijoRectal) {
		this.fijoRectal = fijoRectal;
	}

	public String getEsfinterRectal() {
		return esfinterRectal;
	}

	public void setEsfinterRectal(String esfinterRectal) {
		this.esfinterRectal = esfinterRectal;
	}

	public String getUdaOndoRadio() {
		return udaOndoRadio;
	}

	public void setUdaOndoRadio(String udaOndoRadio) {
		this.udaOndoRadio = udaOndoRadio;
	}

	public String getUdaOndoOtro() {
		return udaOndoOtro;
	}

	public void setUdaOndoOtro(String udaOndoOtro) {
		this.udaOndoOtro = udaOndoOtro;
	}

	public String getPeso() {
		return peso;
	}

	public void setPeso(String peso) {
		this.peso = peso;
	}

	public String getTalla() {
		return talla;
	}

	public void setTalla(String talla) {
		this.talla = talla;
	}

	public String getSuperficie() {
		return superficie;
	}

	public void setSuperficie(String superficie) {
		this.superficie = superficie;
	}

	public String getPerformance() {
		return performance;
	}

	public void setPerformance(String performance) {
		this.performance = performance;
	}

	public String getConsultaMotivos() {
		return consultaMotivos;
	}

	public void setConsultaMotivos(String consultaMotivos) {
		this.consultaMotivos = consultaMotivos;
	}

	public String getConsultaMotivoOtro() {
		return consultaMotivoOtro;
	}

	public void setConsultaMotivoOtro(String consultaMotivoOtro) {
		this.consultaMotivoOtro = consultaMotivoOtro;
	}

	public String getFechaInSintoma() {
		return fechaInSintoma;
	}

	public void setFechaInSintoma(String fechaInSintoma) {
		this.fechaInSintoma = fechaInSintoma;
	}

	public String getMotivoEvoMeses() {
		return motivoEvoMeses;
	}

	public void setMotivoEvoMeses(String motivoEvoMeses) {
		this.motivoEvoMeses = motivoEvoMeses;
	}

}
