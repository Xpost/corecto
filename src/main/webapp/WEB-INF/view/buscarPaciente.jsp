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
    <link href="css/bootstrap.css" rel="stylesheet">
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
	 
	 .bs-docs-example:after {
	    background-color: #0088CC;
	    border: 2px solid #DDDDDD;
	    border-radius: 4px 0 4px 0;
	    color: #FFFFFF; 
 		content: "Editar Paciente";
 	    font-size: 15px;
	    font-weight: bold;
	    left: -1px;
	    padding: 3px 7px;
	    position: absolute;
	    top: -1px;
  	 }
	
	.bs-docs-example {
	    background-color: #FFFFFF;
	    border: 1px solid #DDDDDD;
	    border-radius: 4px 4px 4px 4px;
	    margin: 15px 0;
	    padding: 39px 19px 14px;
	    position: relative;
	}
	#removeBtn{
		border-radius: 10px 10px 10px 10px;
		margin-top: 8px;
	}
	 .ui-pg-selbox{
  	 width: 50px !important;
  	 padding: 0 !important;
  	 }
  	 
	.ui-autocomplete-loading { background: white url('css/images/ui-anim_basic_16x16.gif') right center no-repeat; }
	.ui-loadingBar { background: transparent url('css/images/load.gif') center / 260px no-repeat;  }
	.ui-pg-input { width: 10px !important;  }
    </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/validate.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen"	href="css/jquery-ui-1.8.16.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
     <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
     <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
     <link rel="shortcut icon" href="../assets/ico/favicon.png">
                  
  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">Co-Recto BD</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
            <li class="divider-vertical"></li>
            <sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
              <li ><a href="login.htm">Inicio</a></li>
              <li class=" active dropdown">
               <a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Pacientes <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="nav-header">Operaciones</li>
                  <li class="divider"></li>
                  <li><a href="agregarPaciente.htm"><i class="icon-plus"></i> Agregar</a></li>
                  <li class="divider"></li>
                  <li class=""><a href="buscarPaciente.htm"><i class="icon-search"></i> Buscar</a></li>
                </ul>
               </li>
           <li class="dropdown">
               <a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Consulta <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="nav-header">Operaciones</li>
                  <li class=""><a href="agregarConsulta.htm"><i class="icon-plus"></i> Agregar</a></li>
                  <li class="divider"></li>
                  <li class="disabled"><a href="#">Buscar Consulta</a></li>
                </ul>
               </li>
               </sec:authorize>
              <li><a href="contacto.htm">Contacto</a></li>
            </ul>
             <div lang="alreadyLoggued" class="pull-right" style="" id="templatemo_main">
					<p class="navbar-text pull-left">
             		 Logueado como 
             		 	 <sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
						 <strong><sec:authentication property="principal.username"/></strong>
						 </sec:authorize>
           			 </p>
           			 <button type="button" onclick="javascript:window.location.href='logout'" style="margin-left: 10px;" class="btn btn-primary pull-right">
						 Salir<i style="margin-left:5px" class="icon-share"></i>
			         </button>
				</div>		        
	       </div><!--/.nav-collapse -->
          </div>
        </div>
             <div class="navbar-inner container" id="selectedPatientDiv" style="min-height:20px;display: none;">
                    <div class="nav-collapse collapse" style="min-height:20px" >
                       <ul class="nav" style="min-height:20px">
            				<li class="divider-vertical" style="min-height: 20px; height: 25px;">
            				<a href="#" style="padding: 2px 0"><strong>Paciente seleccionado:</strong><span id="selectedPatientName"></span> </a>
            				<input type="hidden" value="" id="idPacienteSelected">
            				</li>
            			</ul>	
            			<button type="button" class="close"  id="closeSelected"  style="color: white;opacity:0.8;margin-left:10px;">×</button>
            			<button class="btn btn-primary pull-right" type="button" id="seeConsultBtn" style="font-size: 12px;margin-top: 1px; opacity: 0.8; padding: 0 3px; display: none">Ver consulta</button>
          			</div>
             </div>  
      </div>

    <div class="container">
     <div class="row-fluid">
        <div class="span12">
			<ul class="nav nav-pills">
		    <li class="active">
		    <a href="#">Buscar Paciente</a>
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
 	  		 <form id="" action="" class="">
	         <div class="row-fluid">
	        	<div class="span3">    
					<label for="nombreSearch"><strong>Nombre</strong></label>
						<input type="text" class="" id="nombreSearch" name="nombreSearch" />
				</div>
				<div class="span3">    
					<label for="cuitSearch"><strong>Número Documento</strong></label>
						<input type="text" class="" id="cuitSearch" name="cuitSearch" />
				</div>
				<div class="span6">
				  	<label for="tipoComprobanteCaja"><strong>Sexo</strong></label>
				   <label class="radio inline">
						    <input type="radio" name="sexo" id="masSex" value="M" >
							M
						</label>
					    <label class="radio inline">
						    <input type="radio" name="sexo" id="femSex" value="F" >
							F
						</label>
				  </div>	
			</div>		
			<div class="row-fluid">
				<fieldset>
				<legend style="margin-bottom: 0px !important;border-bottom: 1px solid #9B9B9E !important;">Examen Proctologico <button div="exaProctoTab" style="float: right; margin-top: 5px" class="colapsableBtn btn btn-primary" ><i class="icon-plus"></i></button> </legend>
				<div id="exaProctoTab" style="padding: 5px;border-bottom: 1px solid #9B9B9E;border-left: 1px solid #9B9B9E; border-right: 1px solid #9B9B9E;border-radius:0 0 4px 4px;display: none">
					<div class="row-fluid">				
						 <label for="tipoComprobanteCaja"><strong>Tacto rectal</strong></label>
								<div class="span2" style="padding-bottom:1.1em;">	
								<label for="movilRectal"><strong>Movil</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="movilRectal" id="opcion1" value="0">
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="movilRectal" id="opcion2" value="1">
										Si
									</label>
								</div>	
							<div class="span2" style="padding-bottom:1.1em;">	
								<label for="fijoRectal"><strong>Fijo</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="fijoRectal" id="opcion1" value="0" >
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="fijoRectal" id="opcion2" value="1">
										Si
									</label>
								</div>	
								<div class="span5" style="padding-bottom:1.1em;">	
								<label for="esfinterRectal"><strong>Infiltra esfinter</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion1" value="0" >
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion2" value="1">
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion3" value="2">
										Esfinter interno
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										Esfinter externo
									</label>
									<label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion5" value="4">
										Poco móvil
									</label>					
								</div>				
		   			</div>
				</div>
				</fieldset>
			</div>
			<div class="row-fluid">
				<fieldset>
				<legend style="margin-bottom: 0px !important;border-bottom: 1px solid #9B9B9E !important;">Tratamiento <button div="tratamientoTab" style="float: right; margin-top: 5px" class="colapsableBtn btn btn-primary" ><i class="icon-plus"></i></button> </legend>
				<div id="tratamientoTab" style="padding: 5px;border-bottom: 1px solid #9B9B9E;border-left: 1px solid #9B9B9E; border-right: 1px solid #9B9B9E;border-radius:0 0 4px 4px;display: none">
					<div class="row-fluid">				
						<div class="span10">	  	
						 <label><strong>Udaondo</strong></label>
						<label class="radio inline">
							 <input type="radio" name="udaOndoRadio" id="opcion1" value="0" >
									Si
						</label>
						<label class="radio inline">
							   <input type="radio" name="udaOndoRadio" id="opcion2" value="1">
									No
					    </label>	    
					    <label class="radio inline">
							   <input type="radio" name="udaOndoRadio" id="opcion2" value="2" style="margin-top:9px">
									Otro:
								<input type="text" class="" name="udaOndoOtro" id="udaOndoOtro" style="margin-bottom: 0px;">
						    </label>
						</div>
		   			</div>
				</div>
				</fieldset>
			</div>  
			  
			  <br>
				<div class="row-fluid">	 
				<div class="pull-right">			
		               <button type="button" class="btn btn-primary"  id="searchButton" name="searchButton">Buscar</button>
		               <button type="button" class="btn" id="clearSearchButton" name="clearSearchButton" >Resetear</button>	
				</div>
				</div>
        </form>
		  </div>
      </div>
      </div><!--/row-->
           <hr>
     <div class="row-fluid">
     <div class="span12 thumbnail">
		  <div class="row-fluid">
