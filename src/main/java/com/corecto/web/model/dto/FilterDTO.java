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
	private List<Integer> crm;
	private List<Integer> emvi;
	private List<Integer> depSatelites;
	private List<Integer> tumoRectoInferior;
	private List<Integer> ganglios;
	private List<Integer> gangliosLate;
	private List<Integer> infiltraEsfinter;
	private List<Integer> tcTorax;
	private List<Integer> tcAbd;
	private List<Integer> petCt;
	private List<Integer> mts;
	private String suv;
	private String marTumFecha;
	private List<Integer> ceaAumentado;
	private List<Integer> ca19;
	private String tnmT;
	private String tnmN;
	private String tnmM;
	private String tnmPt;
	private String tnmPn;
	private String tnmPm;
	private String metastasis;
	private String metastasisOtra;
	private String revRmFecha;
	private String revDistanEsfinter;
	private List<Integer> revDistanAnal;
	private String revAltura;
	// ana patologica
	private List<Integer> gradoDif;
	// tratamiento
	private String udaOndoRadio;
	private String udaOndoOtro;
	private List<Integer> cirugia;
	private List<Integer> quimioterapiaInduc;
	private String quimioterapiaInducOtra;
	private String quimioteInducNroCiclos;
	private List<Integer> quimioOtra;
	private String quimioOtraOtra;
	private List<Integer> quimioterapiaInter;
	private String quimioterapiaInterOtra;
	private String quimioteInterNroCiclos;
	// tratemiento neoady
	private List<Integer> radioterapia;
	private String radioDosis;
	private String radioFechaInicio;
	private String radioFechaFinal;
	private List<Integer> quimio;
	private String quimioEsquema;
	private String quimioNroCiclos;
	private String quimioFechaInicio;
	private String quimioFechaFinal;
	// resp tratamiento neoady
	private String rmCentroResp;
	private String rmFechaResp;
	private String rmDistEsfinterResp;
	private List<Integer> rmDistAnalResp;
	private String rmAlturaResp;
	private List<Integer> rmTumorResp;
	private List<Integer> rmTumorNResp;
	private List<Integer> crmResp;
	private List<Integer> emviResp;
	private List<Integer> depSatelitesResp;
	private List<Integer> estadifTumor;
	private List<Integer> gradoRegre;
	private List<Integer> gangliosImguiResp;
	private List<Integer> gangliosLateral;
	private List<Integer> infiltraEsf;
	private List<Integer> evaRespuesta;
	// conducta trat neoady
	private List<Integer> cirugiaCond;
	private List<Integer> cirugiaProcedCond;
	private List<Integer> milesCilindrico;
	private String milesCilindricoOtro;
	private List<Integer> urgencia;
	private String urgenciaFecha;
	private String cirujano;
	private List<Integer> waitAndSee;
	private String fechaInicio;
	// ana patologia post
	private List<Integer> tumor;
	private List<Integer> tumorN;
	private String ganResecados;
	private String ganPositivos;
	private List<Integer> invVascular;
	private List<Integer> invPeri;
	private List<Integer> linfa;
	private List<Integer> buddingTumoral;
	private List<Integer> pushingBorder;
	private String gradoRegresion;
	private String cap;
	private List<Integer> rtaComPato;
	private List<Integer> ihq;
	private List<Integer> kras;
	private List<Integer> krasTipo;
	// tratamiento adyuvante post
	private List<Integer> quimioterapia;
	private String quimioterapiaOtro;
	private String quimioNroCiclosPost;
	private List<Integer> radioterapiaPost;
	private String radioDosisPost;
	private String radioFechaInicioPost;
	private String radioFechaFinalPost;
	private List<Integer> suspendio;
	private String suspendioDia;

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

	public List<Integer> getCrm() {
		return crm;
	}

	public void setCrm(List<Integer> crm) {
		this.crm = crm;
	}

	public List<Integer> getEmvi() {
		return emvi;
	}

	public void setEmvi(List<Integer> emvi) {
		this.emvi = emvi;
	}

	public List<Integer> getDepSatelites() {
		return depSatelites;
	}

	public void setDepSatelites(List<Integer> depSatelites) {
		this.depSatelites = depSatelites;
	}

	public List<Integer> getTumoRectoInferior() {
		return tumoRectoInferior;
	}

	public void setTumoRectoInferior(List<Integer> tumoRectoInferior) {
		this.tumoRectoInferior = tumoRectoInferior;
	}

	public List<Integer> getGanglios() {
		return ganglios;
	}

	public void setGanglios(List<Integer> ganglios) {
		this.ganglios = ganglios;
	}

	public List<Integer> getGangliosLate() {
		return gangliosLate;
	}

	public void setGangliosLate(List<Integer> gangliosLate) {
		this.gangliosLate = gangliosLate;
	}

	public List<Integer> getInfiltraEsfinter() {
		return infiltraEsfinter;
	}

	public void setInfiltraEsfinter(List<Integer> infiltraEsfinter) {
		this.infiltraEsfinter = infiltraEsfinter;
	}

	public List<Integer> getTcTorax() {
		return tcTorax;
	}

	public void setTcTorax(List<Integer> tcTorax) {
		this.tcTorax = tcTorax;
	}

	public List<Integer> getTcAbd() {
		return tcAbd;
	}

	public void setTcAbd(List<Integer> tcAbd) {
		this.tcAbd = tcAbd;
	}

	public List<Integer> getPetCt() {
		return petCt;
	}

	public void setPetCt(List<Integer> petCt) {
		this.petCt = petCt;
	}

	public List<Integer> getMts() {
		return mts;
	}

	public void setMts(List<Integer> mts) {
		this.mts = mts;
	}

	public String getSuv() {
		return suv;
	}

	public void setSuv(String suv) {
		this.suv = suv;
	}

	public String getMarTumFecha() {
		return marTumFecha;
	}

	public void setMarTumFecha(String marTumFecha) {
		this.marTumFecha = marTumFecha;
	}

	public List<Integer> getCeaAumentado() {
		return ceaAumentado;
	}

	public void setCeaAumentado(List<Integer> ceaAumentado) {
		this.ceaAumentado = ceaAumentado;
	}

	public List<Integer> getCa19() {
		return ca19;
	}

	public void setCa19(List<Integer> ca19) {
		this.ca19 = ca19;
	}

	public String getTnmT() {
		return tnmT;
	}

	public void setTnmT(String tnmT) {
		this.tnmT = tnmT;
	}

	public String getTnmN() {
		return tnmN;
	}

	public void setTnmN(String tnmN) {
		this.tnmN = tnmN;
	}

	public String getTnmM() {
		return tnmM;
	}

	public void setTnmM(String tnmM) {
		this.tnmM = tnmM;
	}

	public String getTnmPt() {
		return tnmPt;
	}

	public void setTnmPt(String tnmPt) {
		this.tnmPt = tnmPt;
	}

	public String getTnmPn() {
		return tnmPn;
	}

	public void setTnmPn(String tnmPn) {
		this.tnmPn = tnmPn;
	}

	public String getTnmPm() {
		return tnmPm;
	}

	public void setTnmPm(String tnmPm) {
		this.tnmPm = tnmPm;
	}

	public String getMetastasis() {
		return metastasis;
	}

	public void setMetastasis(String metastasis) {
		this.metastasis = metastasis;
	}

	public String getMetastasisOtra() {
		return metastasisOtra;
	}

	public void setMetastasisOtra(String metastasisOtra) {
		this.metastasisOtra = metastasisOtra;
	}

	public String getRevRmFecha() {
		return revRmFecha;
	}

	public void setRevRmFecha(String revRmFecha) {
		this.revRmFecha = revRmFecha;
	}

	public String getRevDistanEsfinter() {
		return revDistanEsfinter;
	}

	public void setRevDistanEsfinter(String revDistanEsfinter) {
		this.revDistanEsfinter = revDistanEsfinter;
	}

	public List<Integer> getRevDistanAnal() {
		return revDistanAnal;
	}

	public void setRevDistanAnal(List<Integer> revDistanAnal) {
		this.revDistanAnal = revDistanAnal;
	}

	public String getRevAltura() {
		return revAltura;
	}

	public void setRevAltura(String revAltura) {
		this.revAltura = revAltura;
	}

	public List<Integer> getCirugia() {
		return cirugia;
	}

	public void setCirugia(List<Integer> cirugia) {
		this.cirugia = cirugia;
	}

	public List<Integer> getQuimioterapiaInduc() {
		return quimioterapiaInduc;
	}

	public void setQuimioterapiaInduc(List<Integer> quimioterapiaInduc) {
		this.quimioterapiaInduc = quimioterapiaInduc;
	}

	public String getQuimioterapiaInducOtra() {
		return quimioterapiaInducOtra;
	}

	public void setQuimioterapiaInducOtra(String quimioterapiaInducOtra) {
		this.quimioterapiaInducOtra = quimioterapiaInducOtra;
	}

	public String getQuimioteInducNroCiclos() {
		return quimioteInducNroCiclos;
	}

	public void setQuimioteInducNroCiclos(String quimioteInducNroCiclos) {
		this.quimioteInducNroCiclos = quimioteInducNroCiclos;
	}

	public List<Integer> getQuimioOtra() {
		return quimioOtra;
	}

	public void setQuimioOtra(List<Integer> quimioOtra) {
		this.quimioOtra = quimioOtra;
	}

	public String getQuimioOtraOtra() {
		return quimioOtraOtra;
	}

	public void setQuimioOtraOtra(String quimioOtraOtra) {
		this.quimioOtraOtra = quimioOtraOtra;
	}

	public List<Integer> getQuimioterapiaInter() {
		return quimioterapiaInter;
	}

	public void setQuimioterapiaInter(List<Integer> quimioterapiaInter) {
		this.quimioterapiaInter = quimioterapiaInter;
	}

	public String getQuimioterapiaInterOtra() {
		return quimioterapiaInterOtra;
	}

	public void setQuimioterapiaInterOtra(String quimioterapiaInterOtra) {
		this.quimioterapiaInterOtra = quimioterapiaInterOtra;
	}

	public String getQuimioteInterNroCiclos() {
		return quimioteInterNroCiclos;
	}

	public void setQuimioteInterNroCiclos(String quimioteInterNroCiclos) {
		this.quimioteInterNroCiclos = quimioteInterNroCiclos;
	}

	public List<Integer> getRadioterapia() {
		return radioterapia;
	}

	public void setRadioterapia(List<Integer> radioterapia) {
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

	public List<Integer> getQuimio() {
		return quimio;
	}

	public void setQuimio(List<Integer> quimio) {
		this.quimio = quimio;
	}

	public String getQuimioEsquema() {
		return quimioEsquema;
	}

	public void setQuimioEsquema(String quimioEsquema) {
		this.quimioEsquema = quimioEsquema;
	}

	public String getQuimioNroCiclos() {
		return quimioNroCiclos;
	}

	public void setQuimioNroCiclos(String quimioNroCiclos) {
		this.quimioNroCiclos = quimioNroCiclos;
	}

	public String getQuimioFechaInicio() {
		return quimioFechaInicio;
	}

	public void setQuimioFechaInicio(String quimioFechaInicio) {
		this.quimioFechaInicio = quimioFechaInicio;
	}

	public String getQuimioFechaFinal() {
		return quimioFechaFinal;
	}

	public void setQuimioFechaFinal(String quimioFechaFinal) {
		this.quimioFechaFinal = quimioFechaFinal;
	}

	public String getRmFechaResp() {
		return rmFechaResp;
	}

	public void setRmFechaResp(String rmFechaResp) {
		this.rmFechaResp = rmFechaResp;
	}

	public String getRmCentroResp() {
		return rmCentroResp;
	}

	public void setRmCentroResp(String rmCentroResp) {
		this.rmCentroResp = rmCentroResp;
	}

	public String getRmDistEsfinterResp() {
		return rmDistEsfinterResp;
	}

	public void setRmDistEsfinterResp(String rmDistEsfinterResp) {
		this.rmDistEsfinterResp = rmDistEsfinterResp;
	}

	public List<Integer> getRmDistAnalResp() {
		return rmDistAnalResp;
	}

	public void setRmDistAnalResp(List<Integer> rmDistAnalResp) {
		this.rmDistAnalResp = rmDistAnalResp;
	}

	public String getRmAlturaResp() {
		return rmAlturaResp;
	}

	public void setRmAlturaResp(String rmAlturaResp) {
		this.rmAlturaResp = rmAlturaResp;
	}

	public List<Integer> getRmTumorResp() {
		return rmTumorResp;
	}

	public void setRmTumorResp(List<Integer> rmTumorResp) {
		this.rmTumorResp = rmTumorResp;
	}

	public List<Integer> getRmTumorNResp() {
		return rmTumorNResp;
	}

	public void setRmTumorNResp(List<Integer> rmTumorNResp) {
		this.rmTumorNResp = rmTumorNResp;
	}

	public List<Integer> getCrmResp() {
		return crmResp;
	}

	public void setCrmResp(List<Integer> crmResp) {
		this.crmResp = crmResp;
	}

	public List<Integer> getEmviResp() {
		return emviResp;
	}

	public void setEmviResp(List<Integer> emviResp) {
		this.emviResp = emviResp;
	}

	public List<Integer> getDepSatelitesResp() {
		return depSatelitesResp;
	}

	public void setDepSatelitesResp(List<Integer> depSatelitesResp) {
		this.depSatelitesResp = depSatelitesResp;
	}

	public List<Integer> getEstadifTumor() {
		return estadifTumor;
	}

	public void setEstadifTumor(List<Integer> estadifTumor) {
		this.estadifTumor = estadifTumor;
	}

	public List<Integer> getGradoRegre() {
		return gradoRegre;
	}

	public void setGradoRegre(List<Integer> gradoRegre) {
		this.gradoRegre = gradoRegre;
	}

	public List<Integer> getGangliosImguiResp() {
		return gangliosImguiResp;
	}

	public void setGangliosImguiResp(List<Integer> gangliosImguiResp) {
		this.gangliosImguiResp = gangliosImguiResp;
	}

	public List<Integer> getGangliosLateral() {
		return gangliosLateral;
	}

	public void setGangliosLateral(List<Integer> gangliosLateral) {
		this.gangliosLateral = gangliosLateral;
	}

	public List<Integer> getInfiltraEsf() {
		return infiltraEsf;
	}

	public void setInfiltraEsf(List<Integer> infiltraEsf) {
		this.infiltraEsf = infiltraEsf;
	}

	public List<Integer> getEvaRespuesta() {
		return evaRespuesta;
	}

	public void setEvaRespuesta(List<Integer> evaRespuesta) {
		this.evaRespuesta = evaRespuesta;
	}

	public List<Integer> getCirugiaCond() {
		return cirugiaCond;
	}

	public void setCirugiaCond(List<Integer> cirugiaCond) {
		this.cirugiaCond = cirugiaCond;
	}

	public List<Integer> getCirugiaProcedCond() {
		return cirugiaProcedCond;
	}

	public void setCirugiaProcedCond(List<Integer> cirugiaProcedCond) {
		this.cirugiaProcedCond = cirugiaProcedCond;
	}

	public List<Integer> getMilesCilindrico() {
		return milesCilindrico;
	}

	public void setMilesCilindrico(List<Integer> milesCilindrico) {
		this.milesCilindrico = milesCilindrico;
	}

	public String getMilesCilindricoOtro() {
		return milesCilindricoOtro;
	}

	public void setMilesCilindricoOtro(String milesCilindricoOtro) {
		this.milesCilindricoOtro = milesCilindricoOtro;
	}

	public List<Integer> getUrgencia() {
		return urgencia;
	}

	public void setUrgencia(List<Integer> urgencia) {
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

	public List<Integer> getWaitAndSee() {
		return waitAndSee;
	}

	public void setWaitAndSee(List<Integer> waitAndSee) {
		this.waitAndSee = waitAndSee;
	}

	public String getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public List<Integer> getTumor() {
		return tumor;
	}

	public void setTumor(List<Integer> tumor) {
		this.tumor = tumor;
	}

	public List<Integer> getTumorN() {
		return tumorN;
	}

	public void setTumorN(List<Integer> tumorN) {
		this.tumorN = tumorN;
	}

	public String getGanResecados() {
		return ganResecados;
	}

	public void setGanResecados(String ganResecados) {
		this.ganResecados = ganResecados;
	}

	public String getGanPositivos() {
		return ganPositivos;
	}

	public void setGanPositivos(String ganPositivos) {
		this.ganPositivos = ganPositivos;
	}

	public List<Integer> getInvVascular() {
		return invVascular;
	}

	public void setInvVascular(List<Integer> invVascular) {
		this.invVascular = invVascular;
	}

	public List<Integer> getInvPeri() {
		return invPeri;
	}

	public void setInvPeri(List<Integer> invPeri) {
		this.invPeri = invPeri;
	}

	public List<Integer> getLinfa() {
		return linfa;
	}

	public void setLinfa(List<Integer> linfa) {
		this.linfa = linfa;
	}

	public List<Integer> getBuddingTumoral() {
		return buddingTumoral;
	}

	public void setBuddingTumoral(List<Integer> buddingTumoral) {
		this.buddingTumoral = buddingTumoral;
	}

	public List<Integer> getPushingBorder() {
		return pushingBorder;
	}

	public void setPushingBorder(List<Integer> pushingBorder) {
		this.pushingBorder = pushingBorder;
	}

	public String getGradoRegresion() {
		return gradoRegresion;
	}

	public void setGradoRegresion(String gradoRegresion) {
		this.gradoRegresion = gradoRegresion;
	}

	public String getCap() {
		return cap;
	}

	public void setCap(String cap) {
		this.cap = cap;
	}

	public List<Integer> getRtaComPato() {
		return rtaComPato;
	}

	public void setRtaComPato(List<Integer> rtaComPato) {
		this.rtaComPato = rtaComPato;
	}

	public List<Integer> getIhq() {
		return ihq;
	}

	public void setIhq(List<Integer> ihq) {
		this.ihq = ihq;
	}

	public List<Integer> getKras() {
		return kras;
	}

	public void setKras(List<Integer> kras) {
		this.kras = kras;
	}

	public List<Integer> getKrasTipo() {
		return krasTipo;
	}

	public void setKrasTipo(List<Integer> krasTipo) {
		this.krasTipo = krasTipo;
	}

	public List<Integer> getQuimioterapia() {
		return quimioterapia;
	}

	public void setQuimioterapia(List<Integer> quimioterapia) {
		this.quimioterapia = quimioterapia;
	}

	public String getQuimioterapiaOtro() {
		return quimioterapiaOtro;
	}

	public void setQuimioterapiaOtro(String quimioterapiaOtro) {
		this.quimioterapiaOtro = quimioterapiaOtro;
	}

	public String getQuimioNroCiclosPost() {
		return quimioNroCiclosPost;
	}

	public void setQuimioNroCiclosPost(String quimioNroCiclosPost) {
		this.quimioNroCiclosPost = quimioNroCiclosPost;
	}

	public List<Integer> getRadioterapiaPost() {
		return radioterapiaPost;
	}

	public void setRadioterapiaPost(List<Integer> radioterapiaPost) {
		this.radioterapiaPost = radioterapiaPost;
	}

	public String getRadioDosisPost() {
		return radioDosisPost;
	}

	public void setRadioDosisPost(String radioDosisPost) {
		this.radioDosisPost = radioDosisPost;
	}

	public String getRadioFechaInicioPost() {
		return radioFechaInicioPost;
	}

	public void setRadioFechaInicioPost(String radioFechaInicioPost) {
		this.radioFechaInicioPost = radioFechaInicioPost;
	}

	public String getRadioFechaFinalPost() {
		return radioFechaFinalPost;
	}

	public void setRadioFechaFinalPost(String radioFechaFinalPost) {
		this.radioFechaFinalPost = radioFechaFinalPost;
	}

	public List<Integer> getSuspendio() {
		return suspendio;
	}

	public void setSuspendio(List<Integer> suspendio) {
		this.suspendio = suspendio;
	}

	public String getSuspendioDia() {
		return suspendioDia;
	}

	public void setSuspendioDia(String suspendioDia) {
		this.suspendioDia = suspendioDia;
	}

}
