package com.corecto.web.model.dto;


public class ConsultaDTO {
	
	private Long idconsulta;
	private Long idpaciente;
	private String fecha;
	private AnotomiaPatologicaDTO anotomiaPatologica; 
	private DescTrataNeoDTO descTrataNeos;
	private ConductaPostNeoDTO conductaPostNeos;
	private TratamientoAdyuDTO tratamientoAdyu;
	private RespuestaTrataNeoDTO respuestaTrataNeos;
	private AnatomiaPatologicaPostDTO anatomiaPatologicaPosts;
	private TratamientoDTO tratamientos;
	private PreconsultaDTO preconsultas;
	private AntecedentesDTO antecedenteses;
	private EstadificacionDTO estadificacions;
	private EvaClinicaDTO evaClinicas;
	private MotivoDTO motivos;
	private ExaProctoDTO exaProctos;
	
	
	public Long getIdconsulta() {
		return idconsulta;
	}
	public void setIdconsulta(Long idconsulta) {
		this.idconsulta = idconsulta;
	}
	public Long getIdpaciente() {
		return idpaciente;
	}
	public void setIdpaciente(Long idpaciente) {
		this.idpaciente = idpaciente;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public AnotomiaPatologicaDTO getAnotomiaPatologica() {
		return anotomiaPatologica;
	}
	public void setAnotomiaPatologica(AnotomiaPatologicaDTO anotomiaPatologica) {
		this.anotomiaPatologica = anotomiaPatologica;
	}
	public DescTrataNeoDTO getDescTrataNeos() {
		return descTrataNeos;
	}
	public void setDescTrataNeos(DescTrataNeoDTO descTrataNeos) {
		this.descTrataNeos = descTrataNeos;
	}
	public ConductaPostNeoDTO getConductaPostNeos() {
		return conductaPostNeos;
	}
	public void setConductaPostNeos(ConductaPostNeoDTO conductaPostNeos) {
		this.conductaPostNeos = conductaPostNeos;
	}
	public TratamientoAdyuDTO getTratamientoAdyu() {
		return tratamientoAdyu;
	}
	public void setTratamientoAdyu(TratamientoAdyuDTO tratamientoAdyu) {
		this.tratamientoAdyu = tratamientoAdyu;
	}
	public RespuestaTrataNeoDTO getRespuestaTrataNeos() {
		return respuestaTrataNeos;
	}
	public void setRespuestaTrataNeos(RespuestaTrataNeoDTO respuestaTrataNeos) {
		this.respuestaTrataNeos = respuestaTrataNeos;
	}
	public AnatomiaPatologicaPostDTO getAnatomiaPatologicaPosts() {
		return anatomiaPatologicaPosts;
	}
	public void setAnatomiaPatologicaPosts(
			AnatomiaPatologicaPostDTO anatomiaPatologicaPosts) {
		this.anatomiaPatologicaPosts = anatomiaPatologicaPosts;
	}
	public TratamientoDTO getTratamientos() {
		return tratamientos;
	}
	public void setTratamientos(TratamientoDTO tratamientos) {
		this.tratamientos = tratamientos;
	}
	public PreconsultaDTO getPreconsultas() {
		return preconsultas;
	}
	public void setPreconsultas(PreconsultaDTO preconsultas) {
		this.preconsultas = preconsultas;
	}
	public AntecedentesDTO getAntecedenteses() {
		return antecedenteses;
	}
	public void setAntecedenteses(AntecedentesDTO antecedenteses) {
		this.antecedenteses = antecedenteses;
	}
	public EstadificacionDTO getEstadificacions() {
		return estadificacions;
	}
	public void setEstadificacions(EstadificacionDTO estadificacions) {
		this.estadificacions = estadificacions;
	}
	public EvaClinicaDTO getEvaClinicas() {
		return evaClinicas;
	}
	public void setEvaClinicas(EvaClinicaDTO evaClinicas) {
		this.evaClinicas = evaClinicas;
	}
	public MotivoDTO getMotivos() {
		return motivos;
	}
	public void setMotivos(MotivoDTO motivos) {
		this.motivos = motivos;
	}
	public ExaProctoDTO getExaProctos() {
		return exaProctos;
	}
	public void setExaProctos(ExaProctoDTO exaProctos) {
		this.exaProctos = exaProctos;
	}
	
	

}
