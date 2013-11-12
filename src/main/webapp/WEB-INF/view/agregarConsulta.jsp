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
		#removeBtn{
		border-radius: 10px 10px 10px 10px;
		margin-top: 8px;
		}
    </style>
    
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/validate.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" media="screen"	href="css/jquery-ui-1.8.16.custom.css" />


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
              <li class=""><a href="login.htm">Inicio</a></li>
              <li class="dropdown">
               <a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Paciente <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="nav-header">Operaciones</li>
                  <li class="divider"></li>
                  <li><a href="agregarPaciente.htm">Agregar paciente</a></li>
                  <li class="divider"></li>
                  <li class=""><a href="buscarPaciente.htm">Buscar paciente</a></li>                  
                </ul> 
               </li>
               <li class="dropdown active">
               <a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Consulta <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="nav-header">Operaciones</li>
                  <li class="divider"></li>
                  <li class=""><a href="agregarConsulta.htm">Agregar Consulta</a></li>
                  <li class="divider"></li>
                  <li class=""><a href="assignClientAbono.htm">Buscar Consulta</a></li>
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
      </div>

    <div class="container">
     <div class="row-fluid">
        <div class="span12">
			<ul class="nav nav-tabs" id="myTab">
				<li class="active"><a href="#preconsulta">PreConsulta</a></li>
				<li><a href="#consulta">Motivo</a></li>
				<li><a href="#evaClinica">Evaluación clínica</a></li>
				<li><a href="#exaProcto">Examen proctológico</a></li>
				<li><a href="#estadific">Estadificación</a></li>
				<li><a href="#anPatologica">Anatomia patológica</a></li>
				<li><a href="#tratamiento">Tratamiento</a></li>
				<li><a href="#traNeoAd">Tratamiento Neoadyuante</a></li>			
				<li><a href="#anaPato">Anatomia patológica</a></li>	
				<li><a href="#trataAdyu">Tratamiento adyuvante</a></li>	
			</ul>
			<div class="tab-content">
			 <div class="tab-pane active" id="preconsulta">
				 <div class="row-fluid">
			     <div class="span12 ">
					  <div class="row-fluid">
			 	  		 <form id="addClientForm" action="" method="post">
				         <div class="row-fluid">
				        	<div class="span3">     
								<label for="nombreC"><strong>Peso</strong></label>
								<div class="input-append">		
									<input type="text" class="span10" id="localidadC" name="localidadC" />
									<span class="add-on">kg</span>											
								</div>	
								<label for="direccionC"><strong>Talla</strong></label>
										<div class="input-append">		
									<input type="text" class="span10" id="localidadC" name="localidadC" />
									<span class="add-on">cm</span>											
								</div>	
								<label for="localidadC"><strong>Superficie corporal</strong></label>
								<div class="input-append">		
									<input type="text" class="span10" id="localidadC" name="localidadC" />
									<span class="add-on">m&#178;</span>											
								</div>	
							</div>	
						<div class="span6">
						  <label for="tipoComprobanteCaja"><strong>Performance Status</strong></label>
						   <label class="radio inline">
								 <input type="radio" name="sexo" id="masSex" value="M" checked="checked">0
							</label>
							<label class="radio inline">
								 <input type="radio" name="sexo" id="masSex" value="M" checked="checked">1
							</label>
							<label class="radio inline">
								 <input type="radio" name="sexo" id="masSex" value="M" checked="checked">2
							</label>
							<label class="radio inline">
								 <input type="radio" name="sexo" id="masSex" value="M" checked="checked">3
							</label>
							<label class="radio inline">
								 <input type="radio" name="sexo" id="masSex" value="M" checked="checked">4
							</label>
					
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
				</div>
		<div class="tab-pane" id="consulta">
				 <div class="row-fluid">
			     <div class="span12 ">
				<fieldset>
					<legend>Motivo de la consulta</legend>
					<div class="row-fluid">
					<div class="span4">
					<label class="checkbox">
					<input type="checkbox"> Dolor abodminal
					</label>
					<label class="checkbox">
					<input type="checkbox"> Dolor pelviano
					</label>
					<label class="checkbox">
					<input type="checkbox"> Enterorragia
					</label>
					<label class="checkbox">
					<input type="checkbox"> Diarrea
					</label>
					<label class="checkbox">
					<input type="checkbox"> Tumor palpable
					</label>
					<label class="checkbox">
					<input type="checkbox"> Perdida de peso
					</label>
					<label class="checkbox">
					<input type="checkbox"> Constipación
					</label>
					<label class="checkbox">
					<input type="checkbox"> Adenopatías
					</label>
					<label class="">Otros						
					</label>
					<input type="text" class="span12" id="localidadC" name="localidadC" />		
					</div>
					 <div class="span3 ">	
					<label for="dateStart"><strong>Fecha de inicio de sintomas</strong></label>
				   	<input type="text" class="span5" id="dateStart" alt="dateP" name="dateStart" placeHolder="dd/MM/yyyy" />			  		
					<label for="dateStart"><strong>Tiempo de evolucion en meses</strong></label>
				    <input type="text" class="span8" id="dateStart"  name="dateStart"  />			  	
				  	</div>
				  </div>	
					</fieldset>
			      </div>

		
			      </div><!--/row-->
			     <div class="row-fluid">
			     <div class="span12 ">
				<fieldset>
					<legend>Antecedentes</legend>
					<div class="row-fluid">
						<div class="span12">
						  <label for="tipoComprobanteCaja"><strong>Personales</strong></label>
						   <label class="radio inline">
							<input type="checkbox"> Tabaquismo
							</label>
							<label class="radio inline">
							<input type="checkbox"> Cardiovasculares
							</label>
							<label class="radio inline">
							<input type="checkbox"> Alcohólismo
							</label>
							<label class="radio inline">
							<input type="checkbox"> DBT
							</label>
							<label class="radio inline">
							<input type="checkbox"> Ninguno
							</label>
							<label class="radio inline">
							Otro:  <input type="text" class="span9" id="dateStart"  name="dateStart"  />
							</label>	
				  		</div>			  	
				  </div>	
				  <br>
				  	<div class="row-fluid">
						<div class="span12">
						  <label for="tipoComprobanteCaja"><strong>Personales patológicos</strong></label>
						   <label class="radio inline">
							<input type="checkbox"> Ninguno
							</label>
							<label class="radio inline">
							<input type="checkbox"> Colitis ulcerativa
							</label>
							<label class="radio inline">
							<input type="checkbox"> Adenoma Velloso
							</label>
							<label class="radio inline">
							<input type="checkbox"> Enfermadad de CROHN
							</label>
							<label class="radio inline">
							<input type="checkbox" id="neoplasia" > Neoplasia maligna
							</label>
							<label class="radio inline">
							<input type="checkbox"> HIV
							</label>
							<div id="ocultoDiv" style="display: none;margin-top:8px" class="form-inline">
								<div class="row-fluid">
								<div class="span12">
								<label class=""> Cual neoplasia: </label>
								<input type="text" class="span4" id="dateStart"  name="dateStart"  />
								</div>
								</div>
							</div>
				  		</div>			  	
				  </div>
				  <br>
				  <div class="row-fluid">
						<div class="span12">
						  <label for="tipoComprobanteCaja"><strong>Familiares de cáncer de colon o recto</strong></label>
						   <label class="radio">
							<input type="checkbox"> Ninguno
							</label>
							<div style="display: block;margin-bottom:5px">
								<label class="radio" style="display: inline;">
								<input type="checkbox" id="checkfamMenor60"> Familiar de 1º grado < 60 años
								</label>
								<div id="divfamMenor60" class="form-inline" style="display: none; margin-left: 20px">
								<label>Nro: </label>
								<input type="text" class="input-mini" id="famMenor60">
								</div>
							</div>
							
							<div style="display: block;margin-bottom:5px">							
								<label class="radio" style="display: inline;">
								<input type="checkbox" id="checkfamMayor60"> Familiar de 1º grado > 60 años
								</label>
								<div id="divfamMayor60" class="form-inline" style="display: none; margin-left: 20px">
								<label>Nro: </label>
								<input type="text" class="input-mini" id="famMayor60">
								</div>
							</div>
							
							<label class="radio" style="display: inline;">
							<input type="checkbox" id="checkfamSegundoGrado"> Familiar de 2º grado
							</label>
							<div id="divfamSegundoGrado" class="form-inline" style="display: none; margin-left: 20px">
							<label>Nro: </label>
							<input type="text" class="input-mini" id="famSegundoGrado">
							</div>					
				  		</div>			  	
				  </div>	
				    <br>
				  <div class="row-fluid">
						<div class="span12">
						  <label for="tipoComprobanteCaja"><strong>Antecedente de Síndrome CCRH</strong></label>
						   <label class="radio inline">
							<input type="radio" name="anteSindrome"> No
							</label>
							<label class="radio inline">
							<input type="radio" name="anteSindrome"> No sabe
							</label>
							<label class="radio inline">
							<input type="radio" name="anteSindrome"> En estudio
							</label>
								<label class="radio inline">
								<input type="radio" name="anteSindrome" id="checkCCRHSI"> Si
								</label>
								<div id="divCCRHSI" class="form-inline" style="display: none; margin-left: 20px">
								<label class="radio inline" >
								<input type="checkbox" id="checkMYH)"> PAF
								</label>
								<label class="radio inline" >
								<input type="checkbox" id="checkLYNCH"> LYNCH
								</label>
								<label class="radio inline" >
								<input type="checkbox" id="checkMYH"> MYH
								</label>
								</div>
				  		</div>			  	
				  </div>		
					</fieldset>
			      </div>

			  		<div class="row-fluid">	 
					<div class="pull-right">			
		               <button type="button" onclick="jQuery('#addClientForm').submit();" class="btn btn-primary">Guardar</button>
		               <button type="button" onclick="cleanScreenAdd();" class="btn" >Resetear</button>	
					</div>
				   </div>
			      </div>
			</div>
			<div class="tab-pane" id="evaClinica">
				 <div class="row-fluid">
				     <div class="span12 ">
				     	<fieldset>
							<legend>Hallazgos clínicos</legend>
						<div class="row-fluid">
							<div class="span12">
							  <label for="tipoComprobanteCaja"><strong>Abdomen</strong></label>
							   <label class="radio inline">
								<input type="checkbox"> Tumor palpable
								</label>
								<label class="radio inline">
								<input type="checkbox"> Móvil
								</label>
								<label class="radio inline">
								<input type="checkbox"> Fija
								</label>
								<label class="radio inline">
								<input type="checkbox"> Hepatomegalia
								</label>
								<label class="radio inline">
								<input type="checkbox"> Ascitis
								</label>
					  		</div>			  	
					  </div>	
					 <br> 
					 <div class="row-fluid">
							<div class="span12">
							  <label for="tipoComprobanteCaja"><strong>Colon</strong></label>
							   <label class="radio inline">
								<input type="checkbox"> Ciego
								</label>
								<label class="radio inline">
								<input type="checkbox"> Apéndice
								</label>
								<label class="radio inline">
								<input type="checkbox"> Colon ascendente
								</label>
								<label class="radio inline">
								<input type="checkbox"> Colon descendente
								</label>
								<label class="radio inline">
								<input type="checkbox"> Colon sigmoideo
								</label>
								<label class="radio inline">
								<input type="checkbox"> Colon transverso
								</label>		
					  		</div>			  	
					  </div> 
					 <br> 
					 <div class="row-fluid">
							<div class="span6">
							  <label for="tipoComprobanteCaja"><strong>Recto</strong></label>
							   <label class="radio inline">
								<input type="checkbox"> Tercio superior
								</label>
								<label class="radio inline">
								<input type="checkbox"> Tercio medio
								</label>
								<label class="radio inline">
								<input type="checkbox"> Tercio inferior
								</label>
					  		</div>		
					  		<div class="span6">
							  <label for="tipoComprobanteCaja"><strong>Adenopatias</strong></label>
							   <label class="radio inline">
								<input type="checkbox"> No
								</label>
								<label class="radio inline">
								<input type="checkbox"> Inguinales
								</label>
								<label class="radio inline">
								<input type="checkbox"> Cervicales
								</label>
								<label class="radio inline">
								<input type="checkbox"> Otras
								</label>	
					  		</div>			  	
					  </div> 
					 <br> 
					  	<div class="row-fluid">	 
								<div class="span7">							 
									<label for="comentC"><strong>Notas</strong></label>
								  		<textarea name="notasEvaCli" id="notasEvaCli" rows="3" class="input-block-level"></textarea>
								</div>
						</div>					  
					 </fieldset> 
				      </div>
			      </div><!--/row-->		
				</div>	
			<div class="tab-pane" id="exaProcto">
						<div class="row-fluid">
							<div class="span12">
							  <label for="tipoComprobanteCaja"><strong>Tacto rectal</strong></label>
								<div class="span2" style="padding-bottom:1.1em;">	
								<label for="movilRectal"><strong>Movil</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="movilRectal" id="opcion1" value="0" checked="checked">
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
									    <input type="radio" name="fijoRectal" id="opcion1" value="0" checked="checked">
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
									    <input type="radio" name="esfinterRectal" id="opcion1" value="0" checked="checked">
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
						<div class="row-fluid">
							<div class="span12">
							  <label for="tipoComprobanteCaja"><strong>RSC</strong></label>
								<div class="span2" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Presente</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion1" value="0" checked="checked">
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										Si
									</label>
								</div>	
								<div class="span8" style="padding-bottom:1.1em;display: none" id="divRSC">	
								<label for="esfinterRectal"><strong>Medida</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion1" value="0" checked="checked">
										0-5cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion2" value="1">
										5-10 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion3" value="2">
										10-12 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										> 12 cm
									</label>		
								<div class="form-inline" style="display: inline;margin-left:20px">			
									<label for="esfinterRectal">Altura</label>
										<input type="text" class="input-mini" >
									<label for="esfinterRectal">Fecha</label>
										<input type="text" class="span2" alt="dateP" >
								</div>		
								</div>	
					  </div> 					  
				</div>
						<div class="row-fluid">
							<div class="span12">
							  <label for="tipoComprobanteCaja"><strong>VCC</strong></label>
								<div class="span2" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Presente</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="vccPresente" id="opcion1" value="0" checked="checked">
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="vccPresente" id="opcion2" value="1">
										Si
									</label>
								</div>	
									<div class="span4" style="padding-bottom:1.1em;display: none" id="divVCC">	
								<label for="esfinterRectal"><strong>Tipo</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion1" value="0" checked="checked">
										Completa
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion2" value="1">
										Incompleta
									</label>
									<label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion2" value="1">
										T.infranqueable
									</label>
									</div>
								<div class="span8" style="padding-bottom:1.1em;display: none" id="divVCC1">	
								<label for="esfinterRectal"><strong>Medida</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion1" value="0" checked="checked">
										0-5cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion2" value="1">
										5-10 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion3" value="2">
										10-12 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										> 12 cm
									</label>		
								<div class="form-inline" style="display: inline;margin-left:20px">			
									<label for="esfinterRectal">Altura</label>
										<input type="text" class="input-mini" >
									<label for="esfinterRectal">Fecha</label>
										<input type="text" class="span2" alt="dateP" >
								</div>		
								</div>	
					  </div> 					  
			</div>
				<div class="row-fluid">
							<div class="span12">
							  <label for="tipoComprobanteCaja"><strong>EE</strong></label>
								<div class="row-fluid">	
								<div class="span2" style="padding-bottom:1.1em;margin-left:2.5641%">	
								<label for="rsc"><strong>Presente</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="eePresente" id="opcion1" value="0" checked="checked">
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="eePresente" id="opcion2" value="1">
										Si
									</label>
								</div>	
									<div class="span4" style="padding-bottom:1.1em;display: none" id="divEE">	
								<label for="esfinterRectal"><strong>Tipo</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion1" value="0" checked="checked">
										1
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion2" value="1">
										2
									</label>
									<label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion3" value="3">
										3
									</label>
									<label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										4
									</label>
									<label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										N0
									</label>
										<label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										N1
									</label>
										<label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										N2
									</label>
									</div>
								</div>	
								<div class="row-fluid">	
								<div class="span2" style="padding-bottom:1.1em;display: none;margin-left:2.5641%" id="divEE1">	
								 <label for="eeesfinter"><strong>Infiltra esfinter</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="eeesfinter" id="opcion1" value="0" checked="checked">
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="eeesfinter" id="opcion2" value="1">
										Si
									</label>
								</div>
								<div class="span8" style="padding-bottom:1.1em;display: none" id="divEEesfinter">									
								<label for="esfinterRectal"><strong>Medida</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion1" value="0" checked="checked">
										0-5cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion2" value="1">
										5-10 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion3" value="2">
										10-12 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										> 12 cm
									</label>		
									<div class="form-inline" style="display: inline;margin-left:20px">			
										<label for="esfinterRectal">Fecha</label>
											<input type="text" class="span2" alt="dateP" >
									</div>		
								</div>	
							</div>	
					  </div> 					  
			</div>					
		</div>
		<div class="tab-pane" id="estadific">
						<div class="row-fluid">
							<div class="span12">
							  <label for=""><strong>RM</strong></label>
								<div class="span10 form-inline" style="padding-bottom:1.1em;">	
								   <label for="esfinterRectal">Centro</label>
									<input type="text" class="span2" >
								   <label for="esfinterRectal">Fecha</label>
									<input type="text" class="span2" alt="dateP" >
									  <label for="esfinterRectal" style="margin-left:25px">Distancia a la porción superior del esfínter</label>
									<input type="text" class="span2"  >
								</div>	
								<div class="span10 form-inline" style="padding-bottom:1.1em;">	
								   <label for="esfinterRectal" style="margin-right:24px">Distancia al margen anal</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion1" value="0" >
										0-5cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion2" value="1">
										5-10 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion3" value="2">
										10-12 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										> 12 cm
									</label>	
								   <label  style="margin-left:25px" for="esfinterRectal">Altura</label>
									<input type="text" class="span2" >	
								</div>	
	
					  		</div>			  	
					  </div> 
						<div class="row-fluid">
							<div class="span12">
								<div class="span10" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>T</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion1" value="0" checked="checked">
										X
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										1
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										2
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										3a
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										3b
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										3c
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										3d
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										4a
									</label>	
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										4b
									</label>	
									 <label class="radio inline" style="margin-left:50px">
									    <input type="radio" name="rscPresente2" id="opcion2" value="1">
										N0
									</label>
								   <label class="radio inline">
									    <input type="radio" name="rscPresente2" id="opcion2" value="1">
										N1a
									</label>
									  <label class="radio inline">
									    <input type="radio" name="rscPresente2" id="opcion2" value="1">
										N1b
									</label>
									 <label class="radio inline">
									    <input type="radio" name="rscPresente2" id="opcion2" value="1">
										N2a
									</label>	
									 <label class="radio inline">
									    <input type="radio" name="rscPresente2" id="opcion2" value="1">
										N2b
									</label>																																		
								</div>	
					  </div> 					  
					</div>
							<div class="row-fluid">
							<div class="span12">
								<div class="span10" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>CRM</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion1" value="0" >
										Positivo
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										Negativo
									</label>																																
								</div>	
						  </div> 					  
						</div>
						<br>
						<div class="row-fluid">
							<div class="span12">
								<div class="span10" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>EMVI</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="emviPresente" id="opcion1" value="0" >
										Positivo
									</label>
								    <label class="radio inline">
									    <input type="radio" name="emviPresente" id="opcion2" value="1">
										Negativo
									</label>		
									 <label class="radio inline" style="margin-left:50px">
									    <input type="radio" name="rscPresente3" id="opcion2" value="1">
										0
									</label>
								   <label class="radio inline">
									    <input type="radio" name="rscPresente3" id="opcion2" value="1">
										1
									</label>
									  <label class="radio inline">
									    <input type="radio" name="rscPresente3" id="opcion2" value="1">
										2
									</label>
									 <label class="radio inline">
									    <input type="radio" name="rscPresente3" id="opcion2" value="1">
										3
									</label>	
									 <label class="radio inline">
									    <input type="radio" name="rscPresente3" id="opcion2" value="1">
										4
									</label>																																			
								</div>	
						  </div> 					  
						</div>
						<br>
						<div class="row-fluid">
							<div class="span12">
								<div class="span4" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Depósitos satélites</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="depoSati" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="depoSati" id="opcion2" value="1">
										No
									</label>																															
								</div>	
								<div class="span5" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Estadificación tumores de recto inferior</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="estaRInterior" id="opcion1" value="0" >
										1
									</label>
								    <label class="radio inline">
									    <input type="radio" name="estaRInterior" id="opcion2" value="1">
										2
									</label>	
								    <label class="radio inline">
									    <input type="radio" name="estaRInterior" id="opcion2" value="1">
										3
									</label>
								    <label class="radio inline">
									    <input type="radio" name="estaRInterior" id="opcion2" value="1">
										4
									</label>																																																
								</div>	
						  </div> 					  
						</div>	
						<br>	
						<div class="row-fluid">
							<div class="span12">
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Ganglios Inguinales</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="inguinales" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="inguinales" id="opcion2" value="1">
										No
									</label>																															
								</div>	
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Ganglios Laterales</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="gaLate" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="gaLate" id="opcion2" value="1">
										No
									</label>																															
								</div>	
					            <div class="span4" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Infiltra Esfinter</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion2" value="1">
										No
									</label>																															
								</div>	
						  </div> 					  
						</div>	
						<br>
						<div class="row-fluid">
							<div class="span12">
								<div class="span2" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>TC torax</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion2" value="1">
										No
									</label>																															
								</div>	
							<div class="span2" style="padding-bottom:1.1em;">		
								<label for="rsc"><strong>TC abdomen-pelvis</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion2" value="1">
										No
									</label>																															
								</div>	
								<div class="span2" style="padding-bottom:1.1em;">		
								<label for="rsc"><strong>PET-CT</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion2" value="1">
										No
									</label>																															
								</div>
								<div class="span2" style="padding-bottom:1.1em;">		
								<label for="rsc"><strong>MTS</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion2" value="1">
										No
									</label>																																
								</div>
								<div class="span4 form-inline">			
									<label  style="margin-left:25px" for="esfinterRectal">SUV</label>
									<input type="text" class="span4" >																																
								</div>								
					  		</div>			  	
					  </div> 	
					  <br>
					  	<div class="row-fluid">
							<div class="span12">
							  <label for=""><strong>Marcadores tumorales</strong></label>
								<div class="span3 form-inline" style="padding-bottom:1.1em;">	
								   <label for="esfinterRectal">Fecha</label>
									<input type="text" class="span5" alt="dateP" >
								</div>
								<div class="span2" style="padding-bottom:1.1em;">		
								<label for="rsc"><strong>CEA aumentado</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion2" value="1">
										No
									</label>																																
								</div>
							<div class="span2" style="padding-bottom:1.1em;">		
								<label for="rsc"><strong>CA 19-9 aumentado</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion2" value="1">
										No
									</label>																																
								</div>
							</div>
						</div>	
				 	 <br>
					  	<div class="row-fluid">
							<div class="span5">
							  <label for=""><strong>TNM</strong></label>
								<div class="span12 form-inline" style="padding-bottom:1.1em;">	
								  <label for="esfinterRectal">T</label>
									<input type="text" class="input-small" >
								 <label for="esfinterRectal">N</label>
									<input type="text" class="input-small"  >
							     <label for="esfinterRectal">M</label>
									<input type="text" class="input-small"  >
								</div>
								</div>
							<div class="span5">
					           <label for=""><strong>pTNM</strong></label>
								<div class="span12 form-inline" style="padding-bottom:1.1em;">	
								  <label for="esfinterRectal">pT</label>
									<input type="text" class="input-small" >
								 <label for="esfinterRectal">pN</label>
									<input type="text" class="input-small"  >
							     <label for="esfinterRectal">pM</label>
									<input type="text" class="input-small"  >
								</div>
							</div>
						</div>
				 	 <br>
					  	<div class="row-fluid">
							<div class="span11"> 
							  <label for=""><strong>Metástasis a distancia</strong></label>
								<div class="span12 form-inline" style="padding-bottom:1.1em;">	
									<label class="radio inline">
									<input type="checkbox" name="rscPresente" id="opcion1" value="0" checked="checked">
										Ninguna
									</label>
								    <label class="radio inline">
									    <input type="checkbox" name="rscPresente" id="opcion2" value="1">
										Hueso
									</label>
								    <label class="radio inline">
									    <input type="checkbox" name="rscPresente" id="opcion2" value="1">
										Pulmón
									</label>
								    <label class="radio inline">
									    <input type="checkbox" name="rscPresente" id="opcion2" value="1">
										Desc.
									</label>
								    <label class="radio inline">
									    <input type="checkbox" name="rscPresente" id="opcion2" value="1">
										Piel y TCS
									</label>
								    <label class="radio inline">
									    <input type="checkbox" name="rscPresente" id="opcion2" value="1">
										Cerebro
									</label>
								    <label class="radio inline">
									    <input type="checkbox" name="rscPresente" id="opcion2" value="1">
										Ganglios Dist
									</label>
								    <label class="radio inline">
									    <input type="checkbox" name="rscPresente" id="opcion2" value="1">
										Ovario
									</label>	
								    <label class="radio inline">
									    <input type="checkbox" name="rscPresente" id="opcion2" value="1">
										Hígado
									</label>	
									 <label class="radio inline" style="margin-left:30px">Otras</label>
									    <input type="text" name="rscPresente2" id="opcion2">
   								     </div>			  
							</div>
						</div>
					 <div class="row-fluid">
				     <div class="span12 ">
				     	<fieldset>
							<legend>Revisión RM en Correcto</legend>
						<div class="row-fluid">
							<div class="span2">	  	 
							  	<label for="esfinterRectal">Fecha</label>
								 <input type="text" class="span8" alt="dateP" >
							</div>	 
							<div class="span3">	  	 
								   	<label for="esfinterRectal">Distancia a la porción superior del esfínter</label>
								 <input type="text" class="span8" >
							</div>	 
								<div class="span6 form-inline" style="padding-bottom:1.1em;">	
								   <label for="esfinterRectal" style="margin-right:24px">Distancia al margen anal</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion1" value="0" >
										0-5cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion2" value="1">
										5-10 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion3" value="2">
										10-12 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										> 12 cm
									</label>	
					  			</div>	
					  		</div>		
					  		<div class="row-fluid">	
					  			<div class="span6">	  	 
					  			 <label  for="esfinterRectal">Altura</label>
					  				 <input type="text" class="input-small" >
					  			 </div>
					  		</div>
					  		<br>	
					  		<div class="row-fluid">	
					  		<div class="span11"> 
							  <label for=""><strong>T</strong></label>
								<div class="span12 form-inline" style="padding-bottom:1.1em;">	
									<label class="radio inline">
									<input type="radio" name="tRevision" id="opcion1" value="0" checked="checked">
										X
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tRevision" id="opcion2" value="1">
										1
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tRevision" id="opcion2" value="1">
										2
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tRevision" id="opcion2" value="1">
										3a
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tRevision" id="opcion2" value="1">
										3b
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tRevision" id="opcion2" value="1">
										3c
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tRevision" id="opcion2" value="1">
										3d 
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tRevision" id="opcion2" value="1">
										4a
									</label>	
								    <label class="radio inline">
									    <input type="radio" name="tRevision" id="opcion2" value="1">
										4b
									</label>	
									<label class="radio inline" style="margin-left:50px">
									    <input type="radio" name="tRevision2" id="opcion2" value="1">
										N0
									</label>
								   <label class="radio inline">
									    <input type="radio" name="tRevision2" id="opcion2" value="1">
										N1a
									</label>
									  <label class="radio inline">
									    <input type="radio" name="tRevision2" id="opcion2" value="1">
										N1b
									</label>
									 <label class="radio inline">
									    <input type="radio" name="tRevision2" id="opcion2" value="1">
										N2a
									</label>	
									 <label class="radio inline">
									    <input type="radio" name="tRevision2" id="opcion2" value="1">
										N2b
									</label>	
   								     </div>			  
							</div>	
						</div>	
						<br>
						<div class="row-fluid">
							<div class="span12">
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>CRM</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion1" value="0" >
										Positivo
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										Negativo
									</label>																																
								</div>	
							<div class="span7" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>EMVI</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="emviPresente" id="opcion1" value="0" >
										Positivo
									</label>
								    <label class="radio inline">
									    <input type="radio" name="emviPresente" id="opcion2" value="1">
										Negativo
									</label>		
									 <label class="radio inline" style="margin-left:50px">
									    <input type="radio" name="rscPresente3" id="opcion2" value="1">
										0
									</label>
								   <label class="radio inline">
									    <input type="radio" name="rscPresente3" id="opcion2" value="1">
										1
									</label>
									  <label class="radio inline">
									    <input type="radio" name="rscPresente3" id="opcion2" value="1">
										2
									</label>
									 <label class="radio inline">
									    <input type="radio" name="rscPresente3" id="opcion2" value="1">
										3
									</label>	
									 <label class="radio inline">
									    <input type="radio" name="rscPresente3" id="opcion2" value="1">
										4
									</label>																																			
								</div>	
						  </div> 
						 </div> 	
						 <div class="row-fluid">
						 	<div class="span7" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Estadificación tumores de recto inferior</strong></label>		
								   <label class="radio inline">
									    <input type="radio" name="rscPresente3" id="opcion2" value="1">
										1
									</label>
									  <label class="radio inline">
									    <input type="radio" name="rscPresente3" id="opcion2" value="1">
										2
									</label>
									 <label class="radio inline">
									    <input type="radio" name="rscPresente3" id="opcion2" value="1">
										3
									</label>	
									 <label class="radio inline">
									    <input type="radio" name="rscPresente3" id="opcion2" value="1">
										4
									</label>																																			
								</div>	
							</div>	
						<div class="row-fluid">
							<div class="span12">
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Ganglios Inguinales</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="inguinales" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="inguinales" id="opcion2" value="1">
										No
									</label>																															
								</div>	
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Ganglios Laterales</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="gaLate" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="gaLate" id="opcion2" value="1">
										No
									</label>																															
								</div>	
					            <div class="span4" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Infiltra Esfinter</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion2" value="1">
										No
									</label>																															
								</div>	
						  </div> 	
						 </div> 			
					 </fieldset>
					 </div>
					 </div>																						
		</div>
	<div class="tab-pane" id="anPatologica">
			<div class="row-fluid">
			<div class="span3">
				    <label><strong>Nº Biopsia</strong></label>
					<input type="text" name="esfinter" id="opcion1" >
					<label><strong>AP Sugestiva de IMS</strong></label>
			        <label class="radio inline">
						 <input type="radio" name="esfinter" id="opcion1" value="0" >
								Si
					</label>
					<label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								No
				    </label>
			</div>
			<div class="span3">
					<label for="esfinterRectal"><strong>Fecha</strong></label>
					<input type="text" class="span5" alt="dateP" >
					   <label><strong>IHQ</strong></label>
			        <label class="radio inline">
						 <input type="radio" name="esfinter" id="opcion1" value="0" >
								Si
					</label>
					<label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								No
				    </label>		
			</div>		
			<div class="span3">
					<label><strong>Diagnóstico Histológico</strong></label>
					<input type="text" name="esfinter" id="opcion1" >
					<label><strong>Expresión conservada</strong></label>
			        <label class="radio inline">
						 <input type="radio" name="esfinter" id="opcion1" value="0" >
								Si
					</label>
					<label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								No
				    </label>		
				    <label><strong>Nota</strong></label>
					<input type="text" name="esfinter" id="opcion1" >
			</div>
			</div>
			<div class="row-fluid">	 
					<div class="span7">							 
							<label for="comentC"><strong>Diagnosticado en</strong></label>
								  <textarea name="comentC" id="comentC" rows="3" class="input-block-level"></textarea>
						</div>
			</div>
			<div class="row-fluid">	 
					<div class="span9">		
					<label><strong>Grado de diferenciación</strong></label>
			        <label class="radio inline">
						 <input type="radio" name="esfinter" id="opcion1" value="0" >
								Diferenciado
					</label>
					<label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								Moderadamente diferenciado
				    </label>
				    <label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								Poco diferenciado
				    </label>
				    <label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								Indiferenciado
				    </label>
				    <label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								Anillo de sello
				    </label>	
				    <label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								Mucina
				    </label>				    			    		    
				    </div>
			</div>
			<br>	  
			<div class="row-fluid">	 
					<div class="span9">		
					<label style="display:inline;margin-right:8px"><strong>Base del diagnóstico</strong></label>
					<label>Cirugía</label>
			        <label class="radio inline">
						 <input type="radio" name="esfinter" id="opcion1" value="0" >
								Si
					</label>
					<label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								No
				    </label>	    
				    <label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1" style="margin-top:9px">
								Otros:
							<input type="text" name="otro" id="" style="margin-bottom: 0px;">
				    </label>
					<label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								RSC
				    </label>
					<label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								VCC
				    </label>				    				    			    
				    </div>
			</div>		  
		</div>	
		<div class="tab-pane" id="tratamiento">
			<div class="row-fluid">
				<fieldset>
			<legend>Tratamiento</legend>
			<div class="row-fluid">
				<div class="span10">	  	
				 <label><strong>Udaondo</strong></label>
					<label class="radio inline">
						 <input type="radio" name="esfinter" id="opcion1" value="0" >
								Si
					</label>
					<label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								No
				    </label>	    
				    <label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1" style="margin-top:9px">
								Otro:
							<input type="text" class="" name="otro" id="" style="margin-bottom: 0px;">
				    </label>
			</div>
			</div>
		    <br>	
			<div class="row-fluid">
				<div class="span10">	  	
				 <label><strong>Cirugía (ir a AP)</strong></label>
					<label class="radio inline">
						 <input type="radio" name="esfinter" id="opcion1" value="0" >
								Si
					</label>
					<label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								No
				    </label>	    
			</div>
			</div>	
			<br>
				<div class="row-fluid">
				<div class="span10">	  	
				 <label><strong>Quimioterapia de inducción</strong></label>
					<label class="radio inline">
						 <input type="radio" name="esfinter" id="opcion1" value="0" >
								XELOX
					</label>
					<label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								BFOL
				    </label>
					<label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								FOLFOX
				    </label>
					<label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								CAPECITABINA
				    </label>
				    <label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1" style="margin-top:9px">
								Otro:
							<input type="text" class="" name="otro" id="" style="margin-bottom: 0px;">
				    </label>
				    <label class="radio inline">
								N Ciclos:
							<select class="input-mini">
							<option value="0">0</option>
							<option value="0">1</option>
							<option value="0">2</option>
							<option value="0">3</option>
							<option value="0">4</option>
							<option value="0">5</option>
							<option value="0">6</option>
							<option value="0">7</option>
							<option value="0">8</option>
							</select>
				    </label>			    				    				    				    	    
			</div>
			</div>	
			<br>
			<div class="row-fluid">
				<div class="span10">	  	
				 <label><strong>Quimioradioterapia</strong></label>
					<label class="radio inline">
						 <input type="radio" name="esfinter" id="opcion1" value="0" >
								Capecitabina
					</label>
				    <label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1" style="margin-top:9px">
								Otro:
							<input type="text" class="" name="otro" id="" style="margin-bottom: 0px;">
				    </label>	    				    				    	    
				</div>
			</div>		
		<br>	
			<div class="row-fluid">
				<div class="span10">	  	
				 <label><strong>Quimioterapia de Intervalo precirugia</strong></label>
					<label class="radio inline">
						 <input type="radio" name="esfinter" id="opcion1" value="0" >
								Si
					</label>
					<label class="radio inline">
						 <input type="radio" name="esfinter" id="opcion1" value="0" >
								No
					</label>	
					<label class="radio inline">
						 <input type="radio" name="esfinter" id="opcion1" value="0" >
								Capecitabina
					</label>									
				    <label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1" style="margin-top:9px">
								Otro:
							<input type="text" class="" name="otro" id="" style="margin-bottom: 0px;">
				    </label>
				  	<label class="radio inline">
								N Ciclos:
							<select class="input-mini">
							<option value="0">0</option>
							<option value="0">1</option>
							<option value="0">2</option>
							<option value="0">3</option>
							<option value="0">4</option>
							<option value="0">5</option>
							<option value="0">6</option>
							<option value="0">7</option>
							<option value="0">8</option>
							</select>
				    </label>	  	    				    				    	    
				</div>
			</div>							
		</fieldset>
		</div>			
		</div>	
		<div class="tab-pane" id="traNeoAd">
				<div class="row-fluid">
				<div class="span10">	  	
				 <label><strong>Radioterapia</strong></label>
					<label class="radio inline">
						 <input type="radio" name="radioTera" id="opcion1" value="0" >
								No
					</label>
					<label class="radio inline">
						   <input type="radio" name="radioTera" id="opcion2" value="1">
								Si
				    </label>
				 </div>
				</div> 
				  <div id="divRadioTerapia" style="display: none"  class="row-fluid"> 	  
				  <div class="span12" >  
				    <label class="radio inline">
								Dosis total:
							<input type="text" class="" name="otro" id="" style="margin-bottom: 0px;">
				    </label>
				    <label class="radio inline">
					  Fecha inicio:
						<input type="text" class="span5" alt="dateP" >
					</label>	 
					 <label class="radio inline">
					  Fecha final:
						<input type="text" class="span5" alt="dateP" >
					</label>
					<label><strong>Suspendio</strong></label>
					<label class="radio inline">
						 <input type="radio" name="suspenRadio" id="opcion1" value="0" >
								No
					</label>
					<label class="radio inline">
						   <input type="radio" name="suspenRadio" id="opcion2" value="1">
								Si
				    </label>	
				    <div id="suspenDiv" style="display: none">
				     <label class="radio inline">
								Dias:
					<input type="text" class="input-mini" name="otro" id="" style="margin-bottom: 0px;">
				    </label>
				    </div>
				   </div> 
				  </div> 
				 <br>
				 <div class="row-fluid">
					<div class="span10">	  	
					 <label><strong>Quimioterapia</strong></label>
						<label class="radio inline">
							 <input type="radio" name="quimioRadio" id="opcion1" value="0" >
									No
						</label>
						<label class="radio inline">
							   <input type="radio" name="quimioRadio" id="opcion2" value="1">
									Si
					    </label>
					 </div>
				</div>  
				<div id="quimioDiv" style="display: none"  class="row-fluid"> 	  
				  <div class="span12" >  
				    <label class="radio inline">
								Esquema:
						<input type="text" class="" name="otro" id="" style="margin-bottom: 0px;">
				    </label>
				    <label class="radio inline">
					  N ciclos:
							<select class="input-mini">
								<option value="0">0</option>
								<option value="0">1</option>
								<option value="0">2</option>
								<option value="0">3</option>
								<option value="0">4</option>
								<option value="0">5</option>
								<option value="0">6</option>
								<option value="0">7</option>
								<option value="0">8</option>
							</select>				
					</label>
				    <label class="radio inline">
					  Fecha inicio:
						<input type="text" class="span5" alt="dateP" >
					</label>	 						 
					 <label class="radio inline">
					  Fecha finalización:
						<input type="text" class="span5" alt="dateP" >
					</label>
				   </div> 
				  </div> 
				<br>
				 <div class="row-fluid">
					<div class="span10">	  	
					 <label><strong>Toxicidad</strong></label>
						<label class="radio inline">
							 <input type="radio" name="toxiRadio" id="opcion1" value="0" >
									Quimioterapia
						</label>
						<label class="radio inline">
							   <input type="radio" name="toxiRadio" id="opcion2" value="1">
									Radioterapia
					    </label>
						<label class="radio inline"><strong>Grado III-IV</strong></label>
						<label class="radio inline">
							 <input type="radio" name="gradoIII" id="opcion1" value="0" >
									No
						</label>
						<label class="radio inline">
							   <input type="radio" name="gradoIII" id="opcion2" value="1">
									Si
					    </label>
					 </div>
				</div>
			<br>	 
			<div class="row-fluid">
			<fieldset>
			<legend>Respuesta al tratamiento neoadyuante</legend>
					<div class="row-fluid">
							<div class="span12">
							  <label for=""><strong>RM post tratamiento</strong></label>
								<div class="span10 form-inline" style="padding-bottom:1.1em;">	
								   <label for="esfinterRectal">Centro</label>
									<input type="text" class="span2" >
								   <label for="esfinterRectal">Fecha</label>
									<input type="text" class="span2" alt="dateP" >
									  <label for="esfinterRectal" style="margin-left:25px">Distancia a la porción superior del esfínter</label>
									<input type="text" class="span2"  >
								</div>	
								<div class="span10 form-inline" style="padding-bottom:1.1em;">	
								   <label for="esfinterRectal" style="margin-right:24px">Distancia al margen anal</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion1" value="0" >
										0-5cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion2" value="1">
										5-10 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion3" value="2">
										10-12 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										> 12 cm
									</label>	
								   <label  style="margin-left:25px" for="esfinterRectal">Altura</label>
									<input type="text" class="span2" >	
								</div>	
	
					  		</div>			  	
					  </div> 
						<div class="row-fluid">
							<div class="span12">
								<div class="span10" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>T</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion1" value="0" checked="checked">
										X
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										1
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										2
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										3a
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										3b
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										3c
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										3d
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										4a
									</label>	
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										4b
									</label>	
									 <label class="radio inline" style="margin-left:50px">
									    <input type="radio" name="rscPresente2" id="opcion2" value="1">
										N0
									</label>
								   <label class="radio inline">
									    <input type="radio" name="rscPresente2" id="opcion2" value="1">
										N1a
									</label>
									  <label class="radio inline">
									    <input type="radio" name="rscPresente2" id="opcion2" value="1">
										N1b
									</label>
									 <label class="radio inline">
									    <input type="radio" name="rscPresente2" id="opcion2" value="1">
										N2a
									</label>	
									 <label class="radio inline">
									    <input type="radio" name="rscPresente2" id="opcion2" value="1">
										N2b
									</label>																																		
								</div>	
					  </div> 					  
					</div>
							<div class="row-fluid">
							<div class="span12">
								<div class="span10" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>CRM</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion1" value="0" >
										Positivo
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										Negativo
									</label>																																
								</div>	
						  </div> 					  
						</div>
						<br>
						<div class="row-fluid">
							<div class="span12">
								<div class="span10" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>EMVI</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="emviPresente" id="opcion1" value="0" >
										Positivo
									</label>
								    <label class="radio inline">
									    <input type="radio" name="emviPresente" id="opcion2" value="1">
										Negativo
									</label>		
									 <label class="radio inline" style="margin-left:50px">
									    <input type="radio" name="rscPresente3" id="opcion2" value="1">
										0
									</label>
								   <label class="radio inline">
									    <input type="radio" name="rscPresente3" id="opcion2" value="1">
										1
									</label>
									  <label class="radio inline">
									    <input type="radio" name="rscPresente3" id="opcion2" value="1">
										2
									</label>
									 <label class="radio inline">
									    <input type="radio" name="rscPresente3" id="opcion2" value="1">
										3
									</label>	
									 <label class="radio inline">
									    <input type="radio" name="rscPresente3" id="opcion2" value="1">
										4
									</label>																																			
								</div>	
						  </div> 					  
						</div>
						<br>
						<div class="row-fluid">
							<div class="span12">
								<div class="span2" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Depósitos satélites</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="depoSati" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="depoSati" id="opcion2" value="1">
										No
									</label>																															
								</div>	
								<div class="span4" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Estadificación tumores de recto inferior</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="estaRInterior" id="opcion1" value="0" >
										1
									</label>
								    <label class="radio inline">
									    <input type="radio" name="estaRInterior" id="opcion2" value="1">
										2
									</label>	
								    <label class="radio inline">
									    <input type="radio" name="estaRInterior" id="opcion2" value="1">
										3
									</label>
								    <label class="radio inline">
									    <input type="radio" name="estaRInterior" id="opcion2" value="1">
										4
									</label>																																																
								</div>	
								<div class="span5" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Grado de regresion</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="estaRInterior" id="opcion1" value="0" >
										5
									</label>
								    <label class="radio inline">
									    <input type="radio" name="estaRInterior" id="opcion2" value="1">
										4
									</label>	
								    <label class="radio inline">
									    <input type="radio" name="estaRInterior" id="opcion3" value="1">
										3
									</label>
								    <label class="radio inline">
									    <input type="radio" name="estaRInterior" id="opcion4" value="1">
										2
									</label>
									<label class="radio inline">
									    <input type="radio" name="estaRInterior" id="opcion5" value="1">
										1
									</label>																																																									
								</div>
						  </div> 					  
						</div>	
						<br>	
						<div class="row-fluid">
							<div class="span12">
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Ganglios Inguinales</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="inguinales" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="inguinales" id="opcion2" value="1">
										No
									</label>																															
								</div>	
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Ganglios Laterales</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="gaLate" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="gaLate" id="opcion2" value="1">
										No
									</label>																															
								</div>	
					            <div class="span4" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Infiltra Esfinter</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion2" value="1">
										No
									</label>																															
								</div>	
						  </div> 					  
						</div>	
						<br> 	
					  	<div class="row-fluid">
							<div class="span11"> 
							  <label for=""><strong>Evaluación de la respuesta</strong></label>
								<div class="span12 form-inline" style="padding-bottom:1.1em;">	
									<label class="radio inline">
									<input type="radio" name="rscPresente" id="opcion1" value="0" checked="checked">
										RC
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion1" value="1">
										RP
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="2">
										EE
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion3" value="3">
										PE
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion4" value="4">
										No evaluable
									</label>		  
								</div>
							</div>	
						</div>
					</fieldset>	
				</div>		
					<br>
					 <div class="row-fluid">
				     <div class="span12 ">
				     	<fieldset>
							<legend>Exámen Proctologico</legend>
							<div class="row-fluid">
							<div class="span12">
							  <label for="tipoComprobanteCaja"><strong>Tacto rectal</strong></label>
								<div class="span2" style="padding-bottom:1.1em;">	
								<label for="movilRectal"><strong>Movil</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="movilRectal" id="opcion1" value="0" checked="checked">
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
									    <input type="radio" name="fijoRectal" id="opcion1" value="0" checked="checked">
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
									    <input type="radio" name="esfinterRectal" id="opcion1" value="0" checked="checked">
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
						<div class="row-fluid">
							<div class="span12">
							  <label for="tipoComprobanteCaja"><strong>RSC</strong></label>
								<div class="span2" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Presente</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion1" value="0" checked="checked">
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPresente" id="opcion2" value="1">
										Si
									</label>
								</div>	
								<div class="span8" style="padding-bottom:1.1em;display: none" id="divRSC">	
								<label for="esfinterRectal"><strong>Medida</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion1" value="0" checked="checked">
										0-5cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion2" value="1">
										5-10 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion3" value="2">
										10-12 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										> 12 cm
									</label>		
								<div class="form-inline" style="display: inline;margin-left:20px">			
									<label for="esfinterRectal">Altura</label>
										<input type="text" class="input-mini" >
									<label for="esfinterRectal">Fecha</label>
										<input type="text" class="span2" alt="dateP" >
								</div>		
								</div>	
						  </div> 					  
						</div>
						<div class="row-fluid">
							<div class="span12">
							  <label for="tipoComprobanteCaja"><strong>VCC</strong></label>
								<div class="span2" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Presente</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="vccPresente" id="opcion1" value="0" checked="checked">
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="vccPresente" id="opcion2" value="1">
										Si
									</label>
								</div>	
									<div class="span4" style="padding-bottom:1.1em;display: none" id="divVCC">	
								<label for="esfinterRectal"><strong>Tipo</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion1" value="0" checked="checked">
										Completa
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion2" value="1">
										Incompleta
									</label>
									<label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion2" value="1">
										T.infranqueable
									</label>
									</div>
								<div class="span8" style="padding-bottom:1.1em;display: none" id="divVCC1">	
								<label for="esfinterRectal"><strong>Medida</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion1" value="0" checked="checked">
										0-5cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion2" value="1">
										5-10 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion3" value="2">
										10-12 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										> 12 cm
									</label>		
								<div class="form-inline" style="display: inline;margin-left:20px">			
									<label for="esfinterRectal">Altura</label>
										<input type="text" class="input-mini" >
									<label for="esfinterRectal">Fecha</label>
										<input type="text" class="span2" alt="dateP" >
								</div>		
								</div>	
					  </div> 					  
						</div>
						<div class="row-fluid">
							<div class="span12">
							  <label for="tipoComprobanteCaja"><strong>EE</strong></label>
								<div class="row-fluid">	
								<div class="span2" style="padding-bottom:1.1em;margin-left:2.5641%">	
								<label for="rsc"><strong>Presente</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="eePresente" id="opcion1" value="0" checked="checked">
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="eePresente" id="opcion2" value="1">
										Si
									</label>
								</div>	
									<div class="span4" style="padding-bottom:1.1em;display: none" id="divEE">	
								<label for="esfinterRectal"><strong>Tumor</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion1" value="0" checked="checked">
										1
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion2" value="1">
										2
									</label>
									<label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion3" value="3">
										3
									</label>
									<label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										4
									</label>
									<label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										N0
									</label>
										<label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										N1
									</label>
										<label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										N2
									</label>
									</div>
								</div>	
								<div class="row-fluid">	
								<div class="span2" style="padding-bottom:1.1em;display: none;margin-left:2.5641%" id="divEE1">	
								 <label for="eeesfinter"><strong>Infiltra esfinter</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="eeesfinter" id="opcion1" value="0" checked="checked">
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="eeesfinter" id="opcion2" value="1">
										Si
									</label>
								</div>
								<div class="span8" style="padding-bottom:1.1em;display: none" id="divEEesfinter">									
								<label for="esfinterRectal"><strong>Medida</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion1" value="0" checked="checked">
										0-5cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion2" value="1">
										5-10 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion3" value="2">
										10-12 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										> 12 cm
									</label>		
									<div class="form-inline" style="display: inline;margin-left:20px">			
										<label for="esfinterRectal">Fecha</label>
											<input type="text" class="span2" alt="dateP" >
									</div>		
								</div>	
							</div>	
					  </div> 					  
				</div>	
			</fieldset> 	  
			</div>
			<br>
			 <div class="row-fluid">
			    <div class="span12 ">
			    	<fieldset>
						<legend>Conducta post neoadyuvancia</legend>
							<div class="row-fluid">
							<div class="span12">
							  <label for="tipoComprobanteCaja"><strong>Cirugia</strong></label>
								<div class="span2" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Presente</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="ciruNeoRadio" id="opcion1" value="0" checked="checked">
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="ciruNeoRadio" id="opcion2" value="1">
										Si
									</label>
								</div>	
								<div class="span2" style="padding-bottom:1.1em;display: none" id="ciruNeoDiv">	
								<label for="esfinterRectal"><strong>Procedimiento</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="prodCiru" id="opcion1" value="0" checked="checked">
										RA
									</label>
								    <label class="radio inline">
									    <input type="radio" name="prodCiru" id="opcion2" value="1">
										RAUB
									</label>
									</div>
								<div class="span7" style="padding-bottom:1.1em;display: none" id="ciruNeoDiv1">	
								<label for="esfinterRectal"><strong>Miles cilíndrico:</strong></label>
								<label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion1" value="0" >
										Si
								</label>
								<label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion2" value="1">
										No
								</label>	
								<div class="form-inline" style="display: inline;margin-left:20px">			
									<label for="esfinterRectal">Otro</label>
										<input type="text" class="input-small" >
								</div>
								</div>	
						  </div> 					  
						</div>
						<div class="row-fluid">
							<div class="span12">
									<label for="rsc"><strong>Urgencia</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="urgenciaRadio" id="opcion1" value="0" checked="checked">
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="urgenciaRadio" id="opcion2" value="1">
										Si
									</label>
									<div class="form-inline" style="display: inline;margin-left:20px">			
										<label for="esfinterRectal">Fecha</label>
											<input type="text" class="input-small" alt="dateP" >
									</div>		
							</div>			
						</div>
						<br>
						<div class="row-fluid">
								<div class="span12">
									<label for="rsc"><strong>Cirujano</strong></label>
								    <div class="row-fluid">
										<div class="span3">
									    <label class="radio inline">
											Nombre
											<input type="text" class="span10" >
										</label>
										</div>	
										<div class="span6">
										<label for="rsc"><strong>WAIT AND SEE</strong></label>
									    <label class="radio inline">
										    <input type="radio" name="waitSeeRadio" id="opcion1" value="0" checked="checked">
											No
										</label>
									    <label class="radio inline">
										    <input type="radio" name="waitSeeRadio" id="opcion2" value="1">
											Si
										</label>
										<div class="form-inline" style="display: inline;margin-left:20px">			
										<label for="esfinterRectal">Fecha inicio</label>
											<input type="text" class="input-small" alt="dateP" >
									</div>	
									</div>
								 </div>	
							</div>			
						</div>						
					</fieldset>
				  </div>
			  </div>		
		   </div>	
	     </div>     			
		<div class="tab-pane" id="anaPato">
			<div class="row-fluid">
			<div class="span3">
				    <label><strong>Nº Biopsia</strong></label>
					<input type="text" name="esfinter" id="opcion1" >
			</div>
			<div class="span3">
					<label for="esfinterRectal"><strong>Fecha AP</strong></label>
					<input type="text" class="span5" alt="dateP" >		
			</div>
			<div class="row-fluid">		
				<div class="span10">
						<label><strong>Diagnóstico Histológico</strong></label>
						<input type="text" name="esfinter" id="opcion1" class="span9" >
				</div>	
			</div>
			<br>	  			
			<div class="row-fluid">	 
					<div class="span9">		
					<label><strong>Grado de diferenciación</strong></label>
			        <label class="radio inline">
						 <input type="radio" name="esfinter" id="opcion1" value="0" >
								Diferenciado
					</label>
					<label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								Moderadamente diferenciado
				    </label>
				    <label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								Poco diferenciado
				    </label>
				    <label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								Indiferenciado
				    </label>
				    <label class="radio inline">
						   <input type="radio" name="esfinter" id="opcion2" value="1">
								No determinado
				    </label>					    			    		    
				    </div>
			</div>
			<br>	  
			<div class="row-fluid">	 
						<div class="span5">		
								<label for="esfinterRectal"><strong>Tumor</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion1" value="0" checked="checked">
										1
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion2" value="1">
										2
									</label>
									<label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion3" value="3">
										3
									</label>
									<label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										4a
									</label>
									<label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion4" value="3">
										4b
									</label>									
									<label class="radio inline" style="margin-left: 30px ">
									    <input type="radio" name="esfinterRectalN" id="opcion4" value="3">
										N0
									</label>
										<label class="radio inline">
									    <input type="radio" name="esfinterRectalN" id="opcion4" value="3">
										N1
									</label>
										<label class="radio inline">
									    <input type="radio" name="esfinterRectalN" id="opcion4" value="3">
										N2
									</label>
					</div>	  
					<div class="span6" style="margin-top:16px">		
								    <label class="radio inline">
								    Ganglios resecados
									    <input type="text" name="esfinterRectal" class="input-small" id="opcion1" >
									</label>
								    <label class="radio inline">
								    Ganglios positivos
									    <input type="text" name="esfinterRectal" class="input-small" id="opcion2" >		
									</label>
					</div>	  
		</div>	
		<br>
					<div class="row-fluid">
							<div class="span12">
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Invasión Vascular</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="inguinales" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="inguinales" id="opcion2" value="1">
										No
									</label>																															
								</div>	
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Invasión Perineural</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="gaLate" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="gaLate" id="opcion2" value="1">
										No
									</label>																															
								</div>	
					            <div class="span4" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Linfatica</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinter" id="opcion2" value="1">
										No
									</label>																															
								</div>	
						  </div> 					  
						</div>	
				<br>
					<div class="row-fluid">
							<div class="span12">
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Budding Tumoral</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="inguinales" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="inguinales" id="opcion2" value="1">
										No
									</label>																															
								</div>	
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Pushing Border</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="inguinales" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="inguinales" id="opcion2" value="1">
										No
									</label>																															
								</div>	
						  </div> 					  
					</div>
				<br>
					<div class="row-fluid">
							<div class="span12">
								<div class="span5" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Grado de regresión</strong></label>
								    <label class="radio inline">
								   Dvorak
									    <input type="text" name="esfinterRectal" class="input-small" id="opcion2" >		
									</label>
								    <label class="radio inline">
								    CAP
									    <input type="text" name="esfinterRectal" class="input-small" id="opcion2" >		
									</label>																															
								</div>	
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Rta completa patológica</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="inguinales" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="inguinales" id="opcion2" value="1">
										No
									</label>																															
								</div>	
						  </div> 					  
					</div>		
				<br>
					<div class="row-fluid">
							<div class="span12">
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>IHQ</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="ihqRadio" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="ihqRadio" id="opcion2" value="1">
										No
									</label>																															
								</div>	
								<div class="span3" style="padding-bottom:1.1em;">	
									<label for="rsc"><strong>KRAS</strong></label>
								<div class="row-fluid">
								<div class="span5">		
								    <label class="radio inline">
									    <input type="radio" name="krasRadio" id="opcion1" value="0" >
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="krasRadio" id="opcion2" value="1">
										Si
									</label>
								</div>	
								<div class="span5" style="padding-bottom:1.1em;display: none" id="krasDiv">	
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion1" value="0" checked="checked">
										WT
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRectal" id="opcion2" value="1">
										M
									</label>
									</div>
								</div>																												
								</div>	
						  </div> 					                
					</div>													
		</div>
      </div><!--/row-->
      	<div class="tab-pane" id="trataAdyu">
		 <div class="row-fluid">
			  <div class="span12 ">
					<div class="row-fluid">
								<div class="span5">		
								    <label class="radio inline">
									    <input type="radio" name="trataAdyuYesRadio" id="opcion1" value="0" checked="checked" >
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="trataAdyuYesRadio" id="opcion2" value="1">
										Si
									</label>
								</div>	
			       </div>
			      <div id="trataAdyuYesDiv" style="display: none;"> 
			       <br>
					<div class="row-fluid">
								<div class="span12">		
									<label for="rsc"><strong>Quimioterapia</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="trataRadio" id="opcion1" value="0" >
										XELOX
									</label>
								    <label class="radio inline">
									    <input type="radio" name="trataRadio" id="opcion2" value="1">
										BFOL
									</label>
								    <label class="radio inline">
									    <input type="radio" name="trataRadio" id="opcion2" value="1">
										FOLFOX
									</label>
								    <label class="radio inline">
									    <input type="radio" name="trataRadio" id="opcion2" value="1">
										CAPECITABINA
									</label>
								    <label class="radio inline">
								    	Otro:
									    <input type="text" name="trataRadio" id="opcion2">										
									</label>	
									<label class="radio inline">
												N Ciclos:
										<select class="input-mini">
											<option value="0">0</option>
											<option value="0">1</option>
											<option value="0">2</option>
											<option value="0">3</option>
											<option value="0">4</option>
											<option value="0">5</option>
											<option value="0">6</option>
											<option value="0">7</option>
											<option value="0">8</option>
										</select>
				    				</label>																											
								</div>	
			       </div>	
			       <br>
					<div class="row-fluid">
								<div class="span12">		
									<label for="rsc"><strong>Radioterapia</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="radioTeRadio" id="opcion1" value="0" checked="checked">
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="radioTeRadio" id="opcion2" value="1">
										Si
									</label>
								</div>
						</div>
						<div class="row-fluid">
							<div class="span12">		
							    <div class="" style="padding-bottom:1.1em;display: none" id="radioTeDiv">	
									<div class="span3">
											<label><strong>Dosis total</strong></label>
											<input type="text" name="esfinter" id="opcion1" >
									</div>
									<div class="span2">
											<label for=""><strong>Fecha Inicio</strong></label>
											<input type="text" class="span7" alt="dateP" >		
									</div>
									<div class="span2">
											<label for=""><strong>Fecha Finalización</strong></label>
											<input type="text" class="span7" alt="dateP" >		
									</div>	
									<div class="span2">
										<label for=""><strong>Suspendio</strong></label>
			 						   <label class="radio inline">
									    <input type="radio" name="suspendioYesRadio" id="opcion2" value="1">
										Si
										</label>
										<div id="suspendioYesRadioTeDiv" class="radio inline" style="padding-bottom:1.1em;display: none" >
										<label class="radio inline"><strong>Dias:</strong></label>
										<input type="text" class="span4 radio inline" >
										</div>												
									</div>	
								</div>
								   
			      			 </div>					       		       
					   </div> 
				          <div class="row-fluid">	 
								<div class="span7">							 
									<label for="comentC"><strong>Notas</strong></label>
								  		<textarea name="comentCTrataAdyu" id="comentCTrataAdyu" rows="3" class="input-block-level"></textarea>
								</div>
						</div>  
				</div>	   
			</div> 
	     </div><!-- end tab -->
       </div>
	</div>
      <hr>
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
	
    $('#myTab a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
        });
    
    $("#neoplasia").click(function(){
    	
    	if ($("#neoplasia").attr("checked")){
    		$("#ocultoDiv").show();
    	}else{
    		$("#ocultoDiv").hide();
    	}
    	
    });
        
