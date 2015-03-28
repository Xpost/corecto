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
	// eva clínica
	private String evaRecto;
	// preconsulta
	private String peso;
	private String talla;
	private String superficie;
	private String performance;
	// examen Procto
	private String movilRectal;
	private String fijoRectal;
	private String esfinterRectal;
	private List<Integer> ee;
	private List<Integer> eeTipo;
	private List<Integer> eeTipoN;
	private List<Integer> eeInfiltra;
	private List<Integer> eeInfiltraMedida;
	private String eeFecha;
	// estadificacion
	private String rmCentro;
	private String rmFecha;
	private String rmDistEsfinter;
	private List<Integer> rmDistAnal;
	private String rmAltura;
	private List<Integer> rmTumor;
	private List<Integer> rmTumorN;
	// ana patologica
	private List<Integer> gradoDif;
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

	public String getEvaRecto() {
		return evaRecto;
	}

	public void setEvaRecto(String evaRecto) {
		this.evaRecto = evaRecto;
	}

	public List<Integer> getEe() {
		return ee;
	}

	public void setEe(List<Integer> ee) {
		this.ee = ee;
	}

	public List<Integer> getEeTipo() {
		return eeTipo;
	}

	public void setEeTipo(List<Integer> eeTipo) {
		this.eeTipo = eeTipo;
	}

	public List<Integer> getEeTipoN() {
		return eeTipoN;
	}

	public void setEeTipoN(List<Integer> eeTipoN) {
		this.eeTipoN = eeTipoN;
	}

	public List<Integer> getEeInfiltra() {
		return eeInfiltra;
	}

	public void setEeInfiltra(List<Integer> eeInfiltra) {
		this.eeInfiltra = eeInfiltra;
	}

	public List<Integer> getEeInfiltraMedida() {
		return eeInfiltraMedida;
	}

	public void setEeInfiltraMedida(List<Integer> eeInfiltraMedida) {
		this.eeInfiltraMedida = eeInfiltraMedida;
	}

	public String getEeFecha() {
		return eeFecha;
	}

	public void setEeFecha(String eeFecha) {
		this.eeFecha = eeFecha;
	}

	public List<Integer> getGradoDif() {
		return gradoDif;
	}

	public void setGradoDif(List<Integer> gradoDif) {
		this.gradoDif = gradoDif;
	}

	public String getRmCentro() {
		return rmCentro;
	}

	public void setRmCentro(String rmCentro) {
		this.rmCentro = rmCentro;
	}

	public String getRmFecha() {
		return rmFecha;
	}

	public void setRmFecha(String rmFecha) {
		this.rmFecha = rmFecha;
	}

	public String getRmDistEsfinter() {
		return rmDistEsfinter;
	}

	public void setRmDistEsfinter(String rmDistEsfinter) {
		this.rmDistEsfinter = rmDistEsfinter;
	}

	public List<Integer> getRmDistAnal() {
		return rmDistAnal;
	}

	public void setRmDistAnal(List<Integer> rmDistAnal) {
		this.rmDistAnal = rmDistAnal;
	}

	public String getRmAltura() {
		return rmAltura;
	}

	public void setRmAltura(String rmAltura) {
		this.rmAltura = rmAltura;
	}

	public List<Integer> getRmTumor() {
		return rmTumor;
	}

	public void setRmTumor(List<Integer> rmTumor) {
		this.rmTumor = rmTumor;
	}

	public List<Integer> getRmTumorN() {
		return rmTumorN;
	}

	public void setRmTumorN(List<Integer> rmTumorN) {
		this.rmTumorN = rmTumorN;
	}

}
