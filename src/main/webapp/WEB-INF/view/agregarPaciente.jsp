<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form2" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Co-Recto BD</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Le styles -->
    <style type="text/css">
			body {
			    padding-bottom: 10px;
			    padding-top: 60px;
			}
	      .sidebar-nav {
	        padding: 9px 0;
	      }
	
	      @media (max-width: 980px) {
	        /* Enable use of floated navbar text */
	        .navbar-text.pull-right {
	          float: none;
	          padding-left: 5px;
	          padding-right: 5px;
	        }
	      }
	      
		#footer {
		background-color: #f5f5f5;
		}
		/* Lastly, apply responsive CSS fixes as necessary */
		@media (max-width: 767px) {
		#footer {
		margin-left: -20px;
		margin-right: -20px;
		padding-left: 20px;
		padding-right: 20px;
		}
		} 
		
		.show-grid[class*="span"] {
			background-color: #F5F5F5;
		    border: 1px solid #E3E3E3;
		    border-radius: 4px 4px 4px 4px;
		    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05) inset;
		    min-height: 20px;
		    padding: 10px 19px;
		}
		#removeBtn{
		border-radius: 10px 10px 10px 10px;
		margin-top: 8px;
		}
    </style>

 	<jsp:include flush="true" page="header.jsp">
		<jsp:param name="left" value="1" />
	</jsp:include>
                  
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/validate.css" rel="stylesheet">
                  
  </head>

  <body>


    <div class="container">
     <div class="row-fluid">
        <div class="span12">
			<ul class="nav nav-pills">
		    <li class="active">
		    <a href="#">Agregar Paciente</a>
		    </li>
		    </ul>
		    <div style="margin-bottom: -18px;" ></div>
		   <hr>
		   <div style="margin-bottom: -18px;" ></div>
          </div>
        </div>
      <div class="row-fluid">
     <div class="span12 thumbnail">
		  <div class="row-fluid">
 	  		 <form id="addClientForm" action="" method="post">
	         <div class="row-fluid">
	        	<div class="span4">    
					<label for="nombreC"><strong>Nombre</strong></label>
						<input type="text" class="span12" id="nombreC" name="nombreC" />
					<label for="direccionC"><strong>Dirección</strong></label>
						<input type="text" class="span12" id="direccionC" name="direccionC" />
					<label for="localidadC"><strong>Localidad</strong></label>
					<div class="input-prepend">
						<span class="add-on"><i class="icon-map-marker icon-large"></i></span>		
						<input type="text" class="span12" id="localidadC" name="localidadC" />											
					</div>	
				</div>
				<div class="span4">    
						<div class="row-fluid">
					<div class="span6">	
					<label for="dateStart"><strong>Fecha de nacimiento</strong></label>
				   <input type="text" class="span8" id="dateStart" alt="dateP" name="dateStart" placeHolder="dd/MM/yyyy" />			  	
				  	</div>
				  	<div class="span6">
				  	<label for="tipoComprobanteCaja"><strong>Sexo</strong></label>
				   <label class="radio inline">
						    <input type="radio" name="sexo" id="masSex" value="M" checked="checked">
							M
						</label>
					    <label class="radio inline">
						    <input type="radio" name="sexo" id="femSex" value="F">
							F
						</label>
				  </div>		
				</div>		
					<label for="emailC"><strong>Correo electrónico</strong></label>
					 <div class="input-prepend">
						 <span class="add-on"><i class="icon-envelope icon-large"></i></span>
						<input type="text" class="" id="emailC" name="emailC" />
					 </div>
					<div class="row-fluid">
				     <div class="span4">
				     <label for="typeId"><strong>Obra social</strong></label>
						<select id="typeId" name="typeId" class="span10">
						</select>
					</div>	
				    <div class="span5">
					<label for="cuitC"><strong>Número Obra Social</strong></label>
						<input type="text" class="" id="numOS" name="numOS" />
					</div>	
					</div>	 
				</div>		
				<div class="span4">    
					<label for="cuitC"><strong>Número Documento</strong></label>
						<input type="text" class="" id="cuitC" name="cuitC" />
					<div id="phone-container">
						<div class="" id="phone-form" >
						<label for="telC"><strong>Teléfono</strong></label>
							<div class="form-search input-prepend">
							<span class="add-on">#</span>
							<input type="text" class="" id="telC-1" name="telC" /><button type="button" style="display: none" id="removeBtn" class="btn btn-mini btn-danger"><i class="icon-remove icon-white icon-large"></i></button>
							</div>   
							<span id="helpB" class="help-block"><a id="addNumberBtn" class="btn btn-mini btn-info" ><i class="icon-plus icon-white"></i> Agregar otro Nro de Teléfono</a></span>
						</div>
					</div> 
				</div>		
			</div>	
				<div class="row-fluid">	 
					<div class="span7">							 
						<label for="comentC"><strong>Comentario</strong></label>
					  		<textarea name="comentC" id="comentC" rows="3" class="input-block-level"></textarea>
					</div>
				</div>
				<div class="row-fluid">	 
				<div class="pull-right">			
		               <button type="button" onclick="jQuery('#addClientForm').submit();" class="btn btn-primary">Guardar</button>
		               <button type="button" onclick="cleanScreenAdd();" class="btn" >Resetear</button>	
				</div>
				</div>

        </form>
		  </div>
      </div>
      </div><!--/row-->

      <hr>

	 <div id="modalMap" class="modal hide fade modal-client" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">Seleccionar Ubicación en el Mapa</h3>
		</div>
	 <div class="modal-body" style="height: 380px">	
