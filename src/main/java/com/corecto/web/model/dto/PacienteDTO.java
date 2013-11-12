package com.corecto.web.model.dto;

import java.text.SimpleDateFormat;
import java.util.Date;


public class PacienteDTO {
	
	
	private long idpaciente;
	private int idos;
	private String nombreOs;
	private String nombre;
	private String sexo;
	private String fechanac;
	private String domicilio;
	private String telefono;
	private String telefono2;
	private String telefono3;
	private String mail;
	private String nroOs;
	private String notas;
	
	public PacienteDTO() {
		super();
	}
	
	
	public PacienteDTO(long idpaciente, int idos, String nombreOs,
			String nombre, String sexo, Date fechanac, String domicilio,
			String telefono, String mail,
			String nroOs, String notas) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");		
		this.idpaciente = idpaciente;
		this.idos = idos;
		this.nombreOs = nombreOs;
		this.nombre = nombre;
		this.sexo = sexo;
		if (fechanac!=null)
		this.fechanac = dateFormat.format(fechanac);
		this.domicilio = domicilio;
		this.telefono = telefono;
		this.mail = mail;
		this.nroOs = nroOs;
		this.notas = notas;
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
	public String getDomicilio() {
		return domicilio;
	}
	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
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

	
	
	
	
	
}
