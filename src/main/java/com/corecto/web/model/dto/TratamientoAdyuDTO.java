package com.corecto.web.model.dto;


public class TratamientoAdyuDTO {
	
	private long idtratamientoadyu;
	private long idConsulta;
	private String quimioterapia;
	private String quimioNroCiclos;
	private String radioterapia;
	private String radioDosis;
	private String radioFechaInicio;
	private String radioFechaFinal;
	private String suspendio;
	private String notas;
	
	
	public long getIdConsulta() {
		return idConsulta;
	}
	public void setIdConsulta(long idConsulta) {
		this.idConsulta = idConsulta;
	}
	public long getIdtratamientoadyu() {
		return idtratamientoadyu;
	}
	public void setIdtratamientoadyu(long idtratamientoadyu) {
		this.idtratamientoadyu = idtratamientoadyu;
	}
	public String getQuimioterapia() {
		return quimioterapia;
	}
	public void setQuimioterapia(String quimioterapia) {
		this.quimioterapia = quimioterapia;
	}
	public String getQuimioNroCiclos() {
		return quimioNroCiclos;
	}
	public void setQuimioNroCiclos(String quimioNroCiclos) {
		this.quimioNroCiclos = quimioNroCiclos;
	}
	public String getRadioterapia() {
		return radioterapia;
	}
	public void setRadioterapia(String radioterapia) {
		this.radioterapia = radioterapia;
	}
	public String getRadioDosis() {
		return radioDosis;
	}
	public void setRadioDosis(String radioDosis) {
		this.radioDosis = radioDosis;
	}
	public String getRadioFechaInicio() {
		return radioFechaInicio;
	}
	public void setRadioFechaInicio(String radioFechaInicio) {
		this.radioFechaInicio = radioFechaInicio;
	}
	public String getRadioFechaFinal() {
		return radioFechaFinal;
	}
	public void setRadioFechaFinal(String radioFechaFinal) {
		this.radioFechaFinal = radioFechaFinal;
	}
	public String getSuspendio() {
		return suspendio;
	}
	public void setSuspendio(String suspendio) {
		this.suspendio = suspendio;
	}
	public String getNotas() {
		return notas;
	}
	public void setNotas(String notas) {
		this.notas = notas;
	}
	
	

}
