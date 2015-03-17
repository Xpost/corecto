package com.corecto.web.model.dto;


public class TratamientoDTO {
	
	
	private long idtratamiento;
	private long idConsulta;
	private String udaondo;
	private String cirugia;
	private String quimioterapiaInduc;
	private String quimioteInducNroCiclos;
	private String quimioOtra;
	private String quimioterapiaInter;
	private String quimioteInterNroCiclos;
	
	
	public long getIdConsulta() {
		return idConsulta;
	}
	public void setIdConsulta(long idConsulta) {
		this.idConsulta = idConsulta;
	}
	public long getIdtratamiento() {
		return idtratamiento;
	}
	public void setIdtratamiento(long idtratamiento) {
		this.idtratamiento = idtratamiento;
	}
	public String getUdaondo() {
		return udaondo;
	}
	public void setUdaondo(String udaondo) {
		this.udaondo = udaondo;
	}
	public String getCirugia() {
		return cirugia;
	}
	public void setCirugia(String cirugia) {
		this.cirugia = cirugia;
	}
	public String getQuimioterapiaInduc() {
		return quimioterapiaInduc;
	}
	public void setQuimioterapiaInduc(String quimioterapiaInduc) {
		this.quimioterapiaInduc = quimioterapiaInduc;
	}
	public String getQuimioteInducNroCiclos() {
		return quimioteInducNroCiclos;
	}
	public void setQuimioteInducNroCiclos(String quimi0teInducNroCiclos) {
		this.quimioteInducNroCiclos = quimi0teInducNroCiclos;
	}
	public String getQuimioOtra() {
		return quimioOtra;
	}
	public void setQuimioOtra(String quimioOtra) {
		this.quimioOtra = quimioOtra;
	}
	public String getQuimioterapiaInter() {
		return quimioterapiaInter;
	}
	public void setQuimioterapiaInter(String quimioterapiaInter) {
		this.quimioterapiaInter = quimioterapiaInter;
	}
	public String getQuimioteInterNroCiclos() {
		return quimioteInterNroCiclos;
	}
	public void setQuimioteInterNroCiclos(String quimi0teInterNroCiclos) {
		this.quimioteInterNroCiclos = quimi0teInterNroCiclos;
	}
	
	

}