<!-- 		  Tabla -->
		     		<div style="width: 100%" align="center" >
			    		<div style="height: 1px" ></div>
	  						 <table style="text-align: center;font-size: 18px" align="center" width="100%" id="listClientTable">
	             			 </table>	
	             		<div id="listClientTableGrid"></div>
              		</div>
		  </div>

      </div>
      </div>
      <hr>
<!-- edit patient -->
     <div class="row-fluid editClientDiv" style="display: none">
    <div class="bs-docs-example"> 
     <div class="">
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
						    <input type="radio" name="sexo" id="masSexEdit" value="M" checked="checked">
							M
						</label>
					    <label class="radio inline">
						    <input type="radio" name="sexo" id="femSexEdit" value="F">
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
		               <button type="button" onclick="cancelEdit();" class="btn" >Cancelar</button>	
				</div>
				</div>

        </form>
		  </div>
      </div>
      	</div>
      </div><!--/row-->
      
    </div><!--/.fluid-container-->
  <div id="footer" >
      <div class="container">
        <p class="muted credit">Creada por <a href="#">[Matias Iseas]</a>.</p>
      </div>
    </div>
   	<div id="dialogSendEmail" style="display: none" align="" title="Enviar email" >
	<p style="margin:0px;">Destinatario: <input class="text2" type="text" id="toEmail" /> </p>
	<p style="margin:0px;">Asunto: <input class="text2" type="text" id="subjectEmail" /> </p>
	<p style="margin:10px 0px 0px 0px">Contenido:</p>
	<textarea style="width: 500px" name="contentEmail" id="contentEmail" rows="8" cols="6"></textarea>
	</div> 
	<div id="dialogDeleteClient" style="display: none" align="" title="Eliminar paciente" >
	<p style="margin:0px;"><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>Esta seguro de que desea eliminar el paciente? </p>
	</div> 
	<div id="dialogErrorOperation" class="" style="display: none" align="" title="Eliminar cliente" >
	<p style="margin:0px;"><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>Se ha producido un error al realizar la operacion! </p>
	</div> 
	<div id="dialogSuccessOperation"  style="display: none" align="" title="Eliminar cliente" >
	<p style="margin:0px;"><span class="ui-icon ui-icon-circle-check" style="float: left; margin: 0 7px 20px 0;"></span>Operacion realizada exitosamente!</p>
	</div> 
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
<script type="text/javascript" src="js/jquery-1.7.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>
<script src="js/i18n/grid.locale-es.js" type="text/javascript"></script>
<script src="js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.bt.min.js" ></script>  
<script type="text/javascript" src="js/jquery.validate.js" ></script>  
<script type="text/javascript">
jQuery(function() {
cleanScreenSearch();

jQuery.ajax({
    url: '<c:url value="/loadAllCat.htm" />',
    type: "GET",
    dataType: "json",
    contentType: "application/json",
    data:"", 
    success: function(resp){                                       
   	 var options = $("#typeId");
   	 $.each(resp.obraSociales, function() {
   	     options.append($("<option />").val(this.idos).text(this.nombre));
   	 });
//    	 var options = $("#clientState");
//    	 $.each(resp.estadoCli, function() {
//    	     options.append($("<option />").val(this.idestadocli).text(this.descripcion));
//    	 });
    }
  });
  
  

jQuery("#searchButton").click(function(){
	 var name = jQuery("#nombreSearch").val();
	 var dni = jQuery("#cuitSearch").val();
	 var sexoSelected = jQuery("input[name=sexo]:checked").val();
	 var movilRectal = jQuery("input[name=movilRectal]:checked").val();
	 var fijoRectal = jQuery("input[name=fijoRectal]:checked").val();
	 var esfinterRectal = jQuery("input[name=esfinterRectal]:checked").val();
	 var udaOndoRadio = jQuery("input[name=udaOndoRadio]:checked").val();

	 var filterObject = {"nombre":name,"dni":dni,"sexo":sexoSelected,"movilRectal":movilRectal,"fijoRectal":fijoRectal,
			 "esfinterRectal":esfinterRectal,"udaOndoRadio":udaOndoRadio};
	 
	  jQuery.ajax({
          url: '<c:url value="/findPatientFilter.htm" />',
          type: "POST",
          dataType: "json",
          contentType: "application/json",
          data: JSON.stringify( filterObject ), 
          success: function(resp){     
			     	 if(resp){
				  		 jQuery("#listClientTable").jqGrid("clearGridData");	
				  		 $.each(resp,function(index,ob){
				  			jQuery("#listClientTable").addRowData(index,ob);
				  		 });
			          	 }
			     	 else{
			     		 jQuery("#dialogErrorOperation").dialog("open");
			     		 }
     	 }
       });	 
	  
      //jQuery("#listClientTable").jqGrid('setGridParam',{url:"<c:url value="/findPatient.htm" />?name="+name+"&cuit="+cuit+"&score="+score,page:1}).trigger('reloadGrid');
});

jQuery("#clearSearchButton").click(function(){
	 cleanScreenSearch();
	 cancelEdit();
});



jQuery("#listClientTable").jqGrid({
	 url: '<c:url value="/loadlistPatients.htm"/>',
	 datatype: "json", 
	 autowidth : true,
	 height : 200,
	 colNames : ['Operación','','','Nombre','Sexo','DNI',  
	             'Fecha Nac.', 'Domicilio','Teléfono','','','','',''],
		colModel : [ 
		        	{name: 'myac',
						 width:77, 
						 fixed:true, 
						 sortable:false, 
						 resize:false, 
							search: false,
							formatter:function(){
								return "<div style='margin-left: 7px;'>"+
								'<div onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" onmouseover="jQuery(this).addClass(\'ui-state-hover\');"  class="ui-pg-div ui-inline-edit" style="float: left; cursor: pointer; display: block;margin-left: 4px;margin-right: 4px;" title="Modificar fila seleccionada"><span op="edit" class="ui-icon ui-icon-pencil"></span></div>'+											
								'<div onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" onmouseover="jQuery(this).addClass(\'ui-state-hover\');"  class="ui-pg-div ui-inline-edit" style="float: left; cursor: pointer; display: block;" title="Eliminar fila seleccionada"><span op="delete" class="ui-icon ui-icon-trash"></span></div>'+
								'<div onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" onmouseover="jQuery(this).addClass(\'ui-state-hover\');"  class="ui-pg-div ui-inline-edit" style="float: left; cursor: pointer; display: block;margin-left: 4px;margin-right: 4px;" title="Seleccionar paciente"><span op="select" class="ui-icon ui-icon-check"></span></div>'+
								"</div>";
								}

					},
		{
			name : 'idos',
			index : 'idos',
			width : 1,
			hidden:true					
		},
		{
			name : 'idpaciente',
			index : 'idpaciente',
			width : 1,
			hidden:true					
		},
		{
			name : 'nombre',
			index : 'nombre',
			align: 'center',
			width : 250
		},
		{
			name : 'sexo',
			index : 'sexo',
			align: 'center',
			width : 80
		},
		 {
			name : 'dni',
			index : 'dni',
			align: 'center',
			width : 100
		},
		 {
			name : 'fechanac',
			index : 'fechanac',
			align: 'center',
			width : 100
		}, {
			name : 'domicilio',
			index : 'domicilio',
			align: 'center',
			width : 100
		}, {
			name : 'telefono',
			index : 'telefono',
			align: 'center',
			width : 1,
			hidden:true
		},
		{
			name : 'nroOs',
			index : 'nroOs',
			align: 'center',
			width : 1,
			hidden:true
		},
		{
			name : 'idos',
			index : 'idos',
			align: 'center',
			width : 1,
			hidden:true
		},
		{
			name : 'mail',
			index : 'mail',
			align: 'center',
			width : 1,
			hidden:true,
			editable:true
		},
		{
			name : 'notas',
			index : 'notas',
			align: 'center',
			width : 1,
			hidden:true,
			editable:true
		},
		{
			name : 'dummy',
			index : 'dummy',
			align: 'center',
			width : 1,
			hidden:true,
			editable:true
		}],
		ondblClickRow: function(id ){},
	  rowNum:25, 
	  rowList: [10,50,100],
	  multiselect: true,
	  sortable: true,
	  pager: '#listClientTableGrid',
	  pgbuttons: true,
	  pginput:false,
	  rownumbers : true,
	  loadonce:true,
	  jsonReader : {
         root: "rows",
         page: "page",
         total: "total",
         records: "records",
         repeatitems: false,
         id: "id"
     },				
     beforeSelectRow: function(rowid, e) {
			 var iCol = jQuery.jgrid.getCellIndex(e.target);
			 if(iCol == 2 && e.target.attributes.op!=null){

			 	if(e.target.attributes.op.value=="edit"){		 		
					 var row = jQuery('#listClientTable').jqGrid('getRowData',rowid);										 
					 updatePatient(row);		
		             return false;
		            }
			 	if(e.target.attributes.op.value=="delete"){
			 		 var idPatient = jQuery('#listClientTable').jqGrid('getCell',rowid,"idpaciente");
			 		 jQuery.data(document.body,"PacienteData",{"idPatient":idPatient});
			 		 jQuery("#dialogDeleteClient" ).dialog("open");
			 		//delPatient(idCliente);
			 		return false;
		            }
				 if(e.target.attributes.op.value=="select"){		 		
					 var row = jQuery('#listClientTable').jqGrid('getRowData',rowid);										 
					 selectPatient(row);		
		             return false;
		            }
			 	}
		
			 
		       //return true;    // allow select the row
            //  return false;   // not allow select the row
			 // prevent row selection if one click on the button
			 return (iCol != 2)? true: false;
         
     },
	  onSelectRow:function(){//alert("asdasd")
		  },
	  viewrecords: true, 
	  sortorder: "desc", 
	  caption:'Pacientes', 
	  editurl: "dummy.htm"
	  });

$("#gview_listClientTable").css("font-size","14px");

$(".colapsableBtn").click(function(event){
	event.preventDefault();
	var button = $(this);
	var divTab =button.attr("div");
	
	$("#"+divTab).slideToggle("normal", function(){
		var iconButton =button.find("i");
		if (iconButton.hasClass("icon-minus")){
			iconButton.removeClass("icon-minus").addClass("icon-plus");
		}
		else{
			iconButton.removeClass("icon-plus").addClass("icon-minus");
		}
	});
});	

jQuery("#dialogDeleteClient").dialog({
	autoOpen: false,
	height: 170,
	modal:true,
	buttons: {
		"Ok": function() {
			delPatient();
			jQuery( this ).dialog( "close" );
		},
		"Cancelar": function() {
			jQuery( this ).dialog( "close" );
		}
	},
	resizable: false,
	draggable: false,
	close: function() {
	}
});	 	

jQuery("#dialogErrorOperation").dialog({
	autoOpen: false,
	height: 170,
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
			 jQuery("#listClientTable").trigger('reloadGrid');
		}
	},
	resizable: false,
	draggable: false,
	close: function() {
	}
});	 

