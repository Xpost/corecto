package com.corecto.web.model.dto;


public class PreconsultaDTO {

	
	private long idpreconsulta;
	private String peso;
	private String talla;
	private String supcorporal;
	private String performanceStatus;
	private String comentario;
	
	
	
	public PreconsultaDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PreconsultaDTO(long idpreconsulta, String peso, String talla,
			String supcorporal, String performanceStatus, String comentario) {
		super();
		this.idpreconsulta = idpreconsulta;
		this.peso = peso;
		this.talla = talla;
		this.supcorporal = supcorporal;
		this.performanceStatus = performanceStatus;
		this.comentario = comentario;
	}
	public long getIdpreconsulta() {
		return idpreconsulta;
	}
	public void setIdpreconsulta(long idpreconsulta) {
		this.idpreconsulta = idpreconsulta;
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
	public String getSupcorporal() {
		return supcorporal;
	}
	public void setSupcorporal(String supcorporal) {
		this.supcorporal = supcorporal;
	}
	public String getPerformanceStatus() {
		return performanceStatus;
	}
	public void setPerformanceStatus(String performanceStatus) {
		this.performanceStatus = performanceStatus;
	}
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	
	
}
