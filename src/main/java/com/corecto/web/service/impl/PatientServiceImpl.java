/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.service.impl;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.corecto.web.dao.PatientDAO;
import com.corecto.web.dao.impl.DAOLocator;
import com.corecto.web.model.dto.PacienteDTO;
import com.corecto.web.model.pojo.extra.CatOs;
import com.corecto.web.model.pojo.extra.Paciente;
import com.corecto.web.service.PatientService;



/**
 * TODO comment<br>
 * <br>
 * <b>Change log:</b>
 * <ul>v
 * <li>1.0 20/02/2013 - Xpost - initial version</li>
 * </ul>
 * 
 * @author Xpost
 * @version 1.0
 */
@Transactional
@Service
public class PatientServiceImpl implements PatientService {

	org.slf4j.Logger LOG = LoggerFactory.getLogger(PatientServiceImpl.class);
	private SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy");

    private PatientDAO getPatientDAO() {
        return DAOLocator.getInstance().lookup(PatientDAO.class.getName());
    }
    
    public long savePatient(PacienteDTO pacienteDTO) {

        Paciente paciente =  new Paciente();
        CatOs catOs = new CatOs();
        catOs.setIdos(pacienteDTO.getIdos());
		paciente.setCatOs(catOs);
        paciente.setDomicilio(pacienteDTO.getDomicilio());
        try {
			paciente.setFechanac(dateFormatter.parse(pacienteDTO.getFechanac()));
		} catch (ParseException e) {
			LOG.error(e.getMessage());
			e.printStackTrace();
		}
        paciente.setMail(pacienteDTO.getMail());
        paciente.setNombre(pacienteDTO.getNombre());
        paciente.setNroOs(pacienteDTO.getNroOs());
        paciente.setSexo(pacienteDTO.getSexo());
        String[] numbers = pacienteDTO.getTelefono().split("@@");
        paciente.setTelefono(numbers[0]);
                
 
        long id =getPatientDAO().saveNewPatient(paciente);

        return id;

    }
    
    
    public List<PacienteDTO> listPatients(String name, Long patientID, String direction, String fieldOrder, String order) {
        List<PacienteDTO> resultList = new ArrayList<PacienteDTO>();
        try {
        	 resultList = getPatientDAO().getPatientsByParameters(null, patientID, direction, fieldOrder, order);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultList;

    }
    
    
    
    
	/*

	@Autowired
	@Qualifier("clientTransformer")
	Transformer<Cliente, ClienteDTO> clientTransformer;

	@Autowired
	HistorialService historialService;
	


   
    public void saveorUpdateClient(ClienteDTO clientDTO) {

        //Try to load Client by Name
        Cliente cliente = getClientDAO().loadClientById(clientDTO.getIdcliente());
        if (cliente == null) {
            cliente = new Cliente();
        }
        cliente.setNumerocli(clientDTO.getNumerocli());
        cliente.setNombre(clientDTO.getNombre().toLowerCase());
        cliente.setCcNro(clientDTO.getCcNro());
        if (clientDTO.getCuit()!=null && !clientDTO.getCuit().isEmpty()){
        cliente.setCuit(clientDTO.getCuit());
        }else{
        cliente.setCuit(null);	
        }
        cliente.setDireccion(clientDTO.getDireccion());
        cliente.setEmail(clientDTO.getEmail());
        cliente.setFechaAgregado(Calendar.getInstance().getTime());
        CatDnitipo catDnitipo = new CatDnitipo();
        catDnitipo.setIddnitipo(clientDTO.getIddnitipo());
		cliente.setCatDnitipo(catDnitipo);
        Localidad localidad = new Localidad();
        localidad.setIdlocalidad(clientDTO.getLocalidadId());
        cliente.setLocalidad(localidad);
        cliente.setNotas(clientDTO.getNotas());
        if (!clientDTO.getPuntuacion().isEmpty()){
            cliente.setPuntuacion(Integer.parseInt(clientDTO.getPuntuacion()));
        }else{
            cliente.setPuntuacion(0);	
        }
        String[] numbers = clientDTO.getTelefono().split("@@");
        cliente.setTelefono(numbers[0]);
        cliente.setTelefono2(numbers[1]);
        cliente.setTelefono3(numbers[2]);
        
        EstadoCli estadoCli = new EstadoCli();
        estadoCli.setIdestadocli(Integer.parseInt(clientDTO.getEstadoCliId()));
        cliente.setEstadoCli(estadoCli);
        
        getClientDAO().saveClient(cliente);

    }

   
    
 
    
    
    public void deleteClientById(Integer clientId) {
        Cliente cliente = new Cliente();
        cliente.setIdcliente(clientId);
        getClientDAO().deleteClient(cliente);

    }
    
    
    public ClienteDTO loadClientById(Integer clientId) {
		LOG.info("loadClientById");
        Cliente client = getClientDAO().loadClientById(clientId);        
        return clientTransformer.transform(client);
    }

	public String loadClientLastNum(){
		String lastId= "-1";
        try {
        	lastId = getClientDAO().loadLastClientNum();
			 
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lastId;

	}
	

	
	public ReportData loadCPForReport(Integer ocId){
        ReportData reportData = null;
		try {
			Cliente client = getClientDAO().loadClientById(ocId);
        	reportData = createReportData(client);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return reportData;
	}
	
	private ReportData createReportData(Cliente client) {
		ReportData reportData = new ReportData();
		ClienteDTO clientDTO = clientTransformer.transform(client);
		reportData.setClient(clientDTO);
//		if (presup.getFechaentrega()!=null){
//		reportData.setDateDelivery(dateFormatter.format(presup.getFechaentrega()));
//		}
//		reportData.setDateReport(dateFormatter.format(presup.getFechacompra()));
//		reportData.setPayCondition(presup.getCondcompra());
//		DecimalFormat df = new DecimalFormat("##.00");
//		reportData.setTotalPriceOrder(df.format(presup.getPreciototal()));
//		reportData.setNumPresupuesto(presup.getNrocompra().toString());
		
//		List<ProductReportDTO> productReportDTOs = new ArrayList<ProductReportDTO>();
//		for (ProductoOc product : presup.getProductoOcs()){
//			productReportDTOs.add(productOCTransformer.transform(product));
//		}
//		reportData.setItems(productReportDTOs);
		return reportData;
	}

*/
	
	
	public Map<String,Object> loadAllAddPatientCat(){
		LOG.info("loadAllAddClientCat");
		Map<String,Object> mapElements = new HashMap<String, Object>();
        try {
        	List<CatOs> catOs = getPatientDAO().loadAllCatOS();
        	mapElements.put("obraSociales", catOs);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return mapElements;

	}
}
