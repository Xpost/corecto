package com.corecto.web.model.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.text.WordUtils;

import com.corecto.web.model.values.PacienteSexo;

public class PacienteDTO {

	private long idpaciente;
	private int idos;
	private String nombreOs;
	private String nombre;
	private String sexo;
	private String fechanac;
	private String direccion;
	private String localidad;
	private String telefono;
	private String telefono2;
	private String telefono3;
	private String mail;
	private String nroOs;
	private String notas;
	// preconsulta
	private String peso;
	private String talla;
	private String supcorporal;
	private String performanceStatus;
	// examen proctologico
	private String tactoRectal;
	private String tactoRectalInfiltra;
	private String rsc;
	private String rscAltura;
	private String rscFecha;
	private String vcc;
	private String vccAltura;
	private String vccFecha;
	private String ee;
	private String eeInfiltra;
	private String eeFecha;
	private String dni;

	public PacienteDTO() {
		super();
	}

	public PacienteDTO(long idpaciente, int idos, String nombreOs, String nombre, String sexo, Date fechanac,
			String direccion, String localidad, String telefono, String mail, String nroOs, String notas,
			String dni) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		this.idpaciente = idpaciente;
		this.idos = idos;
		this.nombreOs = nombreOs;
		this.nombre = WordUtils.capitalize(nombre);
		this.sexo = PacienteSexo.getPacienteByName(sexo).getValue();
		if (fechanac != null)
			this.fechanac = dateFormat.format(fechanac);
		this.direccion = direccion;
		this.localidad = localidad;
		this.telefono = telefono;
		this.mail = mail;
		this.nroOs = nroOs;
		this.notas = notas;
		this.dni = dni;
	}

	public PacienteDTO(long idpaciente, int idos, String nombreOs, String nombre, String sexo,
			String fechanac, String domicilio, String telefono, String mail, String nroOs, String notas,
			String peso, String talla, String supcorporal, String performanceStatus, String tactoRectal,
			String tactoRectalInfiltra, String rsc, String rscAltura, String rscFecha, String vcc,
			String vccAltura, String vccFecha, String ee, String eeInfiltra, String eeFecha) {
		super();
		this.idpaciente = idpaciente;
		this.idos = idos;
		this.nombreOs = nombreOs;
		this.nombre = nombre;
		this.sexo = sexo;
		this.fechanac = fechanac;
		this.direccion = domicilio;
		this.telefono = telefono;
		// this.telefono2 = telefono2;
		// this.telefono3 = telefono3;
		this.mail = mail;
		this.nroOs = nroOs;
		this.notas = notas;
		this.peso = peso;
		this.talla = talla;
		this.supcorporal = supcorporal;
		this.performanceStatus = performanceStatus;
		this.tactoRectal = tactoRectal;
		this.tactoRectalInfiltra = tactoRectalInfiltra;
		this.rsc = rsc;
		this.rscAltura = rscAltura;
		this.rscFecha = rscFecha;
		this.vcc = vcc;
		this.vccAltura = vccAltura;
		this.vccFecha = vccFecha;
		this.ee = ee;
		this.eeInfiltra = eeInfiltra;
		this.eeFecha = eeFecha;
	}

	public long getIdpaciente() {
		return idpaciente;
	}

	public void setIdpaciente(long idpaciente) {
		this.idpaciente = idpaciente;
	}

	public int getIdos() {
		return idos;
	}

	public void setIdos(int idos) {
		this.idos = idos;
	}

	public String getNombreOs() {
		return nombreOs;
	}

	public void setNombreOs(String nombreOs) {
		this.nombreOs = nombreOs;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getFechanac() {
		return fechanac;
	}

	public void setFechanac(String fechanac) {
		this.fechanac = fechanac;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getLocalidad() {
		return localidad;
	}

	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getTelefono2() {
		return telefono2;
	}

	public void setTelefono2(String telefono2) {
		this.telefono2 = telefono2;
	}

	public String getTelefono3() {
		return telefono3;
	}

	public void setTelefono3(String telefono3) {
		this.telefono3 = telefono3;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getNroOs() {
		return nroOs;
	}

	public void setNroOs(String nroOs) {
		this.nroOs = nroOs;
	}

	public String getNotas() {
		return notas;
	}

	public void setNotas(String notas) {
		this.notas = notas;
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

	public String getTactoRectal() {
		return tactoRectal;
	}

	public void setTactoRectal(String tactoRectal) {
		this.tactoRectal = tactoRectal;
	}

	public String getTactoRectalInfiltra() {
		return tactoRectalInfiltra;
	}

	public void setTactoRectalInfiltra(String tactoRectalInfiltra) {
		this.tactoRectalInfiltra = tactoRectalInfiltra;
	}

	public String getRsc() {
		return rsc;
	}

	public void setRsc(String rsc) {
		this.rsc = rsc;
	}

	public String getRscAltura() {
		return rscAltura;
	}

	public void setRscAltura(String rscAltura) {
		this.rscAltura = rscAltura;
	}

	public String getRscFecha() {
		return rscFecha;
	}

	public void setRscFecha(String rscFecha) {
		this.rscFecha = rscFecha;
	}

	public String getVcc() {
		return vcc;
	}

	public void setVcc(String vcc) {
		this.vcc = vcc;
	}

	public String getVccAltura() {
		return vccAltura;
	}

	public void setVccAltura(String vccAltura) {
		this.vccAltura = vccAltura;
	}

	public String getVccFecha() {
		return vccFecha;
	}

	public void setVccFecha(String vccFecha) {
		this.vccFecha = vccFecha;
	}

	public String getEe() {
		return ee;
	}

	public void setEe(String ee) {
		this.ee = ee;
	}

	public String getEeInfiltra() {
		return eeInfiltra;
	}

	public void setEeInfiltra(String eeInfiltra) {
		this.eeInfiltra = eeInfiltra;
	}

	public String getEeFecha() {
		return eeFecha;
	}

	public void setEeFecha(String eeFecha) {
		this.eeFecha = eeFecha;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

}
