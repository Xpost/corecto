package com.corecto.web.model.dto;


public class AntecedentesDTO {
	
	
	private String idantecedente;
	private long idConsulta;
	private String personales;
	private String personalesPatologicos;
	private String neoplasia;
	private String familiarCancer;
	private String antecedentesCcrh;
	
	
	
	public long getIdConsulta() {
		return idConsulta;
	}
	public void setIdConsulta(long idConsulta) {
		this.idConsulta = idConsulta;
	}
	public String getIdantecedente() {
		return idantecedente;
	}
	public void setIdantecedente(String idantecedente) {
		this.idantecedente = idantecedente;
	}
	public String getPersonales() {
		return personales;
	}
	public void setPersonales(String personales) {
		this.personales = personales;
	}
	public String getPersonalesPatologicos() {
		return personalesPatologicos;
	}
	public void setPersonalesPatologicos(String personalesPatologicos) {
		this.personalesPatologicos = personalesPatologicos;
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
	
	

}