jQuery("#nombreSearch" ).autocomplete({
	source: function( request, response ) {
		$.ajax({
			url: '<c:url value="/searchPatientByName.htm" />',
			dataType: "json",
			type: "POST",
			data: {
				featureClass: "P",
				style: "full",
				maxRows: 12,
				nameStartWith: request.term
			},
			success: function( data ) {
				response( jQuery.map( data, function (elementOfArray, indexInArray){							
					return  { value: capitaliseFirstLetter(elementOfArray.nombre)};											
				}));						
			}
		});
	},
	minLength: 1,
	select: function(event, ui){
	},
	open: function() {
	},
	close: function() {
	}
});

// jQuery("#apellidoSearch" ).autocomplete({
// 	source: function( request, response ) {
// 		$.ajax({
// 			url: '<c:url value="/searchClientByName.htm" />',
// 			dataType: "json",
// 			type: "POST",
// 			data: {
// 				featureClass: "P",
// 				style: "full",
// 				maxRows: 12,
// 				nameStartWith: request.term
// 			},
// 			success: function( data ) {
// 				response( jQuery.map( data, function (elementOfArray, indexInArray){							
// 					return  { value:capitaliseFirstLetter(elementOfArray.apellido)};											
// 				}));						
// 			}
// 		});
// 	},
// 	minLength: 1,
// 	select: function(event, ui){
// 	},
// 	open: function() {
// 	},
// 	close: function() {
// 	}
// });


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

