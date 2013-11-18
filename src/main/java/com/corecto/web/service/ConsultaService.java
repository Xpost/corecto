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

   Long saveMotivo(MotivoDTO motivoDTO);
   
   Long saveAntecedentes(AntecedentesDTO antecedentesDTO);

   Long saveEvaClinica(EvaClinicaDTO evaClinicaDTO);

   Long saveExaProctologico(ExaProctoDTO exaProctoDTO);

   Long saveEstadificacion(EstadificacionDTO estadificacionDTO);
   
   Long saveAnaPatologica(AnotomiaPatologicaDTO anotomiaPatologicaDTO);
   
   Long saveTratamiento(TratamientoDTO tratamientoDTO);
   
   Long saveDescTrataNeoadyuante(DescTrataNeoDTO descTrataNeoDTO);
   
   Long saveRespuestaTrataNeoadyuante(RespuestaTrataNeoDTO respuestaTrataNeoDTO);
   
   Long saveConducataPostNeoAdyuante(ConductaPostNeoDTO conductaPostNeoDTO);

   Long saveTratamientoAdyuvante(TratamientoAdyuDTO tratamientoAdyuDTO);

   Long saveAnatomiaPatologicaPost(AnatomiaPatologicaPostDTO anatomiaPatologicaPostDTO);

}
