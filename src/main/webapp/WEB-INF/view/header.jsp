<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<head>
	<meta charset=UTF-8" http-equiv="Content-Type" content="text/html" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="img/favicon.ico">

<title>Bensimon</title>

<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!-- 	<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" charset="utf-8" /> -->

<script type="text/javascript" src="js/jquery-1.7.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen"	href="css/jquery-ui-1.8.16.custom.css" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap_custom.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">

<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>	
<script type="text/javascript" src="js/bootstrap.min.js"></script>

</head>

<style type="text/css">
			body {
/* 			    padding-bottom: 10px; */
			    padding-top: 60px;
			}
  applet { position: absolute; visibility:hidden }  
			
</style>

<script type="text/javascript">
var PRINTER_SEL = <%= request.getSession().getAttribute("PRINTER_SELECTED_NUM")%>;
jQuery(function() {
$('.dropdown-toggle').dropdown();

$(document).ajaxComplete(function(evt, request, settings){
	   if (request.responseText.indexOf('Logueo de usuario') != -1)
		   setTimeout(function(){jQuery("#dialogLostSession").dialog("open")},2000);
});

jQuery("#dialogLostSession").dialog({
	autoOpen: false,
	height: 200,
	modal:true,
	buttons: {
		"Aceptar": function() {
			location.reload();
		}
	},
	resizable: false,
	draggable: false,
	close: function() {
	}
});	

});


function mycallback() {
	document.printApplet.printPDF();
}
</script>

<div id="dialogLostSession"  style="display: none" align="" title="Sesión terminada" >
	<p style="margin:0px;"><span class="ui-icon ui-icon-circle-check" style="float: left; margin: 0 7px 20px 0;"></span>Expiró la sesión, se volverá a loguear al seleccionar aceptar.</p>
</div> 
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
            <ul class="nav" id="menuNav">
            <li class="divider-vertical"></li>
            <sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
              <li id="menuItemInicio" ><a href="login.htm">Inicio</a></li>
              <li id="menuItemPaciente" class=" active dropdown">
               <a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Pacientes <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="nav-header">Operaciones</li>
                  <li class="divider"></li>
                  <li><a href="agregarPaciente.htm"><i class="icon-plus"></i> Agregar</a></li>
                  <li class="divider"></li>
                  <li class=""><a href="buscarPaciente.htm"><i class="icon-search"></i> Buscar</a></li>
                </ul>
               </li>
           <li id="menuItemConsulta" class="dropdown">
               <a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Consulta <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="nav-header">Operaciones</li>
                  <li class=""><a href="agregarConsulta.htm"><i class="icon-plus"></i> Agregar</a></li>
                  <li class="divider"></li>
                  <li class="disabled"><a href="#">Buscar Consulta</a></li>
                </ul>
               </li>
               </sec:authorize>
              <li id="menuItemContacto"  ><a href="contacto.htm">Contacto</a></li>
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
            				<a href="#" style="padding: 2px 0"><strong>Paciente seleccionado:</strong><span id="selectedPatientName"> ${PACIENTE_NOMBRE}</span> </a>
            				<input type="hidden" value="${PACIENTE_ID}"  id="idPacienteSelected">
            				</li>
            			</ul>	
            			<button type="button" class="close"  id="closeSelected"  style="color: white;opacity:0.8;margin-left:10px;">×</button>
            			<button class="btn btn-primary pull-right" type="button" id="seeConsultBtn" style="font-size: 12px;margin-top: 1px; opacity: 0.8; padding: 0 3px; display: none">Ver consulta</button>
          			</div>
             </div>          
      </div>

  

<!-- </header> -->

<%-- 	<jsp:include flush="true" page="menu.jsp"> --%>
<%-- 		<jsp:param name="left" value="1" /> --%>
<%-- 	</jsp:include> --%>