$("#closeSelected").click(function(){
	$("#selectedPatientDiv").hide();
});

jQuery("#seeConsultBtn").click(function(){
	window.location.href = "<%=request.getContextPath()%>/agregarConsulta.htm";
});


});
//Other functions

function selectPatient(row){
	jQuery("#selectedPatientName").html(" "+(capitaliseFirstLetter(row.nombre)));
	jQuery("#idPacienteSelected").val(row.idpaciente);
	   jQuery.ajax({
	          url: '<c:url value="/selectPatient.htm" />',
	          type: "GET",
	          dataType: "json",
	          contentType: "application/json",
	          data: {idPatient:row.idpaciente,paName:row.nombre,op:true}, 
	          success: function(resp){     
         	 if(resp!="-2"){ // se encontro paciente
         		jQuery("#selectedPatientDiv").show();
         		if (resp!="-1"){  //Aun no existe consulta
         			jQuery("#seeConsultBtn").show();
         		}
         		else{
         			jQuery("#seeConsultBtn").hide();
         		}
         	 }
         	 else{
         		 jQuery("#dialogErrorOperation").dialog("open");
         		 }
         	 }
	        });	 
	}
	
function updatePatient(row){
	jQuery('#listClientTable').jqGrid('setGridState','hidden');	
	
	jQuery("#nombreC").val(capitaliseFirstLetter(row.nombre));
	jQuery("#direccionC").val(row.domicilio);
	jQuery("#localidadC").val(row.localidadId);
	jQuery("#emailC").val(row.mail);
	jQuery("#telC-1").val(row.telefono);
	
	if(row.sexo=="Masculino"){
		jQuery("#masSexEdit").attr("checked","checked");
	}
	else{
		jQuery("#femSexEdit").attr("checked","checked");
	}
// 	if(row.telefono2.length>1){
// 		jQuery("#addNumberBtn").trigger("click");
// 		jQuery("#telC-2").val(row.telefono2);
// 	}
// 	if(row.telefono3.length>1){
// 		jQuery("#addNumberBtn").trigger("click");
// 		jQuery("#telC-3").val(row.telefono3);
// 	}
	
	jQuery("#cuitC").val(row.dni);
	jQuery("#comentC").val(row.notas);
	jQuery("#typeId").val(row.idos);
	jQuery("#numOS").val(row.nroOs);    
	jQuery("#dateStart").val(row.fechanac);
	jQuery("#clientState").val(row.estadoCliId);
	jQuery("#clientNum").val(row.numerocli);

	jQuery("#idClientEdit").val(row.idcliente);
	jQuery(".editClientDiv").show();
		
	}
	
