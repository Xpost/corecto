package com.corecto.web.model.dto;

public class AntecedentesDTO {

	private long idantecedente;
	private long idConsulta;
	private Boolean personalTabaquismo;
	private Boolean personalCardio;
	private Boolean personalAlcohol;
	private Boolean personalDbt;
	private Boolean personalNinguno;
	private String personalOtro;
	private Boolean patologicoNinguno;
	private Boolean patologicoColitis;
	private Boolean patologicoAdenoma;
	private Boolean patologicoCrohn;
	private Boolean patologicoNeoplasia;
	private Boolean patologicoHiv;
	private String neoplasia;
	private String familiarCancer;
	private String antecedentesCcrh;
	private Integer tipoCcrh;

	public long getIdConsulta() {
		return idConsulta;
	}

	public void setIdConsulta(long idConsulta) {
		this.idConsulta = idConsulta;
	}

	public long getIdantecedente() {
		return idantecedente;
	}

	public void setIdantecedente(long idantecedente) {
		this.idantecedente = idantecedente;
	}

	public Boolean getPersonalTabaquismo() {
		return personalTabaquismo;
	}

	public void setPersonalTabaquismo(Boolean personalTabaquismo) {
		this.personalTabaquismo = personalTabaquismo;
	}

	public Boolean getPersonalCardio() {
		return personalCardio;
	}

	public void setPersonalCardio(Boolean personalCardio) {
		this.personalCardio = personalCardio;
	}

	public Boolean getPersonalAlcohol() {
		return personalAlcohol;
	}

	public void setPersonalAlcohol(Boolean personalAlcohol) {
		this.personalAlcohol = personalAlcohol;
	}

	public Boolean getPersonalDbt() {
		return personalDbt;
	}

	public void setPersonalDbt(Boolean personalDbt) {
		this.personalDbt = personalDbt;
	}

	public Boolean getPersonalNinguno() {
		return personalNinguno;
	}

	public void setPersonalNinguno(Boolean personalNinguno) {
		this.personalNinguno = personalNinguno;
	}

	public String getPersonalOtro() {
		return personalOtro;
	}

	public void setPersonalOtro(String personalOtro) {
		this.personalOtro = personalOtro;
	}

	public Boolean getPatologicoNinguno() {
		return patologicoNinguno;
	}

	public void setPatologicoNinguno(Boolean patologicoNinguno) {
		this.patologicoNinguno = patologicoNinguno;
	}

	public Boolean getPatologicoColitis() {
		return patologicoColitis;
	}

	public void setPatologicoColitis(Boolean patologicoColitis) {
		this.patologicoColitis = patologicoColitis;
	}

	public Boolean getPatologicoAdenoma() {
		return patologicoAdenoma;
	}

	public void setPatologicoAdenoma(Boolean patologicoAdenoma) {
		this.patologicoAdenoma = patologicoAdenoma;
	}

	public Boolean getPatologicoCrohn() {
		return patologicoCrohn;
	}

	public void setPatologicoCrohn(Boolean patologicoCrohn) {
		this.patologicoCrohn = patologicoCrohn;
	}

	public Boolean getPatologicoNeoplasia() {
		return patologicoNeoplasia;
	}

	public void setPatologicoNeoplasia(Boolean patologicoNeoplasia) {
		this.patologicoNeoplasia = patologicoNeoplasia;
	}

	public Boolean getPatologicoHiv() {
		return patologicoHiv;
	}

	public void setPatologicoHiv(Boolean patologicoHiv) {
		this.patologicoHiv = patologicoHiv;
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

	public Integer getTipoCcrh() {
		return tipoCcrh;
	}

	public void setTipoCcrh(Integer tipoCcrh) {
		this.tipoCcrh = tipoCcrh;
	}

}