// 	$('#myTab a:last').tab('show');
	
	cleanScreenAdd();
	$("#nombreC").focus();
	
	$("#checkfamMenor60").click(function(){
		if($(this).is(':checked')){
			$("#divfamMenor60").css("display","inline-block");
			$("#famMenor60").focus();
		}
		else{
			$("#divfamMenor60").hide();	
		}
	});
	
	$("#checkfamMayor60").click(function(){
		if($(this).is(':checked')){
			$("#divfamMayor60").css("display","inline-block");
			$("#famMayor60").focus();
		}
		else{
			$("#divfamMayor60").hide();	
		}
	});
	
	$("#checkfamSegundoGrado").click(function(){
		if($(this).is(':checked')){
			$("#divfamSegundoGrado").css("display","inline-block");
			$("#famSegundoGrado").focus();
		}
		else{
			$("#divfamSegundoGrado").hide();
		}
		
	});
	
	$("input[name=anteSindrome]").click(function(){
		if($(this).attr('id')=="checkCCRHSI"){
			$("#divCCRHSI").css("display","inline-block");
		}
		else{
			$("#divCCRHSI").hide();
		}	
	});
	
	$("input[name=rscPresente]").click(function(){
		if($(this).attr('id')=="opcion2"){
			$("#divRSC").show();
		}
		else{
			$("#divRSC").hide();
		}
	});

	$("input[name=vccPresente]").click(function(){
		if($(this).attr('id')=="opcion2"){
			$("#divVCC,#divVCC1").show();
		}
		else{
			$("#divVCC,#divVCC1").hide();
		}
	});

	$("input[name=eePresente]").click(function(){
		if($(this).attr('id')=="opcion2"){
			$("#divEE,#divEE1").show();
		}
		else{
			$("#divEE,#divEE1").hide();
		}
	});
	$("input[name=eeesfinter]").click(function(){
		if($(this).attr('id')=="opcion2"){
			$("#divEEesfinter").show();
		}
		else{
			$("#divEEesfinter").hide();
		}
	});
	$("input[name=radioTera]").click(function(){
		if($(this).attr('id')=="opcion2"){
			$("#divRadioTerapia").show();
		}
		else{
			$("#divRadioTerapia").hide();
		}
	});	
	$("input[name=suspenRadio]").click(function(){
		if($(this).attr('id')=="opcion2"){
			$("#suspenDiv").show();
		}
		else{
			$("#suspenDiv").hide();
		}
	});	
	
	$("input[name=quimioRadio]").click(function(){
		if($(this).attr('id')=="opcion2"){
			$("#quimioDiv").show();
		}
		else{
			$("#quimioDiv").hide();
		}
	});	
	
	$("input[name=ciruNeoRadio]").click(function(){
		if($(this).attr('id')=="opcion2"){
			$("#ciruNeoDiv,#ciruNeoDiv1").show();
		}
		else{
			$("#ciruNeoDiv,#ciruNeoDiv1").hide();
		}
	});	
	$("input[name=krasRadio]").click(function(){
		if($(this).attr('id')=="opcion2"){
			$("#krasDiv").show();
		}
		else{
			$("#krasDiv").hide();
		}
	});	
	$("input[name=radioTeRadio]").click(function(){
		if($(this).attr('id')=="opcion2"){
			$("#radioTeDiv").show();
		}
		else{
			$("#radioTeDiv").hide();
		}
	});	
	
	$("input[name=suspendioYesRadio]").click(function(){
		if($(this).attr('id')=="opcion2"){
			$("#suspendioYesRadioTeDiv").show();
		}
		else{
			$("#suspendioYesRadioTeDiv").hide();
		}
	});	
	
	$("input[name=trataAdyuYesRadio]").click(function(){
		if($(this).attr('id')=="opcion2"){
			$("#trataAdyuYesDiv").show();
		}
		else{
			$("#trataAdyuYesDiv").hide();
		}
	});	
	
	
	
	
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
//         	 var options = $("#clientState");
//         	 $.each(resp.estadoCli, function() {
//         	     options.append($("<option />").val(this.idestadocli).text(this.descripcion));
//         	 });
         }
       });

	 jQuery("input[alt=dateP]").datepicker({
		 showButtonPanel: true,
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
  		var puntuaNew = 1;
  		var comentNew = jQuery("#comentC").val();
  		var typeId = jQuery("#typeId").val();
  		var numOS = jQuery("#numOS").val();
	    var sexoSelected = jQuery("input[name=sexo]:checked").val();

  		
  		var patient = {'idos':typeId,'nombre':nombreNew,'domicilio':localidadNew,'mail':emailNew,'telefono':telNew+"@@"+telNew2+"@@"+telNew3,
  						'notas':comentNew,'fechanac':fechaNac,'nroOs':numOS,"sexo":sexoSelected};		  		 
  		 
        jQuery.ajax({
             url: '<c:url value="/addNewPatient.htm" />',
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