function delPatient(){
	      var clientObj = jQuery.data(document.body,"PacienteData");
		   jQuery.ajax({
		          url: '<c:url value="/delPatient.htm" />',
		          type: "GET",
		          dataType: "json",
		          contentType: "application/json",
		          data: {idPaciente:clientObj.idPatient}, 
		          success: function(resp){     
	            	 if(resp){
	               		jQuery("#dialogSuccessOperation").dialog( "option", "title", "Eliminar paciente" );
	            		 jQuery("#dialogSuccessOperation").dialog("open");

		          	  }
	            	 else{
	            		 jQuery("#dialogErrorOperation").dialog("open");
	            		 }
	            	 }
		        });	 

}

function cleanScreenSearch(){
	 jQuery("#nombreSearch").val("");
		 jQuery("#cuitSearch").val("");		 
		 jQuery("#localidadSearch").val("");
		 jQuery("#nombreSearch").focus();
}
function cleanScreenEdit(){
	 jQuery(".editClientDiv").hide();			 
     jQuery("#nombreC").val("");
	 jQuery("#direccionC").val("");
	 jQuery("#localidadC").val(0);
	 jQuery("#emailC").val("");
	 jQuery("#telC-1").val("");
	 jQuery("#phone-form-1").remove();
	 jQuery("#phone-form-2").remove();
	 jQuery("#cuitC").val("");
	 jQuery("#comentC").val("");
	 jQuery("#nombreC").focus();
	 jQuery("#listClientTable").trigger('reloadGrid');

}

function cancelEdit(){
	jQuery("div .ui-inline-cancel").trigger("click");
	jQuery(".editClientDiv").hide();
	jQuery("#telC-1").val("");
  	jQuery("#phone-form-1").remove();
  	jQuery("#phone-form-2").remove();
	jQuery('#listClientTable').jqGrid('setGridState','visible');	
	cleanScreenEdit();
}	


function capitaliseFirstLetter(string)
{
    return string.charAt(0).toUpperCase() + string.slice(1);
}
</script> 

  </body>
</html>
