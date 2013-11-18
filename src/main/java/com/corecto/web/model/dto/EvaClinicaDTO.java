package com.corecto.web.model.dto;


public class EvaClinicaDTO {

	private String idevaclinica;
	private long idConsulta;
	private String abdomen;
	private String colon;
	private String recto;
	private String adenopatias;
	private String notas;
	
	
	public EvaClinicaDTO() {
		super();
	}
	
	
	public long getIdConsulta() {
		return idConsulta;
	}



	public void setIdConsulta(long idConsulta) {
		this.idConsulta = idConsulta;
	}



	public String getIdevaclinica() {
		return idevaclinica;
	}
	public void setIdevaclinica(String idevaclinica) {
		this.idevaclinica = idevaclinica;
	}
	public String getAbdomen() {
		return abdomen;
	}
	public void setAbdomen(String abdomen) {
		this.abdomen = abdomen;
	}
	public String getColon() {
		return colon;
	}
	public void setColon(String colon) {
		this.colon = colon;
	}
	public String getRecto() {
		return recto;
	}
	public void setRecto(String recto) {
		this.recto = recto;
	}
	public String getAdenopatias() {
		return adenopatias;
	}
	public void setAdenopatias(String adenopatias) {
		this.adenopatias = adenopatias;
	}
	public String getNotas() {
		return notas;
	}
	public void setNotas(String notas) {
		this.notas = notas;
	}

	
	
}
