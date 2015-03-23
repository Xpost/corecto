package com.corecto.web.model.dto;

import java.util.List;

public class FilterDTO {

	private String nombre;
	private String dni;
	private String sexo;
	// motivos consulta
	private String consultaMotivos;
	private String consultaMotivoOtro;
	private String fechaInSintoma;
	private String motivoEvoMeses;
	// antecedentes
	private String patologicoNinguno;
	private String patologicoColitis;
	private String patologicoAdenoma;
	private String patologicoCrohn;
	private String patologicoHiv;
	private String patologicoNeoplasia;
	private String neoplasia;
	private String familiarCancer;
	private List<Integer> tipoCcrh;
	private String antecedentesCcrh;
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

	public String getPatologicoNinguno() {
		return patologicoNinguno;
	}

	public void setPatologicoNinguno(String patologicoNinguno) {
		this.patologicoNinguno = patologicoNinguno;
	}

	public String getPatologicoColitis() {
		return patologicoColitis;
	}

	public void setPatologicoColitis(String patologicoColitis) {
		this.patologicoColitis = patologicoColitis;
	}

	public String getPatologicoAdenoma() {
		return patologicoAdenoma;
	}

	public void setPatologicoAdenoma(String patologicoAdenoma) {
		this.patologicoAdenoma = patologicoAdenoma;
	}

	public String getPatologicoCrohn() {
		return patologicoCrohn;
	}

	public void setPatologicoCrohn(String patologicoCrohn) {
		this.patologicoCrohn = patologicoCrohn;
	}

	public String getPatologicoHiv() {
		return patologicoHiv;
	}

	public void setPatologicoHiv(String patologicoHiv) {
		this.patologicoHiv = patologicoHiv;
	}

	public String getPatologicoNeoplasia() {
		return patologicoNeoplasia;
	}

	public void setPatologicoNeoplasia(String patologicoNeoplasia) {
		this.patologicoNeoplasia = patologicoNeoplasia;
	}

	public String getNeoplasia() {
		return neoplasia;
	}

	public void setNeoplasia(String neoplasia) {
		this.neoplasia = neoplasia;
	}

	public String getFamiliarCancer() {
		return familiarCancer;
	}

	public void setFamiliarCancer(String familiarCancer) {
		this.familiarCancer = familiarCancer;
	}

	public String getAntecedentesCcrh() {
		return antecedentesCcrh;
	}

	public void setAntecedentesCcrh(String antecedentesCcrh) {
		this.antecedentesCcrh = antecedentesCcrh;
	}

	public List<Integer> getTipoCcrh() {
		return tipoCcrh;
	}

	public void setTipoCcrh(List<Integer> tipoCcrh) {
		this.tipoCcrh = tipoCcrh;
	}

}
