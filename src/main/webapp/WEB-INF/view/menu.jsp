<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form2" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>

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
              <li class="active"><a href="<%=request.getContextPath()%>/login.htm">Inicio</a></li>
              <li class=" dropdown">
               <a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Pacientes <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="nav-header">Operaciones</li>
                  <li class="divider"></li>
                  <li><a href="<%=request.getContextPath()%>/agregarPaciente.htm"><i class="icon-plus"></i> Agregar</a></li>
                  <li class="divider"></li>
                  <li class=""><a href="<%=request.getContextPath()%>/buscarPaciente.htm"><i class="icon-search"></i> Buscar</a></li>
                </ul>
               </li>
           <li class=" dropdown">
               <a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Consulta <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="nav-header">Operaciones</li>
                  <li class=""><a href="<%=request.getContextPath()%>/agregarConsulta.htm"><i class="icon-plus"></i> Agregar</a></li>
                  <li class="divider"></li>
                  <li class="disabled"><a href="#">Buscar Consulta</a></li>
                </ul>
               </li>
               </sec:authorize>
              <li><a href="contacto.htm">Contacto</a></li>
            </ul>
             <div lang="loginDivData" style="display: none" >
            <form class="navbar-form pull-right" action="j_spring_security_check" method="post">
              <input class="span2" type="text" id="j_username" name="j_username" placeholder="Usuario">
              <input class="span2" type="password" id="j_password" name="j_password" placeholder="Password">
              <button type="submit" onclick="jQuery(this).button('loading')" class="btn btn-primary" data-loading-text="Iniciando...">Iniciar sesión</button>
            </form>
            </div>
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
             <div class="navbar-inner container" id="selectedPatientDiv" style="min-height:20px;display: none">
                    <div class="nav-collapse collapse" style="min-height:20px" >
                       <ul class="nav" style="min-height:20px">
            				<li class="divider-vertical" style="min-height: 20px; height: 25px;">
            				<a href="#" style="padding: 2px 0"><strong>Paciente seleccionado:</strong><span id="selectedPatientName"> ${PACIENTE_NOMBRE}</span> </a>
            				<input type="hidden" value="${PACIENTE_ID}" id="idPacienteSelected">
            				</li>
            			</ul>	
            			<button type="button" class="close" style="color: white;opacity:0.8">×</button>
          			</div>
             </div>      
      </div>