<!--          <div class="row-fluid"> -->
		<div id="map_canvas" style="width: 100%; height: 100%">
		</div><!-- 		</div>	 -->
       </div>
        <div class="modal-footer">
		<button class="btn" data-dismiss="modal" onclick="jQuery('#modalMap').modal('hide');"  aria-hidden="true">Cerrar</button>
		<button class="btn btn-primary"  id="saveCoordinationBtn" >Guardar</button>
		</div> 
	</div>
    </div><!--/.fluid-container-->
  <div id="footer">
      <div class="container">
        <p class="muted credit">Creada por <a href="#">[Matias Iseas]</a>.</p>
      </div>
    </div>
    <div id="dialogErrorOperation" class="" style="display: none" align="" title=""Guardar cliente" >
	<p style="margin:0px;"><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>Se ha producido un error al realizar la operacion! </p>
	</div> 
	<div id="dialogSuccessOperation"  style="display: none" align="" title="Guardar cliente" >
	<p style="margin:0px;"><span class="ui-icon ui-icon-circle-check" style="float: left; margin: 0 7px 20px 0;"></span>Operacion realizada exitosamente!</p>
	</div> 
	<div id="dialogErrorOperationMap" class="" style="display: none" align="" title="" >
	<p style="margin:0px;"><i class="icon-warning-sign icon-large" style="float: left; margin: 12px 12px 27px 0;"></i>Para usar esta opción, antes debes escribir la dirección y la localidad</p>
	</div> 
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
<script type="text/javascript" src="js/jquery-1.7.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.bt.min.js" ></script>  
<script type="text/javascript" src="js/jquery.validate.js" ></script> 
<script type="text/javascript" src="js/googleMapInfo.js" charset="UTF-8"  ></script> 
<script type="text/javascript">
jQuery(function() {
locationInfoWMessage = "Esta bien esta ubicación?<br>Sino es asi, <strong>arrastre el marcador</strong> a la ubicación deseada.";

	cleanScreenAdd();
	jQuery("#nombreC").focus();
	
	 jQuery.ajax({
         url: '<c:url value="/loadAllCat.json" />',
         type: "GET",
         dataType: "json",
         contentType: "application/json",
         data:"", 
         success: function(resp){                                       
        	 var options = $("#typeId");
        	 $.each(resp.obraSociales, function() {
        	     options.append($("<option />").val(this.idos).text(this.nombre));
        	 });
//         	 var options = $("#clientState");
//         	 $.each(resp.estadoCli, function() {
//         	     options.append($("<option />").val(this.idestadocli).text(this.descripcion));
//         	 });
         }
       });

	 jQuery("input[alt=dateP]").datepicker({
		 showButtonPanel: true,
		 changeYear: true,
		 yearRange: "-80:+0",
		 dateFormat: "dd/mm/yy",
		 showOn: "button",
		 buttonImage: "css/images/calendar.gif",
		 buttonImageOnly: true,
		 dayNames: [ "Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado" ],
		 dayNamesMin: [ "Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa" ],
		 monthNames: [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ], 
		 altField: "#actualDate" ,
		 closeText: "Cerrar", 
		 currentText: "Hoy"
		 });
	 
	 
	jQuery("#addClientForm").validate({
		focusInvalid:false,
	    rules: {
	    	nombreC:{required: true},
			emailC:{email:true},
			cuitC:{digits:true}
        },
	    messages: {
	    	nombreC: {required: "Campo obligatorio"},
	    	emailC:{email:"Email incorrecto"},
	    	cuitC:{digits:"Campo numerico"}
	    },
  	submitHandler: function() { 	  	
  		var nombreNew = jQuery("#nombreC").val();
  		var direccionNew = jQuery("#direccionC").val();
  		var localidadNew = jQuery("#localidadC").val();
  		var fechaNac = jQuery("#dateStart").val();
  		var emailNew = jQuery("#emailC").val();
  		var telNew = jQuery("#telC-1").val();
  		var telNew2 =" ";
  		if (jQuery("#telC-2").length>0){
  			telNew2 = jQuery("#telC-2").val();
  		}
  		var telNew3 =" ";
  		if (jQuery("#telC-3").length>0){
  				telNew3 = jQuery("#telC-3").val();
  		}
  		var cuitNew = jQuery("#cuitC").val();
  		var comentNew = jQuery("#comentC").val();
  		var typeId = jQuery("#typeId").val();
  		var numOS = jQuery("#numOS").val();
	    var sexoSelected = jQuery("input[name=sexo]:checked").val();

  		
  		var patient = {'idos':typeId,'nombre':nombreNew,'direccion':direccionNew,'localidad':localidadNew, 'mail':emailNew,'telefono':telNew+"@@"+telNew2+"@@"+telNew3,
  						'notas':comentNew,'fechanac':fechaNac,'nroOs':numOS,"sexo":sexoSelected, "dni":cuitNew};		  		 
  		 
        jQuery.ajax({
             url: '<c:url value="/addNewPatient.json" />',
             type: "POST",
             dataType: "json",
             contentType: "application/json",
             data: JSON.stringify( patient ), 
             success: function(resp){                                       
            	 if(resp!=-1){ 
            		 jQuery("#dialogSuccessOperation").dialog("open");
         				cleanScreenAdd();
         	 	}
         	 	else{
           		 jQuery("#dialogErrorOperation").dialog("open");
         	 	}           
             }
           });
  		
  	}
	         
  });
	
// 	function loadLastClientId(){
// 	    jQuery.ajax({
// 	        url: '<c:url value="/loadLastClientNum.htm" />',
// 	        type: "GET",
// 	        dataType: "json",
// 	        contentType: "application/json",
// 	        data: "", 
// 	        success: function(resp){                                       
// 	       			jQuery("#clientNum").val(resp+1);        
// 	        }
// 	      });
// 	}
	
	jQuery("#dialogErrorOperation,#dialogErrorOperationMap").dialog({
		autoOpen: false,
		height: 180,
		modal:true,
		buttons: {
			"Ok": function() {
				jQuery( this ).dialog( "close" );
			}
		},
		resizable: false,
		draggable: false,
		close: function() {
		}
	});	 	

	jQuery("#dialogSuccessOperation").dialog({
		autoOpen: false,
		height: 170,
		modal:true,
		buttons: {
			"Ok": function() {
				jQuery( this ).dialog( "close" );
				jQuery("#nombreC").focus();
			}
		},
		resizable: false,
		draggable: false,
		close: function() {
		}
	});	 	
	
	
	$("#addNumberBtn").click(function(){
		var idLastNum = jQuery('#phone-container input').last().attr("id");
		var counter = parseInt(idLastNum.split("-")[1]);
		var phoneForm = jQuery('#phone-form').clone(true);
		if (counter==1){
			jQuery('#helpB').hide();
		}else{
			$("#phone-form-"+(counter-1)).find('#helpB').hide();
			$("#phone-form-"+(counter-1)).find("#removeBtn").hide();
			if (counter<2){
				phoneForm.find('#helpB').show();
			}
		}
		phoneForm.find("label").html("<strong>"+phoneForm.find("label").text()+" "+(counter+1)+"</strong>");
		phoneForm.find("#removeBtn").show();
		phoneForm.find("input").attr("id","telC-"+(counter+1)).val("");
		phoneForm.attr("id","phone-form-"+counter);
		phoneForm.insertAfter('#phone-container div:last-child');
	});
	
	$("#removeBtn").click(function(){
		var idSelecNum = $(this).prev().attr("id");
		var counter = parseInt(idSelecNum.split("-")[1]);
		jQuery('#phone-form-'+(counter-1)).remove();		
		jQuery('#phone-container div:last-child').find('#helpB').show();
		$("#phone-form-"+(counter-2)).find("#removeBtn").show();
	});
	
	$("#createMapModal").click(function(){
		var direccion = jQuery("#direccionC").val();
		var localidad = jQuery("#localidadC option:selected").text();
		if (localidad=="" || direccion==""){
			jQuery("#dialogErrorOperationMap").dialog("option","title","Error al buscar en el mapa");
     		jQuery("#dialogErrorOperationMap").dialog("open");
     		return;
		}	 
		loadGMScript(callBackFindDir);
		jQuery( "#modalMap" ).modal( "show" );
		
	});	 
	
	$("#saveCoordinationBtn").click(function(){
		var location =returnMarkerPosition();
		jQuery.data(document.body,"clientLocation",{"latitude":location.jb,"longitude":location.kb} );
		jQuery( "#modalMap" ).modal( "hide" );	 
	});

	function callBackFindDir(){
		var direccion = jQuery("#direccionC").val(); 
		var localidad = jQuery("#localidadC option:selected").text();
	    createLocationRequest(direccion+", "+localidad+", Argentina");
	}

});
//Other functions
function cleanScreenAdd(){
     jQuery("#nombreC").val("");
	 jQuery("#direccionC").val("");
	 jQuery("#localidadC").val("");
     jQuery("#clientState").val(0);
  	 jQuery("#typeId").val(0);
	 jQuery("#emailC").val("");
	 jQuery("#telC-1").val("");
	 jQuery("#phone-form-1").remove();
	 jQuery("#phone-form-2").remove();
	 jQuery("#cuitC").val("");
	 jQuery("#comentC").val("");
	 jQuery("#dateStart").val("");
	 jQuery("#numOS").val("");
	 jQuery("#nombreC").focus();
}

</script> 

  </body>
</html>
