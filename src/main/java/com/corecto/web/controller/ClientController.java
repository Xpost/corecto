/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.corecto.web.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.corecto.web.model.dto.PacienteDTO;
import com.corecto.web.model.dto.PageResult;
import com.corecto.web.service.PatientService;

import fr.xebia.audit.Audited;

//import fr.xebia.audit.Audited;

/**
 * TODO comment<br>
 * <br>
 * <b>Change log:</b>
 * <ul>
 * <li>1.0 20/02/2013 - Xpost - initial version</li>
 * </ul>
 * 
 * @author Xpost
 * @version 1.0
 */
@Controller
public class ClientController {

	Logger LOG = LoggerFactory.getLogger(ClientController.class);

	 @Autowired
	 PatientService patientService;
	 
	 
	  @Audited(message = "Accion: Agregar Paciente")
	    @RequestMapping(value = "/addNewPatient", method = RequestMethod.POST)
	    public @ResponseBody
	    long saveNewPaciente(@RequestBody PacienteDTO pacienteDTO ) {
	    	LOG.info("ClientController.saveNewPaciente()");
	        long returnNewId = -1;
	        try {
	        	returnNewId = patientService.savePatient(pacienteDTO);
	        } catch (Exception e) {
	            e.printStackTrace();
	            return -1;
	        }

	        return 	returnNewId;
	    }
	 
	   @Audited(message = "Accion: Busqueda inical de pacientes en Listado")
	    @RequestMapping(value = "/loadlistPatients", method = RequestMethod.GET)
	    public @ResponseBody
	    PageResult loadlistPatients(@RequestParam(value = "idpatient", required = false, defaultValue = "") String patientID,
	    		@RequestParam(value = "domic", required = false, defaultValue = "") String domicilio,
	    		@RequestParam(value = "sidx", required = false, defaultValue = "") String fieldName,
	  		  @RequestParam(value = "sord", required = false, defaultValue = "") String order) {
	    	LOG.info("ClientController.loadlistPatients()");
	        List<PacienteDTO> listPatients = new ArrayList<PacienteDTO>();
	        PageResult pageResult = new PageResult();
	        try {
	            listPatients = patientService.listPatients("", null, domicilio, "", "");
	            pageResult.setPage("1");
	            pageResult.setTotal("2");
	            pageResult.setRecords(listPatients.size() + "");
	            pageResult.setRows(listPatients);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return pageResult;
	    }
	   
	   
/*   
//    @Autowired
//    EmailSenderService emailSenderService;

    @Audited(message = "Accion: Busqueda inical de Clientes")
    @RequestMapping(value = "/searchClientByName", method = RequestMethod.POST)
    public @ResponseBody
    Object[] searchClientByName(@RequestParam(value = "nameStartWith", required = false, defaultValue = "") String name,
            @RequestParam(value = "maxRows", required = false, defaultValue = "5") int maxRows) {
        List<ClienteDTO> listClients = new ArrayList<ClienteDTO>();
        try {
            listClients = clientService.listClientsByName(name,"","", maxRows);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listClients.toArray();
    }
    
    
  

    
    @RequestMapping(value = "/editClient", method = RequestMethod.POST)
    public @ResponseBody
    boolean editClient(@RequestBody ClienteDTO newCliente) {
    	LOG.info("ClientController.editClient()");
        try {
            clientService.saveorUpdateClient(newCliente);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    
 
    
//  @Audited(message = "Accion: Ver historial pedidos")
  @RequestMapping(value = "/loadListClientsByParameter", method = RequestMethod.GET)
  public @ResponseBody
  PageResult loadlistClientsByParameters(@RequestParam(value = "name", required = false, defaultValue = "") String name,
		  @RequestParam(value = "lastName", required = false, defaultValue = "") String lastName,
		  @RequestParam(value = "cuit", required = false, defaultValue = "") String cuit,
		  @RequestParam(value = "score", required = false, defaultValue = "") String score,
		  @RequestParam(value = "sidx", required = false, defaultValue = "") String fieldName,
  		  @RequestParam(value = "sord", required = false, defaultValue = "") String order) {
	  LOG.info("ClientController.listClients()");
      List<ClienteDTO> listClientes = new ArrayList<ClienteDTO>();
      PageResult pageResult = new PageResult();
      try {
          listClientes = clientService.listClientsByParameters(name.isEmpty()?null:name.toLowerCase(), lastName.isEmpty()?null:lastName.toLowerCase(), cuit.isEmpty()?null:cuit, score.isEmpty()?null:score,fieldName,order);
          pageResult.setPage("1");
          pageResult.setTotal("1");
          pageResult.setRecords(listClientes.size() + "");
          pageResult.setRows(listClientes);
      } catch (Exception e) {
          e.printStackTrace();
      }

      return pageResult;
  }
    
    @Audited(message = "Accion: Eliminar Cliente")
    @RequestMapping(value = "/delClient", method = RequestMethod.GET)
    public @ResponseBody
    boolean deleteClient(@RequestParam(value = "idClient", required = false, defaultValue = "") Integer idClient) {
    	LOG.info("ClientController.deleteClient()");
        try {
        	clientService.deleteClientById(idClient);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }
    
    @RequestMapping(value = "/loadClientById", method = RequestMethod.GET)
    public @ResponseBody
    ClienteDTO loadClientById(@RequestParam(value = "idClient", required = false, defaultValue = "") Integer idClient) {
    	LOG.info("ClientController.loadClientById()");
    	ClienteDTO clienteDTO = null;
        try {
        	clienteDTO = clientService.loadClientById(idClient);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return clienteDTO;
    }
    
    // @Audited(message = "Accion: Eliminar alertas")
    @RequestMapping(value = "/loadLastClientNum", method = RequestMethod.GET)
    public @ResponseBody
    Integer loadLastClientId() {
        Integer lastId = -1;
        try {
        	lastId = Integer.parseInt(clientService.loadClientLastNum());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lastId;
    }
    
   */ 
    @RequestMapping(value = "/loadAllCat", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> loadAllCat() {
    	LOG.info("ClientController.listClients()");
        Map<String, Object> catalogs = new HashMap<String, Object>();
        try {
            catalogs = patientService.loadAllAddPatientCat();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return catalogs;
    }

}
