package com.corecto.web.model.dto;


public class ConductaPostNeoDTO {
	
	private long idconductapostneo;
	private long idConsulta;
	private String cirugia;
	private String milesCilindrico;
	private String urgencia;
	private String urgenciaFecha;
	private String cirujano;
	private String waitAndSee;
	private String fechaInicio;
	
	
	public long getIdConsulta() {
		return idConsulta;
	}
	public void setIdConsulta(long idConsulta) {
		this.idConsulta = idConsulta;
	}
	public long getIdconductapostneo() {
		return idconductapostneo;
	}
	public void setIdconductapostneo(long idconductapostneo) {
		this.idconductapostneo = idconductapostneo;
	}
	public String getCirugia() {
		return cirugia;
	}
	public void setCirugia(String cirugia) {
		this.cirugia = cirugia;
	}
	public String getMilesCilindrico() {
		return milesCilindrico;
	}
	public void setMilesCilindrico(String milesCilindrico) {
		this.milesCilindrico = milesCilindrico;
	}
	public String getUrgencia() {
		return urgencia;
	}
	public void setUrgencia(String urgencia) {
		this.urgencia = urgencia;
	}
	public String getUrgenciaFecha() {
		return urgenciaFecha;
	}
	public void setUrgenciaFecha(String urgenciaFecha) {
		this.urgenciaFecha = urgenciaFecha;
	}
	public String getCirujano() {
		return cirujano;
	}
	public void setCirujano(String cirujano) {
		this.cirujano = cirujano;
	}

	public String getWaitAndSee() {
		return waitAndSee;
	}
	public void setWaitAndSee(String waitAndSee) {
		this.waitAndSee = waitAndSee;
	}
	public String getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	

}
