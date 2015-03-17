package com.corecto.web.service;

import com.corecto.web.model.dto.AnatomiaPatologicaPostDTO;
import com.corecto.web.model.dto.AnotomiaPatologicaDTO;
import com.corecto.web.model.dto.AntecedentesDTO;
import com.corecto.web.model.dto.ConductaPostNeoDTO;
import com.corecto.web.model.dto.DescTrataNeoDTO;
import com.corecto.web.model.dto.EstadificacionDTO;
import com.corecto.web.model.dto.EvaClinicaDTO;
import com.corecto.web.model.dto.ExaProctoDTO;
import com.corecto.web.model.dto.MotivoDTO;
import com.corecto.web.model.dto.PreconsultaDTO;
import com.corecto.web.model.dto.RespuestaTrataNeoDTO;
import com.corecto.web.model.dto.TratamientoAdyuDTO;
import com.corecto.web.model.dto.TratamientoDTO;

public interface ConsultaService {

	Long loadConsulta(long idPaciente);

	Long savePreconsulta(PreconsultaDTO preconsultaDTO);

	PreconsultaDTO loadPreconsulta(Long idConsulta);

	Long saveMotivo(MotivoDTO motivoDTO);

	MotivoDTO loadMotivo(Long idConsulta);

	Long saveAntecedentes(AntecedentesDTO antecedentesDTO);

	AntecedentesDTO loadAntecedente(Long idConsulta);

	Long saveEvaClinica(EvaClinicaDTO evaClinicaDTO);

	EvaClinicaDTO loadEvaClinica(Long idConsulta);

	Long saveExaProctologico(ExaProctoDTO exaProctoDTO);

	ExaProctoDTO loadExaProctologico(Long idConsulta);

	Long saveEstadificacion(EstadificacionDTO estadificacionDTO);

	EstadificacionDTO loadEstadificacion(Long idConsulta);

	Long saveAnaPatologica(AnotomiaPatologicaDTO anotomiaPatologicaDTO);
	
	AnotomiaPatologicaDTO loadAnaPatologica(Long idConsulta);

	Long saveTratamiento(TratamientoDTO tratamientoDTO);
	
	TratamientoDTO loadTratamiento(Long idConsulta);

	Long saveDescTrataNeoadyuante(DescTrataNeoDTO descTrataNeoDTO);
	
	DescTrataNeoDTO loadDescTrataNeoadyuante(Long idConsulta);

	Long saveRespuestaTrataNeoadyuante(RespuestaTrataNeoDTO respuestaTrataNeoDTO);
	
	RespuestaTrataNeoDTO loadRespuestaTrataNeoadyuante(Long idConsulta);

	Long saveConducataPostNeoAdyuante(ConductaPostNeoDTO conductaPostNeoDTO);
	
	ConductaPostNeoDTO loadConducataPostNeoAdyuante(Long idConsulta);

	Long saveTratamientoAdyuvante(TratamientoAdyuDTO tratamientoAdyuDTO);
	
	TratamientoAdyuDTO loadTratamientoAdyuvante(Long idConsulta);
	
	Long saveAnatomiaPatologicaPost(AnatomiaPatologicaPostDTO anatomiaPatologicaPostDTO);

	AnatomiaPatologicaPostDTO loadAnatomiaPatologicaPost(Long idConsulta);
}
