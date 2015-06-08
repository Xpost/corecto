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

    <jsp:include flush="true" page="header.jsp">
		<jsp:param name="left" value="1" />
	</jsp:include>

    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/validate.css" rel="stylesheet">
	<link rel="stylesheet" href="css/loading.css" type="text/css"/>
                  
  </head>

  <body>

	<div id="dialogLoading" style="display: none" align="center" title="Cargando consulta..." >
	<div id="floatingCirclesG">
		<div class="f_circleG" id="frotateG_01">
		</div>
		<div class="f_circleG" id="frotateG_02">
		</div>
		<div class="f_circleG" id="frotateG_03">
		</div>
		<div class="f_circleG" id="frotateG_04">
		</div>
		<div class="f_circleG" id="frotateG_05">
		</div>
		<div class="f_circleG" id="frotateG_06">
		</div>
		<div class="f_circleG" id="frotateG_07">
		</div>
		<div class="f_circleG" id="frotateG_08">
		</div>
	</div>
<!-- 	<p>(Cerrar cuando aparesca la opcion de guardar/abrir el reporte)</p> -->
	</div>
	
    <div class="container">
    <br>
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
			 	  		 <form id="addPreconsultaForm" action="" method="post">
				         <div class="row-fluid">
				        	<div class="span3">     
								<label for="nombreC"><strong>Peso</strong></label>
								<div class="input-append">		
									<input type="text" class="span6 onlyNumbers" id="pesoPre" name="pesoPre" />
									<span class="add-on">kg</span>											
								</div>	
								<label for="direccionC"><strong>Talla</strong></label>
										<div class="input-append">		
									<input type="text" class="span6 onlyNumbers" id="tallePre" name="tallePre" />
									<span class="add-on">cm</span>											
								</div>	
								<label for="localidadC"><strong>Superficie corporal</strong></label>
								<div class="input-append">		
									<input type="text" class="span6 onlyNumbers" id="superPre" name="superPre" />
									<span class="add-on">m&#178;</span>											
								</div>	
							</div>	
						<div class="span6">
						  <label for="tipoComprobanteCaja"><strong>Performance Status</strong></label>
						   <label class="radio inline">
								 <input type="radio" name="performanceRadio" id="performanceRadio" value="0" checked="checked">0
							</label>
							<label class="radio inline">
								 <input type="radio" name="performanceRadio" id="performanceRadio" value="1" >1
							</label>
							<label class="radio inline">
								 <input type="radio" name="performanceRadio" id="performanceRadio" value="2" >2
							</label>
							<label class="radio inline">
								 <input type="radio" name="performanceRadio" id="performanceRadio" value="3" >3
							</label>
							<label class="radio inline">
								 <input type="radio" name="performanceRadio" id="performanceRadio" value="4" >4
							</label>
					
				  		</div>	
						</div>	
							<div class="row-fluid">	 
								<div class="span7">							 
									<label for="comentC"><strong>Comentario</strong></label>
								  		<textarea name="comentPreconsulta" id="comentPreconsulta" rows="3" class="input-block-level"></textarea>
								</div>
							</div>
							<div class="row-fluid">	 
							<div class="pull-right">			
					               <button type="button" onclick="jQuery('#addPreconsultaForm').submit();" class="btn btn-primary">Guardar</button>
					               <button type="button" onclick="cleanScreenAdd();" class="btn" >Resetear</button>	
							</div>
							</div>
			
			        </form>
					  </div>
			      </div>
			      </div><!--/row-->		
				</div>
		<div class="tab-pane" id="consulta">
				  <form id="addMotivoAntecedentesForm" action="" method="post">
				 <div class="row-fluid">
			     <div class="span12 ">
				<fieldset>
					<legend>Motivo de la consulta</legend>
					<div class="row-fluid">
					<div class="span4">
					<label class="checkbox">
					<input type="checkbox" id="motivo1"> Dolor abodminal
					</label>
					<label class="checkbox">
					<input type="checkbox" id="motivo2"> Dolor pelviano
					</label>
					<label class="checkbox">
					<input type="checkbox" id="motivo3"> Enterorragia
					</label>
					<label class="checkbox">
					<input type="checkbox" id="motivo4"> Diarrea
					</label>
					<label class="checkbox">
					<input type="checkbox" id="motivo5"> Tumor palpable
					</label>
					<label class="checkbox">
					<input type="checkbox" id="motivo6"> Perdida de peso
					</label>
					<label class="checkbox">
					<input type="checkbox" id="motivo7"> Constipación
					</label>
					<label class="checkbox">
					<input type="checkbox" id="motivo8"> Adenopatías
					</label>
					<label class="">Otros						
					</label>
					<input type="text" class="span12" id="motivoOtro" name="motivoOtro" />		
					</div>
					 <div class="span3 ">	
					<label for="dateStart"><strong>Fecha de inicio de sintomas</strong></label>
				   	<input type="text" class="span5" id="dateStartMotivo" alt="dateP" name="dateStartMotivo" placeHolder="dd/MM/yyyy" />			  		
					<label for="dateStart"><strong>Tiempo de evolución en meses</strong></label>
				    <input type="text" class="span3 onlyNumbers" id="mesesMotivo"  name="mesesMotivo"  />			  	
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
							<input type="checkbox" id="apersonal1"> Tabaquismo
							</label>
							<label class="radio inline">
							<input type="checkbox" id="apersonal2"> Cardiovasculares
							</label>
							<label class="radio inline">
							<input type="checkbox" id="apersonal3" > Alcohólismo
							</label>
							<label class="radio inline">
							<input type="checkbox" id="apersonal4"> DBT
							</label>
							<label class="radio inline">
							<input type="checkbox" id="apersonal5" > Ninguno
							</label>
							<label class="radio inline">
							Otro:  <input type="text" class="span9" id="otroAPersonal"  name="otroAPersonal"  />
							</label>	
				  		</div>			  	
				  </div>	
				  <br>
				  	<div class="row-fluid">
						<div class="span12">
						  <label for="tipoComprobanteCaja"><strong>Personales patológicos</strong></label>
						   <label class="radio inline">
							<input type="checkbox" id="apersonalPat1" > Ninguno
							</label>
							<label class="radio inline">
							<input type="checkbox" id="apersonalPat2" > Colitis ulcerativa
							</label>
							<label class="radio inline">
							<input type="checkbox" id="apersonalPat3" > Adenoma Velloso
							</label>
							<label class="radio inline">
							<input type="checkbox" id="apersonalPat4" > Enfermedad de CROHN
							</label>
							<label class="radio inline">
							<input type="checkbox" id="neoplasia"  > Neoplasia maligna
							</label>
							<label class="radio inline">
							<input type="checkbox" id="apersonalPat5"> HIV
							</label>
							<div id="ocultoDiv" style="display: none;margin-top:8px" class="form-inline">
								<div class="row-fluid">
								<div class="span12">
								<label class=""> Cual neoplasia: </label>
								<input type="text" class="span4" id="neoPlasiaText"  name="neoPlasiaText"  />
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
							<input type="checkbox" id="checkfamMenorNin" > Ninguno
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
							<input type="radio" name="anteSindrome" value="1"> No
							</label>
							<label class="radio inline">
							<input type="radio" name="anteSindrome" value="2"> No sabe
							</label>
							<label class="radio inline">
							<input type="radio" name="anteSindrome" value="3"> En estudio
							</label>
								<label class="radio inline">
								<input type="radio" name="anteSindrome" value="4" id="checkCCRHSI"> Si
								</label>
								<div id="divCCRHSI" class="form-inline" style="display: none; margin-left: 20px">
								<label class="radio inline" >
								<input type="checkbox" id="checkPAF"> PAF
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
		               <button type="button" onclick="jQuery('#addMotivoAntecedentesForm').submit();" class="btn btn-primary">Guardar</button>
		               <button type="button" onclick="cleanScreenAdd();" class="btn" >Resetear</button>	
					</div>
				   </div>
			      </div>
			      </form>
			</div>
			<div class="tab-pane" id="evaClinica">
				<form id="addEvaClinicaForm" action="" method="post">
				 <div class="row-fluid">
				     <div class="span12 ">
				     	<fieldset>
							<legend>Hallazgos clínicos</legend>
						<div class="row-fluid">
							<div class="span12">
							  <label for="tipoComprobanteCaja"><strong>Abdomen</strong></label>
							   <label class="radio inline">
								<input type="checkbox" id="haAbdomen1"> Tumor palpable
								</label>
								<label class="radio inline">
								<input type="checkbox" id="haAbdomen2"> Móvil
								</label>
								<label class="radio inline">
								<input type="checkbox" id="haAbdomen3"> Fija
								</label>
								<label class="radio inline">
								<input type="checkbox" id="haAbdomen4"> Hepatomegalia
								</label>
								<label class="radio inline">
								<input type="checkbox" id="haAbdomen5"> Ascitis
								</label>
					  		</div>			  	
					  </div>	
					 <br> 
					 <div class="row-fluid">
							<div class="span12">
							  <label for="tipoComprobanteCaja"><strong>Colon</strong></label>
							   <label class="radio inline">
								<input type="checkbox" id="haColon1" > Ciego
								</label>
								<label class="radio inline">
								<input type="checkbox" id="haColon2" > Apéndice
								</label>
								<label class="radio inline">
								<input type="checkbox" id="haColon3" > Colon ascendente
								</label>
								<label class="radio inline">
								<input type="checkbox" id="haColon4" > Colon descendente
								</label>
								<label class="radio inline">
								<input type="checkbox" id="haColon5" > Colon sigmoideo
								</label>
								<label class="radio inline">
								<input type="checkbox" id="haColon6" > Colon transverso
								</label>		
					  		</div>			  	
					  </div> 
					 <br> 
					 <div class="row-fluid">
							<div class="span6">
							  <label for="tipoComprobanteCaja"><strong>Recto</strong></label>
							   <label class="radio inline">
								<input type="checkbox" id="haRecto1" > Tercio superior
								</label>
								<label class="radio inline">
								<input type="checkbox" id="haRecto2" > Tercio medio
								</label>
								<label class="radio inline">
								<input type="checkbox" id="haRecto3" > Tercio inferior
								</label>
					  		</div>		
					  		<div class="span6">
							  <label for="tipoComprobanteCaja"><strong>Adenopatias</strong></label>
							   <label class="radio inline">
								<input type="checkbox" id="haAdenopatia1"> No
								</label>
								<label class="radio inline">
								<input type="checkbox" id="haAdenopatia2" > Inguinales
								</label>
								<label class="radio inline">
								<input type="checkbox" id="haAdenopatia3" > Cervicales
								</label>
								<label class="radio inline">
								<input type="checkbox" id="haAdenopatia4"> Otras
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
			      <div class="row-fluid">	 
					<div class="pull-right">			
		               <button type="button" onclick="jQuery('#addEvaClinicaForm').submit();" class="btn btn-primary">Guardar</button>
		               <button type="button" onclick="cleanScreenAdd();" class="btn" >Resetear</button>	
					</div>
			      </div>		
			      </form>
				</div>	
			<div class="tab-pane" id="exaProcto">
					<form id="addExaProctoForm" action="" method="post">	
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
								<label for="rscMedida"><strong>Medida</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="rscMedida" id="opcion1" value="0" >
										0-5cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscMedida" id="opcion2" value="1">
										5-10 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscMedida" id="opcion3" value="2">
										10-12 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscMedida" id="opcion4" value="3">
										> 12 cm
									</label>		
								<div class="form-inline" style="display: inline;margin-left:20px">			
									<label for="rscAltura">Altura</label>
										<input type="text" class="input-mini" id="rscAltura" >
									<label for="esfinterRectal">Fecha</label>
										<input type="text" class="span2" alt="dateP"  placeholder="dd/MM/yyyy" id="rscFecha" >
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
								<label for="vccTipo"><strong>Tipo</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="vccTipo" id="opcion1" value="0" checked="checked">
										Completa
									</label>
								    <label class="radio inline">
									    <input type="radio" name="vccTipo" id="opcion2" value="1">
										Incompleta
									</label>
									<label class="radio inline">
									    <input type="radio" name="vccTipo" id="opcion2" value="2">
										T.infranqueable
									</label>
									</div>
								<div class="span8" style="padding-bottom:1.1em;display: none" id="divVCC1">	
								<label for="esfinterRectal"><strong>Medida</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="vccMedida" id="opcion1" value="0" checked="checked">
										0-5cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="vccMedida" id="opcion2" value="1">
										5-10 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="vccMedida" id="opcion3" value="2">
										10-12 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="vccMedida" id="opcion4" value="3">
										> 12 cm
									</label>		
								<div class="form-inline" style="display: inline;margin-left:20px">			
									<label for="esfinterRectal">Altura</label>
										<input type="text" class="input-mini"  id="vccAltura" >
									<label for="esfinterRectal">Fecha</label>
										<input type="text" class="span2" alt="dateP"  placeholder="dd/MM/yyyy" id="vccFecha"  >
								</div>		
								</div>	
					  </div> 					  
			</div>
				<div class="row-fluid">
							<div class="span12">
							  <label for="tipoComprobanteCaja"><strong>EE</strong></label>
								<div class="row-fluid">	
								<div class="span2" style="padding-bottom:1.1em;margin-left:2.5641%">	
								<label for="ee"><strong>Presente</strong></label>
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
								<label for="eeTipo"><strong>Tipo</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="eeTipo" id="opcion1" value="0" checked="checked">
										1
									</label>
								    <label class="radio inline">
									    <input type="radio" name="eeTipo" id="opcion2" value="1">
										2
									</label>
									<label class="radio inline">
									    <input type="radio" name="eeTipo" id="opcion3" value="2">
										3
									</label>
									<label class="radio inline">
									    <input type="radio" name="eeTipo" id="opcion4" value="3">
										4
									</label>
									<label class="radio inline">
									    <input type="radio" name="eeTipoN" id="opcion1" value="1">
										N0
									</label>
										<label class="radio inline">
									    <input type="radio" name="eeTipoN" id="opcion2" value="2">
										N1
									</label>
										<label class="radio inline">
									    <input type="radio" name="eeTipoN" id="opcion3" value="3">
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
								<label for="eeMedida"><strong>Medida</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="eeMedida" id="opcion1" value="0" checked="checked">
										0-5cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="eeMedida" id="opcion2" value="1">
										5-10 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="eeMedida" id="opcion3" value="2">
										10-12 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="eeMedida" id="opcion4" value="3">
										> 12 cm
									</label>		
									<div class="form-inline" style="display: inline;margin-left:20px">			
										<label for="esfinterRectal">Fecha</label>
											<input type="text" class="span2" alt="dateP"  placeholder="dd/MM/yyyy" id="eeFecha" >
									</div>		
								</div>	
							</div>	
					  </div> 					  
			</div>
			 <div class="row-fluid">	 
					<div class="pull-right">			
		               <button type="button" onclick="jQuery('#addExaProctoForm').submit();" class="btn btn-primary">Guardar</button>
		               <button type="button" onclick="cleanScreenAdd();" class="btn" >Resetear</button>	
					</div>
		      </div>				
		</form>			
		</div>
		<div class="tab-pane" id="estadific">
				<form id="addEstadificacionForm" action="" method="post">	
						<div class="row-fluid">
							<div class="span12">
							  <label for=""><strong>RM</strong></label>
								<div class="span10 form-inline" style="padding-bottom:1.1em;">	
								   <label for="centroRM">Centro</label>
									<input type="text" class="span2" id="centroRM" >
								   <label for="fechaRM">Fecha</label>
									<input type="text" class="span2" alt="dateP"  placeholder="dd/MM/yyyy" id="fechaRM">
									  <label for="distanciaSupRM" style="margin-left:25px">Distancia a la porción superior del esfínter</label>
									<input type="text" class="span2"  id="distanciaSupRM" >
								</div>	
								<div class="span10 form-inline" style="padding-bottom:1.1em;">	
								   <label for="distanciaMarARadio" style="margin-right:24px">Distancia al margen anal</label>
								    <label class="radio inline">
									    <input type="radio" name="distanciaMarARadio" id="opcion1" value="0" >
										0-5cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="distanciaMarARadio" id="opcion2" value="1">
										5-10 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="distanciaMarARadio" id="opcion3" value="2">
										10-12 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="distanciaMarARadio" id="opcion4" value="3">
										> 12 cm
									</label>	
								   <label  style="margin-left:25px" for="esfinterRectal">Altura</label>
									<input type="text" class="span2" id="alturaRM" >	
								</div>	
	
					  		</div>			  	
					  </div> 
						<div class="row-fluid">
							<div class="span12">
								<div class="span10" style="padding-bottom:1.1em;">	
								<label for="numT"><strong>T</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="numTRadio" id="opcion1" value="0" checked="checked">
										X
									</label>
								    <label class="radio inline">
									    <input type="radio" name="numTRadio" id="opcion2" value="1">
										1
									</label>
								    <label class="radio inline">
									    <input type="radio" name="numTRadio" id="opcion2" value="2">
										2
									</label>
								    <label class="radio inline">
									    <input type="radio" name="numTRadio" id="opcion2" value="3">
										3a
									</label>
								    <label class="radio inline">
									    <input type="radio" name="numTRadio" id="opcion2" value="4">
										3b
									</label>
								    <label class="radio inline">
									    <input type="radio" name="numTRadio" id="opcion2" value="5">
										3c
									</label>
								    <label class="radio inline">
									    <input type="radio" name="numTRadio" id="opcion2" value="6">
										3d
									</label>
								    <label class="radio inline">
									    <input type="radio" name="numTRadio" id="opcion2" value="7">
										4a
									</label>	
								    <label class="radio inline">
									    <input type="radio" name="numTRadio" id="opcion2" value="8">
										4b
									</label>	
									 <label class="radio inline" style="margin-left:50px">
									    <input type="radio" name="numTNRadio" id="opcion2" value="0">
										N0
									</label>
								   <label class="radio inline">
									    <input type="radio" name="numTNRadio" id="opcion2" value="1">
										N1a
									</label>
									  <label class="radio inline">
									    <input type="radio" name="numTNRadio" id="opcion2" value="2">
										N1b
									</label>
									 <label class="radio inline">
									    <input type="radio" name="numTNRadio" id="opcion2" value="3">
										N2a
									</label>	
									 <label class="radio inline">
									    <input type="radio" name="numTNRadio" id="opcion2" value="4">
										N2b
									</label>																																		
								</div>	
					  </div> 					  
					</div>
							<div class="row-fluid">
							<div class="span12">
								<div class="span10" style="padding-bottom:1.1em;">	
								<label for="crmPresente"><strong>CRM</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="crmPresente" id="opcion1" value="0" >
										Positivo
									</label>
								    <label class="radio inline">
									    <input type="radio" name="crmPresente" id="opcion2" value="1">
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
									    <input type="radio" name="emviPresente" id="opcion2" value="2">
										0
									</label>
								   <label class="radio inline">
									    <input type="radio" name="emviPresente" id="opcion2" value="3">
										1
									</label>
									  <label class="radio inline">
									    <input type="radio" name="emviPresente" id="opcion2" value="4">
										2
									</label>
									 <label class="radio inline">
									    <input type="radio" name="emviPresente" id="opcion2" value="5">
										3
									</label>	
									 <label class="radio inline">
									    <input type="radio" name="emviPresente" id="opcion2" value="6">
										4
									</label>																																			
								</div>	
						  </div> 					  
						</div>
						<br>
						<div class="row-fluid">
							<div class="span12">
								<div class="span4" style="padding-bottom:1.1em;">	
								<label for="depoSati"><strong>Depósitos satélites</strong></label>
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
								<label for="estaRInterior"><strong>Estadificación tumores de recto inferior</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="estaRInterior" id="opcion1" value="0" >
										1
									</label>
								    <label class="radio inline">
									    <input type="radio" name="estaRInterior" id="opcion2" value="1">
										2
									</label>	
								    <label class="radio inline">
									    <input type="radio" name="estaRInterior" id="opcion2" value="2">
										3
									</label>
								    <label class="radio inline">
									    <input type="radio" name="estaRInterior" id="opcion2" value="3">
										4
									</label>																																																
								</div>	
						  </div> 					  
						</div>	
						<br>	
						<div class="row-fluid">
							<div class="span12">
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="inguinales"><strong>Ganglios Inguinales</strong></label>
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
								<label for="gaLate"><strong>Ganglios Laterales</strong></label>
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
								<label for="esfinter"><strong>Infiltra Esfinter</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRM" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterRM" id="opcion2" value="1">
										No
									</label>																															
								</div>	
						  </div> 					  
						</div>	
						<br>
						<div class="row-fluid">
							<div class="span12">
								<div class="span2" style="padding-bottom:1.1em;">	
								<label for="tcTorax"><strong>TC torax</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="tcTorax" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tcTorax" id="opcion2" value="1">
										No
									</label>																															
								</div>	
							<div class="span2" style="padding-bottom:1.1em;">		
								<label for="tcAbdomen"><strong>TC abdomen-pelvis</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="tcAbdomen" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tcAbdomen" id="opcion2" value="1">
										No
									</label>																															
								</div>	
								<div class="span2" style="padding-bottom:1.1em;">		
								<label for="petTC"><strong>PET-CT</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="petTC" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="petTC" id="opcion2" value="1">
										No
									</label>																															
								</div>
								<div class="span2" style="padding-bottom:1.1em;">		
								<label for="mtsRadio"><strong>MTS</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="mtsRadio" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="mtsRadio" id="opcion2" value="1">
										No
									</label>																																
								</div>
								<div class="span4 form-inline">			
									<label  style="margin-left:25px" for="esfinterRectal">SUV</label>
									<input type="text" class="span4" id="suvEstati">																																
								</div>								
					  		</div>			  	
					  </div> 	
					  <br>
					  	<div class="row-fluid">
							<div class="span12">
							  <label for=""><strong>Marcadores tumorales</strong></label>
								<div class="span3 form-inline" style="padding-bottom:1.1em;">	
								   <label for="marcaTuFecha">Fecha</label>
									<input type="text" class="span5" alt="dateP"  placeholder="dd/MM/yyyy" id="marcaTuFecha" >
								</div>
								<div class="span2" style="padding-bottom:1.1em;">		
								<label for="ceaAument"><strong>CEA aumentado</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="ceaAument" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="ceaAument" id="opcion2" value="1">
										No
									</label>																																
								</div>
							<div class="span2" style="padding-bottom:1.1em;">		
								<label for="caAument"><strong>CA 19-9 aumentado</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="caAument" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="caAument" id="opcion2" value="1">
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
									<input type="text" class="input-small" id="tnmValT" >
								 <label for="esfinterRectal">N</label>
									<input type="text" class="input-small" id="tnmValN" >
							     <label for="esfinterRectal">M</label>
									<input type="text" class="input-small" id="tnmValM"  >
								</div>
								</div>
							<div class="span5">
					           <label for=""><strong>pTNM</strong></label>
								<div class="span12 form-inline" style="padding-bottom:1.1em;">	
								  <label for="esfinterRectal">pT</label>
									<input type="text" class="input-small" id="ptnmValT" >
								 <label for="esfinterRectal">pN</label>
									<input type="text" class="input-small" id="ptnmValN" >
							     <label for="esfinterRectal">pM</label>
									<input type="text" class="input-small" id="ptnmValM" >
								</div>
							</div>
						</div>
				 	 <br>
					  	<div class="row-fluid">
							<div class="span11"> 
							  <label for=""><strong>Metástasis a distancia</strong></label>
								<div class="span12 form-inline" style="padding-bottom:1.1em;">	
									<label class="radio inline">
									<input type="checkbox" name="metastaDist1" id="metastaDist1" value="0" >
										Ninguna
									</label>
								    <label class="radio inline">
									    <input type="checkbox" name="metastaDist2" id="metastaDist2" value="1">
										Hueso
									</label>
								    <label class="radio inline">
									    <input type="checkbox" name="metastaDist3" id="metastaDist3" value="1">
										Pulmón
									</label>
								    <label class="radio inline">
									    <input type="checkbox" name="metastaDist4" id="metastaDist4" value="1">
										Desc.
									</label>
								    <label class="radio inline">
									    <input type="checkbox" name="metastaDist5" id="metastaDist5" value="1">
										Piel y TCS
									</label>
								    <label class="radio inline">
									    <input type="checkbox" name="metastaDist6" id="metastaDist6" value="1">
										Cerebro
									</label>
								    <label class="radio inline">
									    <input type="checkbox" name="metastaDist7" id="metastaDist7" value="1">
										Ganglios Dist
									</label>
								    <label class="radio inline">
									    <input type="checkbox" name="metastaDist8" id="metastaDist8" value="1">
										Ovario
									</label>	
								    <label class="radio inline">
									    <input type="checkbox" name="metastaDist9" id="metastaDist9" value="1">
										Hígado
									</label>	
									 <label class="radio inline" style="margin-left:30px">Otras</label>
									    <input type="text" name="metastaDistOtras"  id="metastaDistOtras">
   								     </div>			  
							</div>
						</div>
					 <div class="row-fluid">
				     <div class="span12 ">
				     	<fieldset>
							<legend>Revisión RM en Correcto</legend>
						<div class="row-fluid">
							<div class="span2">	  	 
							  	<label for="revisionRMFecha">Fecha</label>
								 <input type="text" class="span8" alt="dateP"  placeholder="dd/MM/yyyy" id="revisionRMFecha">
							</div>	 
							<div class="span3">	  	 
								   	<label for="revisionRMDistan">Distancia a la porción superior del esfínter</label>
								 <input type="text" class="span8"  id="revisionRMDistan" >
							</div>	 
								<div class="span6 form-inline" style="padding-bottom:1.1em;">	
								   <label for="revisionRMMargen" style="margin-right:24px">Distancia al margen anal</label>
								    <label class="radio inline">
									    <input type="radio" name="revisionRMMargen" id="opcion1" value="0" >
										0-5cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="revisionRMMargen" id="opcion2" value="1">
										5-10 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="revisionRMMargen" id="opcion3" value="2">
										10-12 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="revisionRMMargen" id="opcion4" value="3">
										> 12 cm
									</label>	
					  			</div>	
					  		</div>		
					  		<div class="row-fluid">	
					  			<div class="span6">	  	 
					  			 <label  for="esfinterRectal">Altura</label>
					  				 <input type="text" class="input-small" id="revisionAlturaRM" >
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
									    <input type="radio" name="tRevision" id="opcion2" value="2">
										2
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tRevision" id="opcion2" value="3">
										3a
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tRevision" id="opcion2" value="4">
										3b
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tRevision" id="opcion2" value="5">
										3c
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tRevision" id="opcion2" value="6">
										3d 
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tRevision" id="opcion2" value="7">
										4a
									</label>	
								    <label class="radio inline">
									    <input type="radio" name="tRevision" id="opcion2" value="8">
										4b
									</label>	
									<label class="radio inline" style="margin-left:50px">
									    <input type="radio" name="tRevision2" id="opcion2" value="1">
										N0
									</label>
								   <label class="radio inline">
									    <input type="radio" name="tRevision2" id="opcion2" value="2">
										N1a
									</label>
									  <label class="radio inline">
									    <input type="radio" name="tRevision2" id="opcion2" value="3">
										N1b
									</label>
									 <label class="radio inline">
									    <input type="radio" name="tRevision2" id="opcion2" value="4">
										N2a
									</label>	
									 <label class="radio inline">
									    <input type="radio" name="tRevision2" id="opcion2" value="5">
										N2b
									</label>	
   								     </div>			  
							</div>	
						</div>	
						<br>
						<div class="row-fluid">
							<div class="span12">
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="revisionCRMPresente"><strong>CRM</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="revisionCRMPresente" id="opcion1" value="0" >
										Positivo
									</label>
								    <label class="radio inline">
									    <input type="radio" name="revisionCRMPresente" id="opcion2" value="1">
										Negativo
									</label>																																
								</div>	
							<div class="span7" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>EMVI</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="revisionemviPresente" id="opcion1" value="0" >
										Positivo
									</label>
								    <label class="radio inline">
									    <input type="radio" name="revisionemviPresente" id="opcion2" value="1">
										Negativo
									</label>		
									 <label class="radio inline" style="margin-left:50px">
									    <input type="radio" name="revisionemviPresente" id="opcion2" value="2">
										0
									</label>
								   <label class="radio inline">
									    <input type="radio" name="revisionemviPresente" id="opcion2" value="3">
										1
									</label>
									  <label class="radio inline">
									    <input type="radio" name="revisionemviPresente" id="opcion2" value="4">
										2
									</label>
									 <label class="radio inline">
									    <input type="radio" name="revisionemviPresente" id="opcion2" value="5">
										3
									</label>	
									 <label class="radio inline">
									    <input type="radio" name="revisionemviPresente" id="opcion2" value="6">
										4
									</label>																																			
								</div>	
						  </div> 
						 </div> 	
						 <div class="row-fluid">
						 	<div class="span7" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>Estadificación tumores de recto inferior</strong></label>		
								   <label class="radio inline">
									    <input type="radio" name="revisionEstaTu" id="opcion2" value="0">
										1
									</label>
									  <label class="radio inline">
									    <input type="radio" name="revisionEstaTu" id="opcion2" value="1">
										2
									</label>
									 <label class="radio inline">
									    <input type="radio" name="revisionEstaTu" id="opcion2" value="2">
										3
									</label>	
									 <label class="radio inline">
									    <input type="radio" name="revisionEstaTu" id="opcion2" value="3">
										4
									</label>																																			
								</div>	
							</div>	
						<div class="row-fluid">
							<div class="span12">
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="revisioninguinales"><strong>Ganglios Inguinales</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="revisioninguinales" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="revisioninguinales" id="opcion2" value="1">
										No
									</label>																															
								</div>	
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="revisiongaLate"><strong>Ganglios Laterales</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="revisiongaLate" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="revisiongaLate" id="opcion2" value="1">
										No
									</label>																															
								</div>	
					            <div class="span4" style="padding-bottom:1.1em;">	
								<label for="revisionesfinter"><strong>Infiltra Esfinter</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="revisionesfinter" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="revisionesfinter" id="opcion2" value="1">
										No
									</label>																															
								</div>	
						  </div> 	
						 </div> 			
					 </fieldset>
					 </div>
					 </div>
	 			 <div class="row-fluid">	 
					<div class="pull-right">			
		               <button type="button" onclick="jQuery('#addEstadificacionForm').submit();" class="btn btn-primary">Guardar</button>
		               <button type="button" onclick="cleanScreenAdd();" class="btn" >Resetear</button>	
					</div>
		      </div>	
		</form>			 																						
		</div>
	<div class="tab-pane" id="anPatologica">
		<form id="addAnatomiaPatalogiaForm" action="" method="post">	
			<div class="row-fluid">
			<div class="span3">
				    <label><strong>Nº Biopsia</strong></label>
					<input type="text" name="esfinter" id="nroBiopsia" >
					<label><strong>AP Sugestiva de IMS</strong></label>
			        <label class="radio inline">
						 <input type="radio" name="sugesIMS" id="opcion1" value="0" >
								Si
					</label>
					<label class="radio inline">
						   <input type="radio" name="sugesIMS" id="opcion2" value="1">
								No
				    </label>
			</div>
			<div class="span3">
					<label for="fechaBiopsia"><strong>Fecha</strong></label>
					<input type="text" class="span5" alt="dateP" id="fechaBiopsia" placeholder="dd/MM/yyyy" >
					   <label><strong>IHQ</strong></label>
			        <label class="radio inline">
						 <input type="radio" name="ihqBiopsiaRadio" id="opcion1" value="0" >
								Si
					</label>
					<label class="radio inline">
						   <input type="radio" name="ihqBiopsiaRadio" id="opcion2" value="1">
								No
				    </label>		
			</div>		
			<div class="span3">
					<label><strong>Diagnóstico Histológico</strong></label>
					<input type="text" name="diagHisto"  id="diagHisto">
					<label><strong>Expresión conservada</strong></label>
			        <label class="radio inline">
						 <input type="radio" name="expConservadaRadio" id="opcion1" value="0" >
								Si
					</label>
					<label class="radio inline">
						   <input type="radio" name="expConservadaRadio" id="opcion2" value="1">
								No
				    </label>		
				    <label><strong>Nota</strong></label>
					<input type="text" name="notaExpConservada" id="notaExpConservada" >
			</div>
			</div>
			<div class="row-fluid">	 
					<div class="span7">							 
							<label for="comentC"><strong>Diagnosticado en</strong></label>
								  <textarea name="diagnostiWhere" id="diagnostiWhere" rows="3" class="input-block-level"></textarea>
						</div>
			</div>
			<div class="row-fluid">	 
					<div class="span9">		
					<label><strong>Grado de diferenciación</strong></label>
			        <label class="radio inline">
						 <input type="radio" name="gradoDiferRadio" id="opcion1" value="0" >
								Diferenciado
					</label>
					<label class="radio inline">
						   <input type="radio" name="gradoDiferRadio" id="opcion2" value="1">
								Moderadamente diferenciado
				    </label>
				    <label class="radio inline">
						   <input type="radio" name="gradoDiferRadio" id="opcion2" value="2">
								Poco diferenciado
				    </label>
				    <label class="radio inline">
						   <input type="radio" name="gradoDiferRadio" id="opcion2" value="3">
								Indiferenciado
				    </label>
				    <label class="radio inline">
						   <input type="radio" name="gradoDiferRadio" id="opcion2" value="4">
								Anillo de sello
				    </label>	
				    <label class="radio inline">
						   <input type="radio" name="gradoDiferRadio" id="opcion2" value="5">
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
						 <input type="radio" name="cirugiaHayRadio" id="opcion1" value="0" >
								Si
					</label>
					<label class="radio inline">
						   <input type="radio" name="cirugiaHayRadio" id="opcion2" value="1">
								No
				    </label>	    
				    <label class="radio inline" onclick="jQuery('#otroBaseDiag').focus();">
						   <input type="radio" name="cirugiaHayRadio" id="opcion2" value="2" style="margin-top:9px">
								Otros:
							<input type="text" name="otroBaseDiag" id="otroBaseDiag" style="margin-bottom: 0px;">
				    </label>
					<label class="radio inline">
						   <input type="radio" name="cirugiaHayRadio" id="opcion2" value="3">
								RSC
				    </label>
					<label class="radio inline">
						   <input type="radio" name="cirugiaHayRadio" id="opcion2" value="4">
								VCC
				    </label>				    				    			    
				    </div>
			</div>		 
			   <div class="row-fluid">	 
					<div class="pull-right">			
		               <button type="button" onclick="jQuery('#addAnatomiaPatalogiaForm').submit();" class="btn btn-primary">Guardar</button>
		               <button type="button" onclick="cleanScreenAdd();" class="btn" >Resetear</button>	
					</div>
		      </div>
		</form>	 
		</div>	
		<div class="tab-pane" id="tratamiento">
		   <form id="addtratamientoForm" action="" method="post">	
			<div class="row-fluid">
				<fieldset>
			<legend>Tratamiento</legend>
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
				    <label class="radio inline" onclick="jQuery('#udaOndoOtro').focus();" >
						   <input type="radio" name="udaOndoRadio" id="opcion2" value="2" style="margin-top:9px">
								Otro:
							<input type="text" class="" name="udaOndoOtro" id="udaOndoOtro" style="margin-bottom: 0px;">
				    </label>
			</div>
			</div>
		    <br>	
			<div class="row-fluid">
				<div class="span10">	  	
				 <label><strong>Cirugía (ir a AP)</strong></label>
					<label class="radio inline">
						 <input type="radio" name="cirugiaTrataRadio" id="opcion1" value="0" >
								Si
					</label>
					<label class="radio inline">
						   <input type="radio" name="cirugiaTrataRadio" id="opcion2" value="1">
								No
				    </label>	    
			</div>
			</div>	
			<br>
				<div class="row-fluid">
				<div class="span10">	  	
				 <label><strong>Quimioterapia de inducción</strong></label>
					<label class="radio inline">
						 <input type="radio" name="quimioInduccion" id="opcion1" value="0" >
								XELOX
					</label>
					<label class="radio inline">
						   <input type="radio" name="quimioInduccion" id="opcion2" value="1">
								BFOL
				    </label>
					<label class="radio inline">
						   <input type="radio" name="quimioInduccion" id="opcion2" value="2">
								FOLFOX
				    </label>
					<label class="radio inline">
						   <input type="radio" name="quimioInduccion" id="opcion2" value="3">
								CAPECITABINA
				    </label>
				    <label class="radio inline" onclick="jQuery('#quimioInduccionOtro').focus();" >
						   <input type="radio" name="quimioInduccion" id="opcion2" value="4" style="margin-top:9px">
								Otro:
							<input type="text" class="" name="quimioInduccionOtro" id="quimioInduccionOtro" style="margin-bottom: 0px;">
				    </label>
				    <label class="radio inline">
								N Ciclos:
							<select class="input-mini" id="quimioInduccionCiclos">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							</select>
				    </label>			    				    				    				    	    
			</div>
			</div>	
			<br>
			<div class="row-fluid">
				<div class="span10">	  	
				 <label><strong>Quimioradioterapia</strong></label>
					<label class="radio inline">
						 <input type="radio" name="quimioradioInduRadio" id="opcion1" value="0" >
								Capecitabina
					</label>
				    <label class="radio inline"  onclick="jQuery('#quimioradioInduRadioOtro').focus();">
						   <input type="radio" name="quimioradioInduRadio" id="opcion2" value="1" style="margin-top:9px">
								Otro:
							<input type="text" class="" name="quimioradioInduRadioOtro" id="quimioradioInduRadioOtro" style="margin-bottom: 0px;">
				    </label>	    				    				    	    
				</div>
			</div>		
		<br>	
			<div class="row-fluid">
				<div class="span10">	  	
				 <label><strong>Quimioterapia de Intervalo precirugia</strong></label>
					<label class="radio inline">
						 <input type="radio" name="quimioIntervalRadio" id="opcion1" value="0" >
								Si
					</label>
					<label class="radio inline">
						 <input type="radio" name="quimioIntervalRadio" id="opcion1" value="1" >
								No
					</label>	
					<label class="radio inline">
						 <input type="radio" name="quimioIntervalRadio" id="opcion1" value="2" >
								Capecitabina
					</label>									
				    <label class="radio inline" onclick="jQuery('#quimioIntervalRadioOtro').focus();">
						   <input type="radio" name="quimioIntervalRadio" id="opcion2" value="3" style="margin-top:9px">
								Otro:
							<input type="text" class="" name="quimioIntervalRadioOtro" id="quimioIntervalRadioOtro" style="margin-bottom: 0px;">
				    </label>
				  	<label class="radio inline">
								N Ciclos:
							<select class="input-mini" id="quimioIntervalCiclos">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							</select>
				    </label>	  	    				    				    	    
				</div>
			</div>							
		</fieldset>
		</div>			
	 <div class="row-fluid">	 
					<div class="pull-right">			
		               <button type="button" onclick="jQuery('#addtratamientoForm').submit();" class="btn btn-primary">Guardar</button>
		               <button type="button" onclick="cleanScreenAdd();" class="btn" >Resetear</button>	
					</div>
		      </div>
		</form>
		</div>	
	<div class="tab-pane" id="traNeoAd">
		   <form id="addTratamientoNeoAdForm" action="" method="post">	
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
							<input type="text" class="" name="dosisTotalRadioTer" id="dosisTotalRadioTer" style="margin-bottom: 0px;">
				    </label>
				    <label class="radio inline">
					  Fecha inicio:
						<input type="text" class="span5" alt="dateP"  placeholder="dd/MM/yyyy" id="fechaInicioRadioTer" >
					</label>	 
					 <label class="radio inline">
					  Fecha final:
						<input type="text" class="span5" alt="dateP"  placeholder="dd/MM/yyyy" id="fechaFinRadioTer"  >
					</label>
					<label><strong>Suspendio</strong></label>
					<label class="radio inline">
						 <input type="radio" name="suspenRadioTerRadio" id="opcion1" value="0" >
								No
					</label>
					<label class="radio inline">
						   <input type="radio" name="suspenRadioTerRadio" id="opcion2" value="1">
								Si
				    </label>	
				    <div id="suspenDiv" style="display: none">
				     <label class="radio inline">
								Dias:
					<input type="text" class="input-mini" name="diasSuspenRadioTer" id="diasSuspenRadioTer" style="margin-bottom: 0px;">
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
						<input type="text" class="" name="quimioEsquema" id="quimioEsquema" style="margin-bottom: 0px;">
				    </label>
				    <label class="radio inline">
					  N ciclos:
							<select class="input-mini" id="quimioNroCiclos">
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
							</select>				
					</label>
				    <label class="radio inline">
					  Fecha inicio:
						<input type="text" class="span5" alt="dateP"  placeholder="dd/MM/yyyy" id="fechaInicioQuimio" >
					</label>	 						 
					 <label class="radio inline">
					  Fecha finalización:
						<input type="text" class="span5" alt="dateP"  placeholder="dd/MM/yyyy" id="fechaFinQuimio"  >
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
									<input type="text" class="span2" id="centroPostTrata" >
								   <label for="esfinterRectal">Fecha</label>
									<input type="text" class="span2" alt="dateP"   placeholder="dd/MM/yyyy" id="fechaPostTrata" >
									  <label for="esfinterRectal" style="margin-left:25px">Distancia a la porción superior del esfínter</label>
									<input type="text" class="span2" id="distanciaPostTrata"  >
								</div>	
								<div class="span10 form-inline" style="padding-bottom:1.1em;">	
								   <label for="esfinterRectal" style="margin-right:24px">Distancia al margen anal</label>
								    <label class="radio inline">
									    <input type="radio" name="distMargenPostTrataRadio" id="opcion1" value="0" >
										0-5cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="distMargenPostTrataRadio" id="opcion2" value="1">
										5-10 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="distMargenPostTrataRadio" id="opcion3" value="2">
										10-12 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="distMargenPostTrataRadio" id="opcion4" value="3">
										> 12 cm
									</label>	
								   <label  style="margin-left:25px" for="esfinterRectal">Altura</label>
									<input type="text" class="span2" name="alturaPostTrataRadio" id="alturaPostTrataRadio">	
								</div>	
	
					  		</div>			  	
					  </div> 
						<div class="row-fluid">
							<div class="span12">
								<div class="span10" style="padding-bottom:1.1em;">	
								<label for="rsc"><strong>T</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="tumorPostTrataRadio" id="opcion1" value="0" checked="checked">
										X
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tumorPostTrataRadio" id="opcion2" value="1">
										1
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tumorPostTrataRadio" id="opcion2" value="2">
										2
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tumorPostTrataRadio" id="opcion2" value="3">
										3a
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tumorPostTrataRadio" id="opcion2" value="4">
										3b
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tumorPostTrataRadio" id="opcion2" value="5">
										3c
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tumorPostTrataRadio" id="opcion2" value="6">
										3d
									</label>
								    <label class="radio inline">
									    <input type="radio" name=tumorPostTrataRadio id="opcion2" value="7">
										4a
									</label>	
								    <label class="radio inline">
									    <input type="radio" name="tumorPostTrataRadio" id="opcion2" value="8">
										4b
									</label>	
									 <label class="radio inline" style="margin-left:50px">
									    <input type="radio" name="tumorPostTrataNRadio" id="opcion2" value="0">
										N0
									</label>
								   <label class="radio inline">
									    <input type="radio" name="tumorPostTrataNRadio" id="opcion2" value="1">
										N1a
									</label>
									  <label class="radio inline">
									    <input type="radio" name="tumorPostTrataNRadio" id="opcion2" value="2">
										N1b
									</label>
									 <label class="radio inline">
									    <input type="radio" name="tumorPostTrataNRadio" id="opcion2" value="3">
										N2a
									</label>	
									 <label class="radio inline">
									    <input type="radio" name="tumorPostTrataNRadio" id="opcion2" value="4">
										N2b
									</label>																																		
								</div>	
					  </div> 					  
					</div>
							<div class="row-fluid">
							<div class="span12">
								<div class="span10" style="padding-bottom:1.1em;">	
								<label for="crmPostTrataRadio"><strong>CRM</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="crmPostTrataRadio" id="opcion1" value="0" >
										Positivo
									</label>
								    <label class="radio inline">
									    <input type="radio" name="crmPostTrataRadio" id="opcion2" value="1">
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
									    <input type="radio" name="emviPostTrataRadio" id="opcion1" value="0">
										Positivo
									</label>
								    <label class="radio inline">
									    <input type="radio" name="emviPostTrataRadio" id="opcion2" value="1">
										Negativo
									</label>		
									 <label class="radio inline" style="margin-left:50px">
									    <input type="radio" name="emviPostTrataRadio" id="opcion2" value="2">
										0
									</label>
								   <label class="radio inline">
									    <input type="radio" name="emviPostTrataRadio" id="opcion2" value="3">
										1
									</label>
									  <label class="radio inline">
									    <input type="radio" name="emviPostTrataRadio" id="opcion2" value="4">
										2
									</label>
									 <label class="radio inline">
									    <input type="radio" name="emviPostTrataRadio" id="opcion2" value="5">
										3
									</label>	
									 <label class="radio inline">
									    <input type="radio" name="emviPostTrataRadio" id="opcion2" value="6">
										4
									</label>																																			
								</div>	
						  </div> 					  
						</div>
						<br>
						<div class="row-fluid">
							<div class="span12">
								<div class="span2" style="padding-bottom:1.1em;">	
								<label for="depoSatiRadio"><strong>Depósitos satélites</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="depoSatiRadio" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="depoSatiRadio" id="opcion2" value="1">
										No
									</label>																															
								</div>	
								<div class="span4" style="padding-bottom:1.1em;">	
								<label for="estaRInteriorRadio"><strong>Estadificación tumores de recto inferior</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="estaRInteriorRadio" id="opcion1" value="0" >
										1
									</label>
								    <label class="radio inline">
									    <input type="radio" name="estaRInteriorRadio" id="opcion2" value="1">
										2
									</label>	
								    <label class="radio inline">
									    <input type="radio" name="estaRInteriorRadio" id="opcion2" value="2">
										3
									</label>
								    <label class="radio inline">
									    <input type="radio" name="estaRInteriorRadio" id="opcion2" value="3">
										4
									</label>																																																
								</div>	
								<div class="span5" style="padding-bottom:1.1em;">	
								<label for="gradoRegresionRadio"><strong>Grado de regresion</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="gradoRegresionRadio" id="opcion1" value="0" >
										5
									</label>
								    <label class="radio inline">
									    <input type="radio" name="gradoRegresionRadio" id="opcion2" value="1">
										4
									</label>	
								    <label class="radio inline">
									    <input type="radio" name="gradoRegresionRadio" id="opcion3" value="2">
										3
									</label>
								    <label class="radio inline">
									    <input type="radio" name="gradoRegresionRadio" id="opcion4" value="3">
										2
									</label>
									<label class="radio inline">
									    <input type="radio" name="gradoRegresionRadio" id="opcion5" value="4">
										1
									</label>																																																									
								</div>
						  </div> 					  
						</div>	
						<br>	
						<div class="row-fluid">
							<div class="span12">
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="inguinalesRadio"><strong>Ganglios Inguinales</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="inguinalesRadio" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="inguinalesRadio" id="opcion2" value="1">
										No
									</label>																															
								</div>	
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="gaLateRadio"><strong>Ganglios Laterales</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="gaLateRadio" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="gaLateRadio" id="opcion2" value="1">
										No
									</label>																															
								</div>	
					            <div class="span4" style="padding-bottom:1.1em;">	
								<label for="infiltraEsPostRadio"><strong>Infiltra Esfinter</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="infiltraEsPostRadio" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="infiltraEsPostRadio" id="opcion2" value="1">
										No
									</label>																															
								</div>	
						  </div> 					  
						</div>	
						<br> 	
					  	<div class="row-fluid">
							<div class="span11"> 
							  <label for="evaPostRadio"><strong>Evaluación de la respuesta</strong></label>
								<div class="span12 form-inline" style="padding-bottom:1.1em;">	
									<label class="radio inline">
									<input type="radio" name="evaPostRadio" id="opcion1" value="0">
										RC
									</label>
								    <label class="radio inline">
									    <input type="radio" name="evaPostRadio" id="opcion1" value="1">
										RP
									</label>
								    <label class="radio inline">
									    <input type="radio" name="evaPostRadio" id="opcion2" value="2">
										EE
									</label>
								    <label class="radio inline">
									    <input type="radio" name="evaPostRadio" id="opcion3" value="3">
										PE
									</label>
								    <label class="radio inline">
									    <input type="radio" name="evaPostRadio" id="opcion4" value="4">
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
								<label for="movilRectalRadio"><strong>Movil</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="movilRectalRadio" id="opcion1" value="0" checked="checked">
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="movilRectalRadio" id="opcion2" value="1">
										Si
									</label>
								</div>	
								<div class="span2" style="padding-bottom:1.1em;">	
								<label for="fijoRectalRadio"><strong>Fijo</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="fijoRectalRadio" id="opcion1" value="0" checked="checked">
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="fijoRectalRadio" id="opcion2" value="1">
										Si
									</label>
								</div>	
								<div class="span5" style="padding-bottom:1.1em;">	
								<label for="esfinterPostRectalRadio"><strong>Infiltra esfinter</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterPostRectalRadio" id="opcion1" value="0" checked="checked">
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterPostRectalRadio" id="opcion2" value="1">
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterPostRectalRadio" id="opcion3" value="2">
										Esfinter interno
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterPostRectalRadio" id="opcion4" value="3">
										Esfinter externo
									</label>
									<label class="radio inline">
									    <input type="radio" name="esfinterPostRectalRadio" id="opcion5" value="4">
										Poco móvil
									</label>					
								</div>	
					  		</div>			  	
					  	</div> 
						<div class="row-fluid">
							<div class="span12">
							  <label for="tipoComprobanteCaja"><strong>RSC</strong></label>
								<div class="span2" style="padding-bottom:1.1em;">	
								<label for="rscPostPresenteRadio"><strong>Presente</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="rscPostPresenteRadio" id="opcion1" value="0" checked="checked">
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscPostPresenteRadio" id="opcion2" value="1">
										Si
									</label>
								</div>	
								<div class="span8" style="padding-bottom:1.1em;display: none" id="divRSCPost">	
								<label for="rscesfinterRectalRadio"><strong>Medida</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="rscesfinterRectalRadio" id="opcion1" value="0" checked="checked">
										0-5cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscesfinterRectalRadio" id="opcion2" value="1">
										5-10 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscesfinterRectalRadio" id="opcion3" value="2">
										10-12 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rscesfinterRectalRadio" id="opcion4" value="3">
										> 12 cm
									</label>		
								<div class="form-inline" style="display: inline;margin-left:20px">			
									<label for="esfinterRectal">Altura</label>
										<input type="text" class="input-mini" id="alturaRSC">
									<label for="esfinterRectal">Fecha</label>
										<input type="text" class="span2" alt="dateP"  placeholder="dd/MM/yyyy" id="fechaRSC">
								</div>		
								</div>	
						  </div> 					  
						</div>
						<div class="row-fluid">
							<div class="span12">
							  <label for="tipoComprobanteCaja"><strong>VCC</strong></label>
								<div class="span2" style="padding-bottom:1.1em;">	
								<label for="vccPresentePostRadio"><strong>Presente</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="vccPresentePostRadio" id="opcion1" value="0" checked="checked">
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="vccPresentePostRadio" id="opcion2" value="1">
										Si
									</label>
								</div>	
									<div class="span4" style="padding-bottom:1.1em;display: none" id="divVCCPost">	
								<label for="tipoVCCRadio"><strong>Tipo</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="tipoVCCRadio" id="opcion1" value="0" checked="checked">
										Completa
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tipoVCCRadio" id="opcion2" value="1">
										Incompleta
									</label>
									<label class="radio inline">
									    <input type="radio" name="tipoVCCRadio" id="opcion2" value="2">
										T.infranqueable
									</label>
									</div>
								<div class="span8" style="padding-bottom:1.1em;display: none" id="divVCCPost1">	
								<label for="vccMedidaRadio"><strong>Medida</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="vccMedidaRadio" id="opcion1" value="0" checked="checked">
										0-5cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="vccMedidaRadio" id="opcion2" value="1">
										5-10 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="vccMedidaRadio" id="opcion3" value="2">
										10-12 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="vccMedidaRadio" id="opcion4" value="3">
										> 12 cm
									</label>		
								<div class="form-inline" style="display: inline;margin-left:20px">			
									<label for="esfinterRectal">Altura</label>
										<input type="text" class="input-mini" id="vccAlturaPost">
									<label for="esfinterRectal">Fecha</label>
										<input type="text" class="span2" alt="dateP"  placeholder="dd/MM/yyyy" id="vccFechaPost" >
								</div>		
								</div>	
					  </div> 					  
						</div>
						<div class="row-fluid">
							<div class="span12">
							  <label for="tipoComprobanteCaja"><strong>EE</strong></label>
								<div class="row-fluid">	
								<div class="span2" style="padding-bottom:1.1em;margin-left:2.5641%">	
								<label for="eePresenteRadio"><strong>Presente</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="eePresenteRadio" id="opcion1" value="0" checked="checked">
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="eePresenteRadio" id="opcion2" value="1">
										Si
									</label>
								</div>	
									<div class="span4" style="padding-bottom:1.1em;display: none" id="divEEPost">	
								<label for="eeTumorRadio"><strong>Tumor</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="eeTumorRadio" id="opcion1" value="0" checked="checked">
										1
									</label>
								    <label class="radio inline">
									    <input type="radio" name="eeTumorRadio" id="opcion2" value="1">
										2
									</label>
									<label class="radio inline">
									    <input type="radio" name="eeTumorRadio" id="opcion3" value="2">
										3
									</label>
									<label class="radio inline">
									    <input type="radio" name="eeTumorRadio" id="opcion4" value="3">
										4
									</label>
									<label class="radio inline">
									    <input type="radio" name="eeTumorNRadio" id="opcion4" value="0">
										N0
									</label>
										<label class="radio inline">
									    <input type="radio" name="eeTumorNRadio" id="opcion4" value="1">
										N1
									</label>
										<label class="radio inline">
									    <input type="radio" name="eeTumorNRadio" id="opcion4" value="2">
										N2
									</label>
									</div>
								</div>	
								<div class="row-fluid">	
								<div class="span2" style="padding-bottom:1.1em;display: none;margin-left:2.5641%" id="divEEPost1">	
								 <label for="eeesfinterRadio"><strong>Infiltra esfinter</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="eeesfinterRadio" id="opcion1" value="0" checked="checked">
										No
									</label>
								    <label class="radio inline">
									    <input type="radio" name="eeesfinterRadio" id="opcion2" value="1">
										Si
									</label>
								</div>
								<div class="span8" style="padding-bottom:1.1em;display: none" id="divEEesfinterPost">									
								<label for="esfinterMedidaRadio"><strong>Medida</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterMedidaRadio" id="opcion1" value="0" checked="checked">
										0-5cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterMedidaRadio" id="opcion2" value="1">
										5-10 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterMedidaRadio" id="opcion3" value="2">
										10-12 cm
									</label>
								    <label class="radio inline">
									    <input type="radio" name="esfinterMedidaRadio" id="opcion4" value="3">
										> 12 cm
									</label>		
									<div class="form-inline" style="display: inline;margin-left:20px">			
										<label for="eePostFecha">Fecha</label>
											<input type="text" class="span2" alt="dateP"  placeholder="dd/MM/yyyy" id="eePostFecha" >
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
								<label for="ciruNeoRadio"><strong>Presente</strong></label>
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
								<label for="prodCiruRadio"><strong>Procedimiento</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="prodCiruRadio" id="opcion1" value="0" checked="checked">
										RA
									</label>
								    <label class="radio inline">
									    <input type="radio" name="prodCiruRadio" id="opcion2" value="1">
										RAUB
									</label>
									</div>
								<div class="span7" style="padding-bottom:1.1em;display: none" id="ciruNeoDiv1">	
								<label for="milesCiliRadio"><strong>Miles cilíndrico:</strong></label>
								<label class="radio inline">
									    <input type="radio" name="milesCiliRadio" id="opcion1" value="0" >
										Si
								</label>
								<label class="radio inline">
									    <input type="radio" name="milesCiliRadio" id="opcion2" value="1">
										No
								</label>	
								<div class="form-inline" style="display: inline;margin-left:20px">			
									<label for="esfinterRectal">Otro</label>
										<input type="text" class="input-small" id="milesCiliOtro" >
								</div>
								</div>	
						  </div> 					  
						</div>
						<div class="row-fluid">
							<div class="span12">
									<label for="urgenciaRadio"><strong>Urgencia</strong></label>
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
											<input type="text" class="input-small" alt="dateP"  placeholder="dd/MM/yyyy" id="urgenciaFecha">
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
											<input type="text" class="span10" id="cirujaName" >
										</label>
										</div>	
										<div class="span6">
										<label for="waitSeeRadio"><strong>WAIT AND SEE</strong></label>
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
											<input type="text" class="input-small" alt="dateP"  placeholder="dd/MM/yyyy" id="fechaInicioConducta" >
									</div>	
									</div>
								 </div>	
							</div>			
						</div>						
					</fieldset>
				  </div>
			  </div>		
		   </div>
		   	<div class="row-fluid">	 
					<div class="pull-right">			
		               <button type="button" onclick="jQuery('#addTratamientoNeoAdForm').submit();" class="btn btn-primary">Guardar</button>
		               <button type="button" onclick="cleanScreenAdd();" class="btn" >Resetear</button>	
					</div>
		      </div>	
		 </form>  
	     </div>     			
		<div class="tab-pane" id="anaPato">
			<form id="addAnatomiaPostForm" action="" method="post">	
			<div class="row-fluid">
			<div class="span3">
				    <label><strong>Nº Biopsia</strong></label>
					<input type="text" name="esfinter" id="nroBiopsiaPost" >
			</div>
			<div class="span3">
					<label for="esfinterRectal"><strong>Fecha AP</strong></label>
					<input type="text" class="span5" alt="dateP"   placeholder="dd/MM/yyyy" id="fechaBiopsiaPost" >		
			</div>
			<div class="row-fluid">		
				<div class="span10">
						<label><strong>Diagnóstico Histológico</strong></label>
						<input type="text" name="diagBiopsiaPost" id="diagBiopsiaPost" class="span9" >
				</div>	
			</div>
			<br>	  			
			<div class="row-fluid">	 
					<div class="span9">		
					<label><strong>Grado de diferenciación</strong></label>
			        <label class="radio inline">
						 <input type="radio" name="gradoDiferPostRadio" id="opcion1" value="0" >
								Diferenciado
					</label>
					<label class="radio inline">
						   <input type="radio" name="gradoDiferPostRadio" id="opcion2" value="1">
								Moderadamente diferenciado
				    </label>
				    <label class="radio inline">
						   <input type="radio" name="gradoDiferPostRadio" id="opcion2" value="2">
								Poco diferenciado
				    </label>
				    <label class="radio inline">
						   <input type="radio" name="gradoDiferPostRadio" id="opcion2" value="3">
								Indiferenciado
				    </label>
				    <label class="radio inline">
						   <input type="radio" name="gradoDiferPostRadio" id="opcion2" value="4">
								No determinado
				    </label>					    			    		    
				    </div>
			</div>
			<br>	  
			<div class="row-fluid">	 
						<div class="span5">		
								<label for="esfinterRectal"><strong>Tumor</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="tumorAnatPostRadio" id="opcion1" value="0" checked="checked">
										1
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tumorAnatPostRadio" id="opcion2" value="1">
										2
									</label>
									<label class="radio inline">
									    <input type="radio" name="tumorAnatPostRadio" id="opcion3" value="2">
										3
									</label>
									<label class="radio inline">
									    <input type="radio" name="tumorAnatPostRadio" id="opcion4" value="3">
										4a
									</label>
									<label class="radio inline">
									    <input type="radio" name="tumorAnatPostRadio" id="opcion4" value="4">
										4b
									</label>									
									<label class="radio inline" style="margin-left: 30px ">
									    <input type="radio" name="tumorAnatPostNRadio" id="opcion4" value="0">
										N0
									</label>
										<label class="radio inline">
									    <input type="radio" name="tumorAnatPostNRadio" id="opcion4" value="1">
										N1
									</label>
										<label class="radio inline">
									    <input type="radio" name="tumorAnatPostNRadio" id="opcion4" value="2">
										N2
									</label>
					</div>	  
					<div class="span6" style="margin-top:16px">		
								    <label class="radio inline">
								    Ganglios resecados
									    <input type="text" id="gangliosResaPost" class="input-small" id="gangliosResaPost" >
									</label>
								    <label class="radio inline">
								    Ganglios positivos
									    <input type="text" id="gangliosPosiPost" class="input-small" id="gangliosPosiPost" >		
									</label>
					</div>	  
		</div>	
		<br>
					<div class="row-fluid">
							<div class="span12">
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="invaVascularRadio"><strong>Invasión Vascular</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="invaVascularRadio" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="invaVascularRadio" id="opcion2" value="1">
										No
									</label>																															
								</div>	
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="invaPeriRadio"><strong>Invasión Perineural</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="invaPeriRadio" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="invaPeriRadio" id="opcion2" value="1">
										No
									</label>																															
								</div>	
					            <div class="span4" style="padding-bottom:1.1em;">	
								<label for="linfaTicaRadio"><strong>Linfatica</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="linfaTicaRadio" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="linfaTicaRadio" id="opcion2" value="1">
										No
									</label>																															
								</div>	
						  </div> 					  
						</div>	
				<br>
					<div class="row-fluid">
							<div class="span12">
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="buddTomoralRadio"><strong>Budding Tumoral</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="buddTomoralRadio" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="buddTomoralRadio" id="opcion2" value="1">
										No
									</label>																															
								</div>	
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="pushBorderRadio"><strong>Pushing Border</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="pushBorderRadio" id="opcion1" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="pushBorderRadio" id="opcion2" value="1">
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
									    <input type="text" name="gradoRegresionDvorak" id="gradoRegresionDvorak" class="input-small" >		
									</label>
								    <label class="radio inline">
								    CAP
									    <input type="text" name="capVal" id="capVal" class="input-small" id="opcion2" >		
									</label>																															
								</div>	
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="rtaCompletaRadio"><strong>Rta completa patológica</strong></label>
								    <label class="radio inline">
									    <input type="radio" name="rtaCompletaRadio" id="rtaCompPato" value="0" >
										Si
									</label>
								    <label class="radio inline">
									    <input type="radio" name="rtaCompletaRadio" id="rtaCompPato" value="1">
										No
									</label>																															
								</div>	
						  </div> 					  
					</div>		
				<br>
					<div class="row-fluid">
							<div class="span12">
								<div class="span3" style="padding-bottom:1.1em;">	
								<label for="ihqRadio"><strong>IHQ</strong></label>
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
									    <input type="radio" name="tipoKrasRadio" id="opcion1" value="0" >
										WT
									</label>
								    <label class="radio inline">
									    <input type="radio" name="tipoKrasRadio" id="opcion2" value="1">
										M
									</label>
									</div>
								</div>																												
								</div>	
						  </div> 					                
					</div>													
		</div>
				   	<div class="row-fluid">	 
					<div class="pull-right">			
		               <button type="button" onclick="jQuery('#addAnatomiaPostForm').submit();" class="btn btn-primary">Guardar</button>
		               <button type="button" onclick="cleanScreenAdd();" class="btn" >Resetear</button>	
					</div>
		      </div>	
	</form>	
      </div><!--/row-->
      <div class="tab-pane" id="trataAdyu">
      	 <form id="addTrataAdyuForm" action="" method="post">	
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
									    <input type="radio" name="quimiotrataRadio" id="opcion1" value="0" >
										XELOX
									</label>
								    <label class="radio inline">
									    <input type="radio" name="quimiotrataRadio" id="opcion2" value="1">
										BFOL
									</label>
								    <label class="radio inline">
									    <input type="radio" name="quimiotrataRadio" id="opcion2" value="2">
										FOLFOX
									</label>
								    <label class="radio inline">
									    <input type="radio" name="quimiotrataRadio" id="opcion2" value="3">
										CAPECITABINA
									</label>
								    <label class="radio inline">
								    	Otro:
									    <input type="text" name="quimiotrataOtro" id="quimiotrataOtro">										
									</label>	
									<label class="radio inline">
												N Ciclos:
										<select class="input-mini" id="nroCiclosTrata">
											<option value="0">0</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
										</select>
				    				</label>																											
								</div>	
			       </div>	
			       <br>
					<div class="row-fluid">
								<div class="span12">		
									<label for="radioTeRadio"><strong>Radioterapia</strong></label>
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
											<input type="text" name="dosisTotalTrata" id="dosisTotalTrata" >
									</div>
									<div class="span2">
											<label for=""><strong>Fecha Inicio</strong></label>
											<input type="text" class="span7" alt="dateP"  placeholder="dd/MM/yyyy" id="dosisTRataFechaInicio" >		
									</div>
									<div class="span2">
											<label for=""><strong>Fecha Finalización</strong></label>
											<input type="text" class="span7" alt="dateP"  placeholder="dd/MM/yyyy"  id="dosisTRataFechaFin"  >		
									</div>	
									<div class="span2">
										<label for=""><strong>Suspendió</strong></label>					
								     	<label class="radio inline">
				    			 		<input type="radio" name="suspendioYesRadio" id="opcion1" value="0" >
											No
										</label>	
			 						   <label class="radio inline">
									    <input type="radio" name="suspendioYesRadio" id="opcion2" value="1">
										Si
										</label>
										<div id="suspendioYesRadioTeDiv" class="radio inline" style="padding-bottom:1.1em;display: none" >
										<label class="radio inline"><strong>Dias:</strong></label>
										<input type="text" class="span4 radio inline" id="suspenTrataDias" >
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
	     	   <div class="row-fluid">	 
					<div class="pull-right">			
		               <button type="button" onclick="jQuery('#addTrataAdyuForm').submit();" class="btn btn-primary">Guardar</button>
		               <button type="button" onclick="cleanScreenAdd();" class="btn" >Resetear</button>	
					</div>
		      </div>
	    </form> 
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
    <div id="dialogErrorOperation" class="" style="display: none"  title="Error al guardar" >
	<p style="margin:0px;"><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>Se ha producido un error al realizar la operacion! </p>
	</div> 
	<div id="dialogErrorPaciente" class="" style="display: none"  title="Error de agregar consulta" >
	<p style="margin:0px;"><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>Debe seleccionar un paciente primero! </p>
	</div> 
	<div id="dialogSuccessOperation"  style="display: none"  title="Guardar cliente" >
	<p style="margin:0px;"><span class="ui-icon ui-icon-circle-check" style="float: left; margin: 0 7px 20px 0;"></span>Operacion realizada exitosamente!</p>
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
var CONSULTA_ID = -1;
var PRECONSULTA_ID = -1;
var MOTIVO_ID = -1;
var ANTECEDENTES_ID = -1;
var EVACLINICA_ID = -1;
var EXAPROCTOLOGICO_ID = -1;
var ESTADIFICACION_ID = -1;
var ANATOMIAPATALOGIA_ID = -1;
var TRATAMIENTO_ID = -1;
var DESC_TRATAMIENTO_NEO_ID = -1;
var RESP_TRATAMIENTO_NEO_ID = -1;
var CONDUCTAPOSTNEO_ID = -1;
var ANATOMIAPOST_ID = -1;
var TRATAADYU_ID = -1;

jQuery(function() {
	$('#menuNav').find("li").removeClass("active");
	$('#menuItemConsulta').addClass("active");
	
	//var idConsiltalert("${ID_CONSULTA}");
	
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
        
    jQuery("#dialogLoading" ).dialog({
		autoOpen: false,
		width: 250,
		modal:true,
		buttons: {
		},
		resizable: false,
		draggable: false,
		close: function() {
		},
		open: function(){
			$(".ui-dialog-titlebar-close").remove();
		}
	});
    
	jQuery("#dialogLoading").dialog("open");
	
	jQuery.ajax({
	     url: '<c:url value="/loadConsultaId.json" />',
	     type: "GET",
	     dataType: "json",
	     contentType: "application/json",
	     data: {}, 
	     success: function(resp){       
	    	 jQuery("#dialogLoading").dialog("close");
	          if(resp!=-1){
	        	  CONSULTA_ID=resp;
	        	  $("#selectedPatientDiv").show();
	        	  loadPreconsulta(CONSULTA_ID);
	        	  loadMotivo(CONSULTA_ID);
	        	  loadAntecedentes(CONSULTA_ID);
	        	  loadEvaClinica(CONSULTA_ID);
	        	  loadExaProctoForm(CONSULTA_ID);
	        	  loadEstadificacion(CONSULTA_ID);
	        	  loadAnatomiaPatalogiaForm(CONSULTA_ID);
	        	  loadTratamientoForm(CONSULTA_ID);
	        	  loadTratamientoNeoAdForm(CONSULTA_ID);
	        	  loadRespuestaNeoadyuante(CONSULTA_ID);
	        	  loadConductaPostNeo(CONSULTA_ID);
	        	  loadAnatomiaPostForm(CONSULTA_ID);
	        	  loadTrataAdyuForm(CONSULTA_ID)
	          }
	          else{
	        	  jQuery("#dialogErrorPaciente").dialog("open");
	          }
	     }
	   });  		
	     
	
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
	
	$("input[name=rscPostPresenteRadio]").click(function(){
		if($(this).attr('id')=="opcion2"){
			$("#divRSCPost").show();
		}
		else{
			$("#divRSCPost").hide();
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

	$("input[name=vccPresentePostRadio]").click(function(){
		if($(this).attr('id')=="opcion2"){
			$("#divVCCPost,#divVCCPost1").show();
		}
		else{
			$("#divVCCPost,#divVCCPost1").hide();
		}
	});
	
	
	$("input[name=eePresenteRadio]").click(function(){
		if($(this).attr('id')=="opcion2"){
			$("#divEEPost,#divEEPost1").show();
		}
		else{
			$("#divEEPost,#divEEPost1,#divEEesfinterPost").hide();
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
	$("input[name=eeesfinterRadio]").click(function(){
		if($(this).attr('id')=="opcion2"){
			$("#divEEesfinterPost").show();
		}
		else{
			$("#divEEesfinterPost").hide();
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
	$("input[name=suspenRadioTerRadio]").click(function(){
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
	 

function loadPreconsulta(consultaId){
	jQuery("#dialogLoading").dialog("open");
	jQuery.ajax({
	     url: '<c:url value="/loadPreconsulta.json" />',
	     type: "GET",
	     dataType: "json",
	     contentType: "application/json",
	     data: {'idConsulta':consultaId}, 
	     success: function(preconsulta){   	    
	    	if(preconsulta!=null){
		 		jQuery("#pesoPre").val(preconsulta.peso);
				jQuery("#tallePre").val(preconsulta.talla);
				jQuery("#superPre").val(preconsulta.supcorporal);  		
		        jQuery("input[name=performanceRadio][value="+preconsulta.performanceStatus+"]").click().attr('checked', true);	        
		        jQuery("#comentPreconsulta").val(preconsulta.comentario);		
		        PRECONSULTA_ID = preconsulta.idpreconsulta;
	    	}
	        jQuery("#dialogLoading").dialog("close");	        
	     }
	   }); 
}
  
jQuery("#addPreconsultaForm").validate({
	focusInvalid:false,
    rules: {
//	    	nombreC:{required: true},
    },
    messages: {
//	    	nombreC: {required: "Campo obligatorio"},
    },
	submitHandler: function() { 	  	
		
		var peso = jQuery("#pesoPre").val();
		var talla = jQuery("#tallePre").val();
		var superficie = jQuery("#superPre").val();  		
        var performance = jQuery("input[name=performanceRadio]:checked").val();
        var comentario = jQuery("#comentPreconsulta").val();
	
		var preConsulta = {'idConsulta':CONSULTA_ID,'idpreconsulta':PRECONSULTA_ID, 'peso':peso,'talla':talla,'supcorporal':superficie,'performanceStatus':performance,'comentario':comentario};		  		 
		 
    jQuery.ajax({
         url: '<c:url value="/addNewPreconsulta.json" />',
         type: "POST",
         dataType: "json",
         contentType: "application/json",
         data: JSON.stringify( preConsulta ), 
         success: function(resp){                                       
        	 if(resp!=-1){ 
        		 jQuery("#dialogSuccessOperation").dialog("option","title","Agregar PreConsulta");
        		 jQuery("#dialogSuccessOperation").dialog("open");
     	 	}
     	 	else{
       		 jQuery("#dialogErrorOperation").dialog("open");
     	 	}           
         }
       });  		
	}
         
});  

function loadMotivo(consultaId){
	//jQuery("#dialogLoading").dialog("open");
	jQuery.ajax({
	     url: '<c:url value="/loadMotivo.json" />',
	     type: "GET",
	     dataType: "json",
	     contentType: "application/json",
	     data: {'idConsulta':consultaId}, 
	     success: function(motivo){   	    
	    	if(motivo!=null){
	    		jQuery("#motivoOtro").val(motivo.motivoOtro);
	    		jQuery("#dateStartMotivo").val(motivo.fechaInicio);  		
	      	    jQuery("#mesesMotivo").val(motivo.evoMeses);
	      	  	var motivos = motivo.motivo.split("-");//arranca en 1
	      	  	for(var i = 1; i < motivos.length; i++){
	      	  		$("#"+motivos[i]).attr("checked",true);
	      	  	}
	      	    	      	    
		        MOTIVO_ID = motivo.idmotivo;
	    	}
	       // jQuery("#dialogLoading").dialog("close");	        
	     }
	   }); 
}
  
  
jQuery("#addMotivoAntecedentesForm").validate({
	focusInvalid:false,
    rules: {
//	    	nombreC:{required: true},
    },
    messages: {
//	    	nombreC: {required: "Campo obligatorio"},
    },
	submitHandler: function() { 	  	
		var motivosX = "";
		
		if($("#motivo1").is(':checked')) {  
			motivosX =  motivosX+"-"+$("#motivo1").attr("id");
    } 
		if($("#motivo2").is(':checked')) {  
			motivosX =  motivosX+"-"+$("#motivo2").attr("id");
    } 
		if($("#motivo3").is(':checked')) {  
			motivosX =  motivosX+"-"+$("#motivo3").attr("id");
    } 
		if($("#motivo4").is(':checked')) {  
			motivosX =  motivosX+"-"+$("#motivo4").attr("id");
    } 
		if($("#motivo5").is(':checked')) {  
			motivosX =  motivosX+"-"+$("#motivo5").attr("id");
    } 
		if($("#motivo6").is(':checked')) {  
			motivosX =  motivosX+"-"+$("#motivo6").attr("id");
    } 
		if($("#motivo7").is(':checked')) {  
			motivosX =  motivosX+"-"+$("#motivo7").attr("id");
    } 
		if($("#motivo8").is(':checked')) {  
			motivosX =  motivosX+"-"+$("#motivo8").attr("id");
    } 
		  		
		var otroMotivo = jQuery("#motivoOtro").val();
		var fechaMotivo = jQuery("#dateStartMotivo").val();  		
  	    var mesesMotivo = jQuery("#mesesMotivo").val();
	
		var motivo = {'idConsulta':CONSULTA_ID,'idmotivo':MOTIVO_ID, 'motivo':motivosX,'motivoOtro':otroMotivo,'fechaInicio':fechaMotivo,'evoMeses':mesesMotivo};		  		 
		 
    jQuery.ajax({
         url: '<c:url value="/addNewMotivo.json" />',
         type: "POST",
         dataType: "json",
         contentType: "application/json",
         data: JSON.stringify( motivo ), 
         success: function(resp){                                       
        	 if(resp!=-1){ 
        		 jQuery("#dialogSuccessOperation").dialog("option","title","Agregar Motivo");
        		 jQuery("#dialogSuccessOperation").dialog("open");
        		 submitAntecedentes();
     	 	}
     	 	else{
       		 jQuery("#dialogErrorOperation").dialog("open");
     	 	}           
         }
       });  		
	}
         
});	


function loadAntecedentes(consultaId){
	//jQuery("#dialogLoading").dialog("open");
	jQuery.ajax({
	     url: '<c:url value="/loadAntecedentes.json" />',
	     type: "GET",
	     dataType: "json",
	     contentType: "application/json",
	     data: {'idConsulta':consultaId}, 
	     success: function(antecedentes){   	    
	    	if(antecedentes!=null){
	      	  	
	    		$("#apersonal1").prop("checked",antecedentes.personalTabaquismo);
	    		$("#apersonal2").prop("checked",antecedentes.personalCardio);
	    		$("#apersonal3").prop("checked",antecedentes.personalAlcohol);
	    		$("#apersonal4").prop("checked",antecedentes.personalDbt);
	    		$("#apersonal5").prop("checked",antecedentes.personalNinguno);
			    
	      	  	jQuery("#otroAPersonal").val(antecedentes.personalOtro);
			    
			    $("#apersonalPat1").prop("checked",antecedentes.patologicoNinguno);
	      	  	$("#apersonalPat2").prop("checked",antecedentes.patologicoColitis);
	      		$("#apersonalPat3").prop("checked",antecedentes.patologicoAdenoma);
	      		$("#apersonalPat4").prop("checked",antecedentes.patologicoCrohn);
	      		$("#apersonalPat5").prop("checked",antecedentes.patologicoHiv);
	      		if(antecedentes.patologicoNeoplasia){ 
	      			$("#neoplasia")[0].click();
	      		}
	      		
	      	    jQuery("#neoPlasiaText").val(antecedentes.neoplasia);
	      	    var familiarCancer = antecedentes.familiarCancer.split("-"); //arranca en 1
	      	  	for(var i = 1; i < familiarCancer.length; i++){
	      	  		var dataArray = familiarCancer[i].split("*");
	      	  		$("#"+dataArray[0]).attr("check",true)[0].click();
	      	  		if(dataArray.length == 2){
	      	  			$("#"+dataArray[0].replace("check","")).val(dataArray[1]);
	      	  		}
	      	  	}	      	    
	      	    jQuery("input[name=anteSindrome][value="+antecedentes.tipoCcrh+"]").attr("check",true)[0].click();
		        var antCcrhs = antecedentes.antecedentesCcrh.split("-"); //arranca en 1
		      	  	for(var i = 1; i < antCcrhs.length; i++){
		      		$("#"+antCcrhs[i].replace("-","")).attr("checked",true);		      	  		
		      	  	}
		       
		       ANTECEDENTES_ID = antecedentes.idantecedente;
	    	}
	       // jQuery("#dialogLoading").dialog("close");	        
	     }
	   }); 
}
  
  
function submitAntecedentes(){	
		var apersonal1 = false;
		var apersonal2 = false;
		var apersonal3 = false;
		var apersonal4 = false;
		var apersonal5 = false;
		if($("#apersonal1").is(':checked')) {  
			apersonal1 =  true;
		}
		if($("#apersonal2").is(':checked')) {  
			apersonal2 =  true;
		}
		if($("#apersonal3").is(':checked')) {  
			apersonal3 =  true;
		}		
		if($("#apersonal4").is(':checked')) {  
			apersonal4 =  true;
		}
		if($("#apersonal5").is(':checked')) {  
			apersonal5 =  true;
		}			
		var otroAPersonal = jQuery("#otroAPersonal").val();
		
		var apersonalPat1 = false;
		var apersonalPat2 = false;
		var apersonalPat3 = false;
		var apersonalPat4 = false;
		var apersonalPat5 = false;
		var neoplasia = false;
		
		if($("#apersonalPat1").is(':checked')) {  
			apersonalPat1 =  true;
		}
		if($("#apersonalPat2").is(':checked')) {  
			apersonalPat2 =  true;
		}
		if($("#apersonalPat3").is(':checked')) {  
			apersonalPat3 =  true;
		}
		if($("#apersonalPat4").is(':checked')) {  
			apersonalPat4 =  true;
		}
		if($("#apersonalPat5").is(':checked')) {  
			apersonalPat5 =  true;
		}
		if($("#neoplasia").is(':checked')) {  
			neoplasia =  true;
		}				
		var neoPlasiaText = jQuery("#neoPlasiaText").val();
		
		var famCancer = "";
		
		if($("#checkfamMenorNin").is(':checked')) {  
			famCancer =  famCancer+"-"+$("#checkfamMenorNin").attr("id");
		}
		if($("#checkfamMenor60").is(':checked')) {  
			famCancer =  famCancer+"-"+$("#checkfamMenor60").attr("id");
			var famMenor60Nro = jQuery("#famMenor60").val();	
			famCancer =  famCancer+"*"+famMenor60Nro;
		}
		if($("#checkfamMayor60").is(':checked')) {  
			famCancer =  famCancer+"-"+$("#checkfamMayor60").attr("id");
			var famMayor60Nro = jQuery("#famMayor60").val();
			famCancer =  famCancer+"*"+famMayor60Nro;
		}
		if($("#checkfamSegundoGrado").is(':checked')) {  
			famCancer =  famCancer+"-"+$("#checkfamSegundoGrado").attr("id");
			var famSegundoGradoNro = jQuery("#famSegundoGrado").val();
			famCancer =  famCancer+"*"+famSegundoGradoNro;
		}
	  	
		var anteSindrome = jQuery("input[name=anteSindrome]:checked").val();
		
		var siSindrome = "";
		
		if(jQuery("#divCCRHSI").css('display') !== 'none'){
			if($("#checkPAF").is(':checked')) {  
				siSindrome =  siSindrome+"-"+$("#checkPAF").attr("id");
			}
			if($("#checkLYNCH").is(':checked')) {  
				siSindrome =  siSindrome+"-"+$("#checkLYNCH").attr("id");
			}
			if($("#checkMYH").is(':checked')) {  
				siSindrome =  siSindrome+"-"+$("#checkMYH").attr("id");
			}
		}
		
		var antecedentes = {'idConsulta':CONSULTA_ID, 'idantecedente':ANTECEDENTES_ID,
			'personalTabaquismo': apersonal1,
		    'personalCardio': apersonal2,
		    'personalAlcohol':apersonal3,
		    'personalDbt':apersonal4,
		    'personalNinguno': apersonal5,
		    'personalOtro': otroAPersonal,
		    'patologicoNinguno': apersonalPat1,
		    'patologicoColitis': apersonalPat2,
		    'patologicoAdenoma': apersonalPat3,
		    'patologicoCrohn': apersonalPat4,
		    'patologicoHiv': apersonalPat5,			
		    'patologicoNeoplasia': neoplasia,
			'neoplasia':neoPlasiaText,
			'familiarCancer':famCancer, 'tipoCcrh':anteSindrome,'antecedentesCcrh':siSindrome};		  		 
		 
    jQuery.ajax({
         url: '<c:url value="/addNewAntecedente.json" />',
         type: "POST",
         dataType: "json",
         contentType: "application/json",
         data: JSON.stringify( antecedentes ), 
         success: function(resp){                                       
        	 if(resp!=-1){ 
        		 jQuery("#dialogSuccessOperation").dialog("option","title","Agregar Antecedentes");
        		 jQuery("#dialogSuccessOperation").dialog("open");
     	 	}
     	 	else{
       		 jQuery("#dialogErrorOperation").dialog("open");
     	 	}           
         }
       });  		
};
         

function loadEvaClinica(consultaId){
	//jQuery("#dialogLoading").dialog("open");
	jQuery.ajax({
	     url: '<c:url value="/loadEvaClinica.json" />',
	     type: "GET",
	     dataType: "json",
	     contentType: "application/json",
	     data: {'idConsulta':consultaId}, 
	     success: function(evaClinica){   	    
	    	if(evaClinica != null){
	      	    var abdomenCheck = evaClinica.abdomen.split("-"); //arranca en 1
	      	  	for(var i = 1; i < abdomenCheck.length; i++){
	      	  		$("#"+abdomenCheck[i]).attr("check",true)[0].click();
	      	  	}
	     	    var colonCheck = evaClinica.colon.split("-"); //arranca en 1
	      	  	for(var i = 1; i < colonCheck.length; i++){
	      	  		$("#"+colonCheck[i]).attr("check",true)[0].click();
	      	  	}
	     	    var rectoCheck = evaClinica.recto.split("-"); //arranca en 1
	      	  	for(var i = 1; i < rectoCheck.length; i++){
	      	  		$("#"+rectoCheck[i]).attr("check",true)[0].click();
	      	  	}
	      		var adenopatiasCheck = evaClinica.adenopatias.split("-"); //arranca en 1
	      	  	for(var i = 1; i < adenopatiasCheck.length; i++){
	      	  		$("#"+adenopatiasCheck[i]).attr("check",true)[0].click();
	      	  	}  
	      	    jQuery("#notasEvaCli").val(evaClinica.notas);
    
	  	        EVACLINICA_ID = evaClinica.idevaclinica;
	    	}
	       // jQuery("#dialogLoading").dialog("close");	        
	     }
	   }); 
};



jQuery("#addEvaClinicaForm").validate({
	focusInvalid:false,
    rules: {
//	    	nombreC:{required: true},
    },
    messages: {
//	    	nombreC: {required: "Campo obligatorio"},
    },
	submitHandler: function() { 	
		
		var evaAbdomen = "";
		
		if($("#haAbdomen1").is(':checked')) {  
			evaAbdomen =  evaAbdomen+"-"+$("#haAbdomen1").attr("id");
		}
		if($("#haAbdomen2").is(':checked')) {  
			evaAbdomen =  evaAbdomen+"-"+$("#haAbdomen2").attr("id");
		}
		if($("#haAbdomen3").is(':checked')) {  
			evaAbdomen =  evaAbdomen+"-"+$("#haAbdomen3").attr("id");
		}		
		if($("#haAbdomen4").is(':checked')) {  
			evaAbdomen =  evaAbdomen+"-"+$("#haAbdomen4").attr("id");
		}
		if($("#haAbdomen5").is(':checked')) {  
			evaAbdomen =  evaAbdomen+"-"+$("#haAbdomen5").attr("id");
		}
				
		var evaColon = "";
		
		if($("#haColon1").is(':checked')) {  
			evaColon =  evaColon+"-"+$("#haColon1").attr("id");
		}
		if($("#haColon2").is(':checked')) {  
			evaColon =  evaColon+"-"+$("#haColon2").attr("id");
		}
		if($("#haColon3").is(':checked')) {  
			evaColon =  evaColon+"-"+$("#haColon3").attr("id");
		}
		if($("#haColon4").is(':checked')) {  
			evaColon =  evaColon+"-"+$("#haColon4").attr("id");
		}
		if($("#haColon5").is(':checked')) {  
			evaColon =  evaColon+"-"+$("#haColon5").attr("id");
		}
		if($("#haColon6").is(':checked')) {  
			evaColon =  evaColon+"-"+$("#haColon6").attr("id");
		}		

		var evaRecto = "";

		if($("#haRecto1").is(':checked')) {  
			evaRecto =  evaRecto+"-"+$("#haRecto1").attr("id");
		}	
		if($("#haRecto2").is(':checked')) {  
			evaRecto =  evaRecto+"-"+$("#haRecto2").attr("id");
		}	
		if($("#haRecto3").is(':checked')) {  
			evaRecto =  evaRecto+"-"+$("#haRecto3").attr("id");
		}	
		
		var evaAdenopatia = "";

		if($("#haAdenopatia1").is(':checked')) {  
			evaAdenopatia =  evaAdenopatia+"-"+$("#haAdenopatia1").attr("id");
		}	
		if($("#haAdenopatia2").is(':checked')) {  
			evaAdenopatia =  evaAdenopatia+"-"+$("#haAdenopatia2").attr("id");
		}	
		if($("#haAdenopatia3").is(':checked')) {  
			evaAdenopatia =  evaAdenopatia+"-"+$("#haAdenopatia3").attr("id");
		}	
		if($("#haAdenopatia4").is(':checked')) {  
			evaAdenopatia =  evaAdenopatia+"-"+$("#haAdenopatia4").attr("id");
		}	

		var notasEvaCli = jQuery("#notasEvaCli").val(); 
		
		var evaClinica = {'idConsulta':CONSULTA_ID,'idevaclinica':EVACLINICA_ID, 'abdomen':evaAbdomen,'colon':evaColon,'recto':evaRecto,'adenopatias':evaAdenopatia,'notas':notasEvaCli};		  		 
		 
    jQuery.ajax({
         url: '<c:url value="/addNewEvaClinica.json" />',
         type: "POST",
         dataType: "json",
         contentType: "application/json",
         data: JSON.stringify( evaClinica ), 
         success: function(resp){                                       
        	 if(resp!=-1){ 
        		 jQuery("#dialogSuccessOperation").dialog("option","title","Agregar Evaluación Clinica");
        		 jQuery("#dialogSuccessOperation").dialog("open");
     	 	}
     	 	else{
       		 jQuery("#dialogErrorOperation").dialog("open");
     	 	}           
         }
       });  		
	}
         
});  


function loadExaProctoForm(consultaId){
	//jQuery("#dialogLoading").dialog("open");
	jQuery.ajax({
	     url: '<c:url value="/loadExaProctologico.json" />',
	     type: "GET",
	     dataType: "json",
	     contentType: "application/json",
	     data: {'idConsulta':consultaId}, 
	     success: function(exaProctologico){   	    
	    	if(exaProctologico!=null){
	      	  	var tactoRectalRadio = exaProctologico.tactoRectal.split("//");

	      	  	jQuery("input[name=movilRectal][value="+tactoRectalRadio[0]+"]").click().attr('checked', true);	
	      	    jQuery("input[name=fijoRectal][value="+tactoRectalRadio[1]+"]").click().attr('checked', true);
	      	    jQuery("input[name=esfinterRectal][value="+exaProctologico.tactoRectalInfiltra+"]").click().attr('checked', true);
	      	    
	      	    var rscRadio = exaProctologico.rsc.split("//");
	      	    jQuery("input[name=rscPresente][value="+rscRadio[0]+"]").click().attr('checked', true);
	      	  	jQuery("input[name=rscMedida][value="+rscRadio[1]+"]").attr('checked', true);
	  			jQuery("#rscAltura").val(exaProctologico.rscAltura);
	  			jQuery("#rscFecha").val(exaProctologico.rscFecha);
	  		
	  			var vccRadio = exaProctologico.vcc.split("//");
		      	jQuery("input[name=vccPresente][value="+vccRadio[0]+"]").click().attr('checked', true);
		      	jQuery("input[name=vccTipo][value="+vccRadio[1]+"]").attr('checked', true);
		      	jQuery("input[name=vccMedida][value="+vccRadio[2]+"]").attr('checked', true);
		  		jQuery("#vccAltura").val(exaProctologico.vccAltura);
		  		jQuery("#vccFecha").val(exaProctologico.vccFecha);
		  		
		      	jQuery("input[name=eePresente][value="+exaProctologico.ee+"]").click().attr('checked', true);
		      	jQuery("input[name=eeTipo][value="+exaProctologico.eeTipo+"]").attr('checked', true);
		      	jQuery("input[name=eeTipoN][value="+exaProctologico.eeTipoN+"]").attr('checked', true);
		      	
		      	jQuery("input[name=eeesfinter][value="+ exaProctologico.eeInfiltra+"]").click().attr('checked', true);
		      	jQuery("input[name=eeMedida][value="+ exaProctologico.eeInfiltraMedida+"]").attr('checked', true);
		  		jQuery("#eeFecha").val(exaProctologico.eeFecha);
		       
		       EXAPROCTOLOGICO_ID = exaProctologico.idexaprocto;
	    	}
	       // jQuery("#dialogLoading").dialog("close");	        
	     }
	   }); 
};

jQuery("#addExaProctoForm").validate({
	focusInvalid:false,
    rules: {
//	    	nombreC:{required: true},
    },
    messages: {
//	    	nombreC: {required: "Campo obligatorio"},
    },
	submitHandler: function() { 	
		
		
		var movilRectal = jQuery("input[name=movilRectal]:checked").val();
		var fijoRectal = jQuery("input[name=fijoRectal]:checked").val();
		var esfinterRectal = jQuery("input[name=esfinterRectal]:checked").val();
		
		var rscPresente = jQuery("input[name=rscPresente]:checked").val();
		var rscMedida = jQuery("input[name=rscMedida]:checked").val();
		var rscAltura = jQuery("#rscAltura").val();
		var rscFecha = jQuery("#rscFecha").val();

		var vccPresente = jQuery("input[name=vccPresente]:checked").val();
		var vccTipo = jQuery("input[name=vccTipo]:checked").val();
		var vccMedida = jQuery("input[name=vccMedida]:checked").val();
		var vccAltura = jQuery("#vccAltura").val();
		var vccFecha = jQuery("#vccFecha").val();
		
		var eePresente = jQuery("input[name=eePresente]:checked").val();
		var eeTipo = jQuery("input[name=eeTipo]:checked").val();
		var eeTipoN = jQuery("input[name=eeTipoN]:checked").val();
		var eeesfinter = jQuery("input[name=eeesfinter]:checked").val();
		var eeMedida = jQuery("input[name=eeMedida]:checked").val();
		var eeFecha = jQuery("#eeFecha").val();
		
		var exaProcto = {'idConsulta':CONSULTA_ID, 'idexaprocto':EXAPROCTOLOGICO_ID, 'tactoRectal':movilRectal+"//"+fijoRectal,'tactoRectalInfiltra':esfinterRectal,'rsc':rscPresente+"//"+rscMedida,'rscAltura':rscAltura,'rscFecha':rscFecha,
						 'vcc':vccPresente+"//"+vccTipo+"//"+vccMedida,'vccAltura':vccAltura,'vccFecha':vccFecha,
						 'ee':eePresente, 'eeTipo':eeTipo, 'eeTipoN':eeTipoN,
						 'eeInfiltra':eeesfinter, 'eeInfiltraMedida':eeMedida,'eeFecha':eeFecha};		  		 
		 
    jQuery.ajax({
         url: '<c:url value="/addNewExaProcto.json" />',
         type: "POST",
         dataType: "json",
         contentType: "application/json",
         data: JSON.stringify( exaProcto ), 
         success: function(resp){                                       
        	 if(resp!=-1){ 
        		 jQuery("#dialogSuccessOperation").dialog("option","title","Agregar Examen proctológico");
        		 jQuery("#dialogSuccessOperation").dialog("open");
     	 	}
     	 	else{
       		 jQuery("#dialogErrorOperation").dialog("open");
     	 	}           
         }
       });  		
	}
         
});  


function loadEstadificacion(consultaId){
	//jQuery("#dialogLoading").dialog("open");
	jQuery.ajax({
	     url: '<c:url value="/loadEstadificacion.json" />',
	     type: "GET",
	     dataType: "json",
	     contentType: "application/json",
	     data: {'idConsulta':consultaId}, 
	     success: function(estadificacion){   	    
	    	if(estadificacion != null){
	    		
	    		jQuery("#centroRM").val(estadificacion.rmCentro);
	    		jQuery("#fechaRM").val(estadificacion.rmFecha);
	    		jQuery("#distanciaSupRM").val(estadificacion.rmDistEsfinter);
	    		jQuery("input[name=distanciaMarARadio][value="+estadificacion.rmDistAnal+"]").click().attr('checked', true);
	    		jQuery("#alturaRM").val(estadificacion.rmAltura);
	    		
	    		jQuery("input[name=numTRadio][value="+estadificacion.rmTumor+"]").click().attr('checked', true);
	    		jQuery("input[name=numTNRadio][value="+estadificacion.rmTumorN+"]").click().attr('checked', true);
	    		
	    		jQuery("input[name=crmPresente][value="+estadificacion.crm+"]").click().attr('checked', true);
	    		jQuery("input[name=emviPresente][value="+estadificacion.emvi+"]").click().attr('checked', true);
	    		
	    		jQuery("input[name=depoSati][value="+estadificacion.depSatelites+"]").click().attr('checked', true);
	    		jQuery("input[name=estaRInterior][value="+estadificacion.tumoRectoInferior+"]").click().attr('checked', true);
	    		
	    		jQuery("input[name=inguinales][value="+estadificacion.ganglios+"]").click().attr('checked', true);
	    		jQuery("input[name=gaLate][value="+estadificacion.gangliosLate+"]").click().attr('checked', true);
	    		jQuery("input[name=esfinterRM][value="+estadificacion.infiltraEsfinter+"]").click().attr('checked', true);
	
	    		jQuery("input[name=tcTorax][value="+estadificacion.tcTorax+"]").click().attr('checked', true);
	    		jQuery("input[name=tcAbdomen][value="+estadificacion.tcAbd+"]").click().attr('checked', true);
	    		jQuery("input[name=petTC][value="+estadificacion.petCt+"]").click().attr('checked', true);
	    		jQuery("input[name=mtsRadio][value="+estadificacion.mts+"]").click().attr('checked', true);
				jQuery("#suvEstati").val(estadificacion.suv);
	    		
				jQuery("#marcaTuFecha").val(estadificacion.marTumFecha);
				jQuery("input[name=ceaAument][value="+estadificacion.ceaAumentado+"]").click().attr('checked', true);
				jQuery("input[name=caAument][value="+estadificacion.ca19+"]").click().attr('checked', true);
				
				jQuery("#tnmValT").val(estadificacion.tnmT);
				jQuery("#tnmValN").val(estadificacion.tnmN);
				jQuery("#tnmValM").val(estadificacion.tnmM);
				jQuery("#ptnmValT").val(estadificacion.tnmPt);
				jQuery("#ptnmValN").val(estadificacion.tnmPn);
				jQuery("#ptnmValM").val(estadificacion.tnmPm);
				
			    var metastasisCheck = estadificacion.metastasis.split("-"); //arranca en 1
	      	  	for(var i = 1; i < metastasisCheck.length; i++){
	      	  		$("#"+metastasisCheck[i]).attr("check",true)[0].click();
	      	  	}
	      	    jQuery("#metastaDistOtras").val(estadificacion.metastasisOtra);
	      	  
			    jQuery("#revisionRMFecha").val(estadificacion.revRmFecha);
			    jQuery("#revisionRMDistan").val(estadificacion.revDistanEsfinter); 
			    jQuery("input[name=revisionRMMargen][value="+estadificacion.revDistanAnal+"]").click().attr('checked', true);
			    
			    jQuery("#revisionAlturaRM").val(estadificacion.revAltura);
			    
			    var revTumorRadio = estadificacion.revTumor.split("//");
			    jQuery("input[name=tRevision][value="+revTumorRadio[0]+"]").click().attr('checked', true);
			    jQuery("input[name=tRevision2][value="+revTumorRadio[1]+"]").click().attr('checked', true);
			    
			    jQuery("input[name=revisionCRMPresente][value="+estadificacion.revCrm+"]").click().attr('checked', true);
			    jQuery("input[name=revisionemviPresente][value="+estadificacion.revEmvi+"]").click().attr('checked', true);
			    jQuery("input[name=revisionEstaTu][value="+estadificacion.revEstadifTumores+"]").click().attr('checked', true);
			    jQuery("input[name=revisioninguinales][value="+estadificacion.revGanIngui+"]").click().attr('checked', true);
			    jQuery("input[name=revisiongaLate][value="+estadificacion.revGanLateral+"]").click().attr('checked', true);
			    jQuery("input[name=revisionesfinter][value="+estadificacion.revInfiltraEsf+"]").click().attr('checked', true);
			    
		  		ESTADIFICACION_ID = estadificacion.idestadificacion;
	    	}
	       // jQuery("#dialogLoading").dialog("close");	        
	     }
	   }); 
}


jQuery("#addEstadificacionForm").validate({
	focusInvalid:false,
    rules: {
//	    	nombreC:{required: true},
    },
    messages: {
//	    	nombreC: {required: "Campo obligatorio"},
    },
	submitHandler: function() { 	
		
		var centroRM = jQuery("#centroRM").val();
		var fechaRM = jQuery("#fechaRM").val();
		var distanciaSupRM = jQuery("#distanciaSupRM").val();
		var distanciaMarARadio = jQuery("input[name=distanciaMarARadio]:checked").val();
		var alturaRM = jQuery("#alturaRM").val();
		var numTRadio = jQuery("input[name=numTRadio]:checked").val();
		var numTNRadio = jQuery("input[name=numTNRadio]:checked").val();
		var crmPresente = jQuery("input[name=crmPresente]:checked").val();
		var emviPresente = jQuery("input[name=emviPresente]:checked").val();
		var depoSati = jQuery("input[name=depoSati]:checked").val();
		var estaRInterior = jQuery("input[name=estaRInterior]:checked").val();
		var inguinales = jQuery("input[name=inguinales]:checked").val();
		var gaLate = jQuery("input[name=gaLate]:checked").val();
		var esfinterRM = jQuery("input[name=esfinterRM]:checked").val();
		var tcTorax = jQuery("input[name=tcTorax]:checked").val();
		var tcAbdomen = jQuery("input[name=tcAbdomen]:checked").val();
		var petTC = jQuery("input[name=petTC]:checked").val();
		var mtsRadio = jQuery("input[name=mtsRadio]:checked").val();
		var suvEstati = jQuery("#suvEstati").val();
		var marcaTuFecha = jQuery("#marcaTuFecha").val();
		var ceaAument = jQuery("input[name=ceaAument]:checked").val();
		var caAument = jQuery("input[name=caAument]:checked").val();
		var tnmValT = jQuery("#tnmValT").val();
		var tnmValN = jQuery("#tnmValN").val();
		var tnmValM = jQuery("#tnmValM").val();
		var ptnmValT = jQuery("#ptnmValT").val();
		var ptnmValN = jQuery("#ptnmValN").val();
		var ptnmValM = jQuery("#ptnmValM").val();
		
		var metastasis = "";

		if($("#metastaDist1").is(':checked')) {  
			metastasis =  metastasis+"-"+$("#metastaDist1").attr("id");
		}	
		if($("#metastaDist2").is(':checked')) {  
			metastasis =  metastasis+"-"+$("#metastaDist2").attr("id");
		}
		if($("#metastaDist3").is(':checked')) {  
			metastasis =  metastasis+"-"+$("#metastaDist3").attr("id");
		}
		if($("#metastaDist4").is(':checked')) {  
			metastasis =  metastasis+"-"+$("#metastaDist4").attr("id");
		}
		if($("#metastaDist5").is(':checked')) {  
			metastasis =  metastasis+"-"+$("#metastaDist5").attr("id");
		}
		if($("#metastaDist6").is(':checked')) {  
			metastasis =  metastasis+"-"+$("#metastaDist6").attr("id");
		}
		if($("#metastaDist7").is(':checked')) {  
			metastasis =  metastasis+"-"+$("#metastaDist7").attr("id");
		}
		if($("#metastaDist8").is(':checked')) {  
			metastasis =  metastasis+"-"+$("#metastaDist8").attr("id");
		}
		if($("#metastaDist9").is(':checked')) {  
			metastasis =  metastasis+"-"+$("#metastaDist9").attr("id");
		}		
		var metastaDistOtras = jQuery("#metastaDistOtras").val();
		
		var revisionRMFecha = jQuery("#revisionRMFecha").val();
		var revisionRMDistan = jQuery("#revisionRMDistan").val();
		var revisionRMMargen = jQuery("input[name=revisionRMMargen]:checked").val();
		var revisionAlturaRM = jQuery("#revisionAlturaRM").val();
		var tRevision = jQuery("input[name=tRevision]:checked").val();
		var tRevision2 = jQuery("input[name=tRevision2]:checked").val();
		var revisionCRMPresente = jQuery("input[name=revisionCRMPresente]:checked").val();
		var revisionemviPresente = jQuery("input[name=revisionemviPresente]:checked").val();
		var revisionEstaTu = jQuery("input[name=revisionEstaTu]:checked").val();
		var revisioninguinales = jQuery("input[name=revisioninguinales]:checked").val();
		var revisiongaLate = jQuery("input[name=revisiongaLate]:checked").val();
		var revisionesfinter = jQuery("input[name=revisionesfinter]:checked").val();
		
		var estadificacion = {'idConsulta':CONSULTA_ID,'idestadificacion':ESTADIFICACION_ID, 'rmCentro':centroRM,'rmFecha':fechaRM,'rmDistEsfinter':distanciaSupRM,'rmDistAnal':distanciaMarARadio,'rmAltura':alturaRM,
						 	  'rmTumor':numTRadio, 'rmTumorN':numTNRadio,'crm':crmPresente,'emvi':emviPresente,'depSatelites':depoSati,'tumoRectoInferior':estaRInterior,'ganglios':inguinales,
						 	 'gangliosLate':gaLate, 'infiltraEsfinter':esfinterRM,'tcTorax':tcTorax,'tcAbd':tcAbdomen,'petCt':petTC,'mts':mtsRadio,'suv':suvEstati,
						 	  'marTumFecha':marcaTuFecha,'ceaAumentado':ceaAument,'ca19':caAument,'tnmT':tnmValT,'tnmN':tnmValN,'tnmM':tnmValM,
						 	  'tnmPt':ptnmValT,'tnmPn':ptnmValN,'tnmPm':ptnmValM,'metastasis':metastasis,'metastasisOtra':metastaDistOtras, 'revRmFecha':revisionRMFecha,'revDistanEsfinter':revisionRMDistan,
						 	 'revDistanAnal':revisionRMMargen,'revAltura':revisionAlturaRM,'revTumor':tRevision+"//"+tRevision2,'revCrm':revisionCRMPresente,'revEmvi':revisionemviPresente,
						 	 'revEstadifTumores':revisionEstaTu,'revGanIngui':revisioninguinales,'revGanLateral':revisiongaLate,'revInfiltraEsf':revisionesfinter};		  		 
		 
    jQuery.ajax({
         url: '<c:url value="/addNewEstadificacion.json" />',
         type: "POST",
         dataType: "json",
         contentType: "application/json",
         data: JSON.stringify( estadificacion ), 
         success: function(resp){                                       
        	 if(resp!=-1){ 
        		 jQuery("#dialogSuccessOperation").dialog("option","title","Agregar Estadificación");
        		 jQuery("#dialogSuccessOperation").dialog("open");
     	 	}
     	 	else{
       		 jQuery("#dialogErrorOperation").dialog("open");
     	 	}           
         }
       });  		
	}
         
});  


function loadAnatomiaPatalogiaForm(consultaId){
	//jQuery("#dialogLoading").dialog("open");
	jQuery.ajax({
	     url: '<c:url value="/loadAnaPatologica.json" />',
	     type: "GET",
	     dataType: "json",
	     contentType: "application/json",
	     data: {'idConsulta':consultaId}, 
	     success: function(anatomiaPatalogia){   	    
	    	if(anatomiaPatalogia!=null){
	    		
	    		jQuery("#nroBiopsia").val(anatomiaPatalogia.biopsia);
	    		jQuery("input[name=sugesIMS][value="+anatomiaPatalogia.apSugestiva+"]").click().attr('checked', true);	
	 			jQuery("#fechaBiopsia").val(anatomiaPatalogia.fechaDiag);
	 			jQuery("input[name=ihqBiopsiaRadio][value="+anatomiaPatalogia.ihq+"]").click().attr('checked', true);	
	    		jQuery("#diagHisto").val(anatomiaPatalogia.diagHistologico);
	    		
	    		var expresionConserv = anatomiaPatalogia.expresionConserv.split("//");
	    		jQuery("input[name=expConservadaRadio][value="+expresionConserv[0]+"]").click().attr('checked', true);
	    		jQuery("#notaExpConservada").val(expresionConserv[1]); 		
	    		jQuery("#diagnostiWhere").val(anatomiaPatalogia.diagnosticadoEn);
	    		
	    		jQuery("#diagnostiWhere").val(anatomiaPatalogia.diagnosticadoEn);
	    		jQuery("input[name=gradoDiferRadio][value="+anatomiaPatalogia.gradoDif+"]").click().attr('checked', true);
	    		jQuery("input[name=cirugiaHayRadio][value="+anatomiaPatalogia.baseDiagCirugia+"]").click().attr('checked', true);
	    		jQuery("#otroBaseDiag").val(anatomiaPatalogia.baseDiag);
	    		
		  		ANATOMIAPATALOGIA_ID = anatomiaPatalogia.idanotomia;
	    	}
	       // jQuery("#dialogLoading").dialog("close");	        
	     }
	   }); 
}


jQuery("#addAnatomiaPatalogiaForm").validate({
	focusInvalid:false,
    rules: {
//	    	nombreC:{required: true},
    },
    messages: {
//	    	nombreC: {required: "Campo obligatorio"},
    },
	submitHandler: function() { 	
		
		var nroBiopsia = jQuery("#nroBiopsia").val();
		var sugesIMS = jQuery("input[name=sugesIMS]:checked").val();
		var fechaBiopsia = jQuery("#fechaBiopsia").val();
		var ihqBiopsiaRadio = jQuery("input[name=ihqBiopsiaRadio]:checked").val();
		var diagHisto = jQuery("#diagHisto").val();
		var expConservadaRadio = jQuery("input[name=expConservadaRadio]:checked").val();
		var notaExpConservada = jQuery("#notaExpConservada").val();
		var diagnostiWhere = jQuery("#diagnostiWhere").val();
		var gradoDiferRadio = jQuery("input[name=gradoDiferRadio]:checked").val();
		var cirugiaHayRadio = jQuery("input[name=cirugiaHayRadio]:checked").val();
		var otroBaseDiag = jQuery("#otroBaseDiag").val();
				
		var anaPatologica = {'idConsulta':CONSULTA_ID,'idanotomia':ANATOMIAPATALOGIA_ID,'biopsia':nroBiopsia,'fechaDiag':fechaBiopsia,'diagHistologico':diagHisto,'apSugestiva':sugesIMS,'ihq':ihqBiopsiaRadio,
						 	  'expresionConserv':expConservadaRadio+"//"+notaExpConservada,'diagnosticadoEn':diagnostiWhere,'gradoDif':gradoDiferRadio,
						 	  'baseDiagCirugia':cirugiaHayRadio,'baseDiag':otroBaseDiag};		  		 
		 
    jQuery.ajax({
         url: '<c:url value="/addNewAnaPatologica.json" />',
         type: "POST",
         dataType: "json",
         contentType: "application/json",
         data: JSON.stringify( anaPatologica ), 
         success: function(resp){                                       
        	 if(resp!=-1){ 
        		 jQuery("#dialogSuccessOperation").dialog("option","title","Agregar Anatomia Patológica");
        		 jQuery("#dialogSuccessOperation").dialog("open");
     	 	}
     	 	else{
       		 jQuery("#dialogErrorOperation").dialog("open");
     	 	}           
         }
       });  		
	}    
});  

function loadTratamientoForm(consultaId){
	//jQuery("#dialogLoading").dialog("open");
	jQuery.ajax({
	     url: '<c:url value="/loadTratamiento.json" />',
	     type: "GET",
	     dataType: "json",
	     contentType: "application/json",
	     data: {'idConsulta':consultaId}, 
	     success: function(tratamiento){   	    
	    	if(tratamiento != null){
	    		
	    		var udaondoRadio = tratamiento.udaondo.split("//");
	    		jQuery("input[name=udaOndoRadio][value="+udaondoRadio[0]+"]").click().attr('checked', true);	
	    		jQuery("#udaOndoOtro").val(udaondoRadio[1]);
	    		
	    		jQuery("input[name=cirugiaTrataRadio][value="+tratamiento.cirugia+"]").click().attr('checked', true);	
	    		
	    		var quimioterapiaInducRadio = tratamiento.quimioterapiaInduc.split("//");
	    		jQuery("input[name=quimioInduccion][value="+quimioterapiaInducRadio[0]+"]").click().attr('checked', true);	
	    		jQuery("#quimioInduccionOtro").val(quimioterapiaInducRadio[1]);
 				jQuery("#quimioInduccionCiclos").val(tratamiento.quimioteInducNroCiclos);
 				
 				
 				
 				var quimioOtraInduRadio = tratamiento.quimioOtra.split("//");
	    		jQuery("input[name=quimioradioInduRadio][value="+quimioOtraInduRadio[0]+"]").click().attr('checked', true);	
	    		jQuery("#quimioradioInduRadioOtro").val(quimioOtraInduRadio[1]);
	    		
				var quimioterapiaInterRadio = tratamiento.quimioterapiaInter.split("//");
	    		jQuery("input[name=quimioIntervalRadio][value="+quimioterapiaInterRadio[0]+"]").click().attr('checked', true);	
	    		jQuery("#quimioIntervalRadioOtro").val(quimioterapiaInterRadio[1]);
				jQuery("#quimioIntervalCiclos").val(tratamiento.quimioteInterNroCiclos);	
	    				
	    		TRATAMIENTO_ID = tratamiento.idtratamiento;
	    	}
	       // jQuery("#dialogLoading").dialog("close");	        
	     }
	   }); 
};

jQuery("#addtratamientoForm").validate({
	focusInvalid:false,
    rules: {
//	    	nombreC:{required: true},
    },
    messages: {
//	    	nombreC: {required: "Campo obligatorio"},
    },
	submitHandler: function() { 	
		
		var udaOndoRadio = jQuery("input[name=udaOndoRadio]:checked").val();
		var udaOndoOtro = jQuery("#udaOndoOtro").val();
		
		var cirugiaTrataRadio = jQuery("input[name=cirugiaTrataRadio]:checked").val();
		var quimioInduccion = jQuery("input[name=quimioInduccion]:checked").val();
		var quimioInduccionOtro = jQuery("#quimioInduccionOtro").val();
		var quimioInduccionCiclos = jQuery("#quimioInduccionCiclos").val();
		var quimioradioInduRadio = jQuery("input[name=quimioradioInduRadio]:checked").val();
		var quimioradioInduRadioOtro = jQuery("#quimioradioInduRadioOtro").val();
		var quimioIntervalRadio = jQuery("input[name=quimioIntervalRadio]:checked").val();
		var quimioIntervalRadioOtro = jQuery("#quimioIntervalRadioOtro").val();
		var quimioIntervalCiclos = jQuery("#quimioIntervalCiclos").val();	
		
		
		var tratamiento = {'idConsulta':CONSULTA_ID,'idtratamiento':TRATAMIENTO_ID,'udaondo':udaOndoRadio+"//"+udaOndoOtro,'cirugia':cirugiaTrataRadio,'quimioterapiaInduc':quimioInduccion+"//"+quimioInduccionOtro,
							 'quimioteInducNroCiclos':quimioInduccionCiclos,'quimioOtra':quimioradioInduRadio+"//"+quimioradioInduRadioOtro, 
							 'quimioterapiaInter':quimioIntervalRadio+"//"+quimioIntervalRadioOtro,'quimioteInterNroCiclos':quimioIntervalCiclos};		  		 
		 
    jQuery.ajax({
         url: '<c:url value="/addTratamiento.json" />',
         type: "POST",
         dataType: "json",
         contentType: "application/json",
         data: JSON.stringify( tratamiento ), 
         success: function(resp){                                       
        	 if(resp!=-1){ 
        		 jQuery("#dialogSuccessOperation").dialog("option","title","Agregar Tratamiento");
        		 jQuery("#dialogSuccessOperation").dialog("open");
     	 	}
     	 	else{
       		 jQuery("#dialogErrorOperation").dialog("open");
     	 	}           
         }
       });  		
	}
         
});  

function loadTratamientoNeoAdForm(consultaId){
	//jQuery("#dialogLoading").dialog("open");
	jQuery.ajax({
	     url: '<c:url value="/loadDescTrataNeoadyuante.json" />',
	     type: "GET",
	     dataType: "json",
	     contentType: "application/json",
	     data: {'idConsulta':consultaId}, 
	     success: function(descTratamientoNeo){   	    
	    	if(descTratamientoNeo != null){
	    		
	    		
	    		jQuery("input[name=radioTera][value="+descTratamientoNeo.radioterapia+"]").click().attr('checked', true);
	    		jQuery("#dosisTotalRadioTer").val(descTratamientoNeo.radioDosis);
	    		jQuery("#fechaInicioRadioTer").val(descTratamientoNeo.radioFechaInicio);
	    		jQuery("#fechaFinRadioTer").val(descTratamientoNeo.radioFechaFinal);
	    		
	    		var radioSuspendio = descTratamientoNeo.radioSuspendio.split("//");	    		
	    		jQuery("input[name=suspenRadioTerRadio][value="+radioSuspendio[0]+"]").click().attr('checked', true);
	    		jQuery("#diasSuspenRadioTer").val(radioSuspendio[1]);
	    		
	    		var quimioEsquemaRadio = descTratamientoNeo.quimioEsquema.split("//");	   
	    		jQuery("input[name=quimioRadio][value="+quimioEsquemaRadio[0]+"]").click().attr('checked', true);
	    		jQuery("#quimioEsquema").val(quimioEsquemaRadio[1]);
	    		jQuery("#quimioNroCiclos").val(descTratamientoNeo.quimioNroCiclos);
	    		jQuery("#fechaInicioQuimio").val(descTratamientoNeo.quimioFechaInicio);
	    		jQuery("#fechaFinQuimio").val(descTratamientoNeo.quimioFechaFinal);
	    		
	    		jQuery("input[name=toxiRadio][value="+descTratamientoNeo.toxicidad+"]").click().attr('checked', true);
	    		jQuery("input[name=gradoIII][value="+descTratamientoNeo.toxGrado+"]").click().attr('checked', true);
	    		
	    		DESC_TRATAMIENTO_NEO_ID = descTratamientoNeo.iddesctrataneo;
	    	}
	       // jQuery("#dialogLoading").dialog("close");	        
	     }
	   }); 
};


jQuery("#addTratamientoNeoAdForm").validate({
	focusInvalid:false,
    rules: {
//	    	nombreC:{required: true},
    },
    messages: {
//	    	nombreC: {required: "Campo obligatorio"},
    },
	submitHandler: function() { 	
		
		var radioTera = jQuery("input[name=radioTera]:checked").val();
		var dosisTotalRadioTer = jQuery("#dosisTotalRadioTer").val();	
		var fechaInicioRadioTer = jQuery("#fechaInicioRadioTer").val();
		var fechaFinRadioTer = jQuery("#fechaFinRadioTer").val();
		var suspenRadioTerRadio = jQuery("input[name=suspenRadioTerRadio]:checked").val();
		var diasSuspenRadioTer = jQuery("#diasSuspenRadioTer").val();
		var quimioRadio = jQuery("input[name=quimioRadio]:checked").val();
		var quimioEsquema = jQuery("#quimioEsquema").val();
		var quimioNroCiclos = jQuery("#quimioNroCiclos").val();
		var fechaInicioQuimio = jQuery("#fechaInicioQuimio").val();
		var fechaFinQuimio = jQuery("#fechaFinQuimio").val();
		var toxiRadio = jQuery("input[name=toxiRadio]:checked").val();
		var gradoIII = jQuery("input[name=gradoIII]:checked").val();

		var descTrataNeoadyuante = {'idConsulta':CONSULTA_ID, 'iddesctrataneo':DESC_TRATAMIENTO_NEO_ID, 'radioterapia':radioTera,'radioDosis':dosisTotalRadioTer,'radioFechaInicio':fechaInicioRadioTer,
							 'radioFechaFinal':fechaFinRadioTer,'radioSuspendio':suspenRadioTerRadio+"//"+diasSuspenRadioTer, 
							 'quimioEsquema':quimioRadio+"//"+quimioEsquema,'quimioNroCiclos':quimioNroCiclos,'quimioNroCiclos':quimioNroCiclos,
							 'quimioFechaInicio':fechaInicioQuimio,'quimioFechaFinal':fechaFinQuimio,'toxicidad':toxiRadio,'toxGrado':gradoIII};		  		 
		 
    jQuery.ajax({
         url: '<c:url value="/addNewdescTrataNeoadyuante.json" />',
         type: "POST",
         dataType: "json",
         contentType: "application/json",
         data: JSON.stringify( descTrataNeoadyuante ), 
         success: function(resp){                                       
        	 if(resp!=-1){ 
        		 jQuery("#dialogSuccessOperation").dialog("option","title","Agregar Tratamiento Neoadyuante");
        		 jQuery("#dialogSuccessOperation").dialog("open");
        		 addRespuestaNeoadyuante();
     	 	}
     	 	else{
       		 jQuery("#dialogErrorOperation").dialog("open");
     	 	}           
         }
       });  		
	}
         
});  

function loadRespuestaNeoadyuante(consultaId){
	//jQuery("#dialogLoading").dialog("open");
	jQuery.ajax({
	     url: '<c:url value="/loadRespuestaNeoadyuante.json" />',
	     type: "GET",
	     dataType: "json",
	     contentType: "application/json",
	     data: {'idConsulta':consultaId}, 
	     success: function(respNeoadyuante){   	    
	    	if(respNeoadyuante != null){
	    		
	    		jQuery("#centroPostTrata").val(respNeoadyuante.rmCentro);	
	    		jQuery("#fechaPostTrata").val(respNeoadyuante.rmFecha);	    		
	    		jQuery("#distanciaPostTrata").val(respNeoadyuante.rmDistEsfinter);	    		
	    		jQuery("input[name=distMargenPostTrataRadio][value="+respNeoadyuante.rmDistAnal+"]").click().attr('checked', true);
	    		jQuery("#alturaPostTrataRadio").val(respNeoadyuante.rmAltura);
	    		
	    		var rmTumorRadio = respNeoadyuante.rmTumor.split("//");
	    		jQuery("input[name=tumorPostTrataRadio][value="+rmTumorRadio[0]+"]").click().attr('checked', true);
	    		jQuery("input[name=tumorPostTrataNRadio][value="+rmTumorRadio[1]+"]").click().attr('checked', true);
	    		
	    		jQuery("input[name=crmPostTrataRadio][value="+respNeoadyuante.crm+"]").click().attr('checked', true);
	    		jQuery("input[name=emviPostTrataRadio][value="+respNeoadyuante.emvi+"]").click().attr('checked', true);
	    		
	    		jQuery("input[name=depoSatiRadio][value="+respNeoadyuante.depSatelites+"]").click().attr('checked', true);	    		
	    		jQuery("input[name=estaRInteriorRadio][value="+respNeoadyuante.estadifTumor+"]").click().attr('checked', true);	    		
	    		jQuery("input[name=gradoRegresionRadio][value="+respNeoadyuante.gradoRegre+"]").click().attr('checked', true);
	    		
	    		jQuery("input[name=inguinalesRadio][value="+respNeoadyuante.gangliosImgui+"]").click().attr('checked', true);
	    		jQuery("input[name=gaLateRadio][value="+respNeoadyuante.gangliosLateral+"]").click().attr('checked', true);
	    		jQuery("input[name=infiltraEsPostRadio][value="+respNeoadyuante.infiltraEsf+"]").click().attr('checked', true);
	    		
	    		jQuery("input[name=evaPostRadio][value="+respNeoadyuante.evaRespuesta+"]").click().attr('checked', true);
	    		
	    		var tactoRectalRadio = respNeoadyuante.tactoRectal.split("//"); 
	    		jQuery("input[name=movilRectalRadio][value="+tactoRectalRadio[0]+"]").click().attr('checked', true);
	    		jQuery("input[name=fijoRectalRadio][value="+tactoRectalRadio[1]+"]").click().attr('checked', true);
	    		jQuery("input[name=esfinterPostRectalRadio][value="+respNeoadyuante.exaInfiltraEsf+"]").click().attr('checked', true);
	    		
	    		var rscRadio = respNeoadyuante.rsc.split("//"); 
	    		jQuery("input[name=rscPostPresenteRadio][value="+rscRadio[0]+"]").click().attr('checked', true);
	    		jQuery("input[name=rscesfinterRectalRadio][value="+rscRadio[1]+"]").click().attr('checked', true);
	    		jQuery("#alturaRSC").val(respNeoadyuante.rscAltura);
	    		jQuery("#fechaRSC").val(respNeoadyuante.rscFecha);
	    		
	    		var vccRadio = respNeoadyuante.vcc.split("//"); 
	    		jQuery("input[name=vccPresentePostRadio][value="+vccRadio[0]+"]").click().attr('checked', true);
	    		jQuery("input[name=tipoVCCRadio][value="+vccRadio[1]+"]").click().attr('checked', true);
	    		jQuery("input[name=vccMedidaRadio][value="+vccRadio[2]+"]").click().attr('checked', true);
	    		jQuery("#vccAlturaPost").val(respNeoadyuante.vccAltura);
	    		jQuery("#vccFechaPost").val(respNeoadyuante.vccFecha);
	    		
	    		var eeRadio = respNeoadyuante.ee.split("//"); 
	    		jQuery("input[name=eePresenteRadio][value="+eeRadio[0]+"]").click().attr('checked', true);
	    		jQuery("input[name=eeTumorRadio][value="+eeRadio[1]+"]").click().attr('checked', true);
	    		jQuery("input[name=eeTumorNRadio][value="+eeRadio[2]+"]").click().attr('checked', true);	    		    		
	    		
	    		var eeInfiltraEsfRadio = respNeoadyuante.eeInfiltraEsf.split("//"); 
	    		jQuery("input[name=eeesfinterRadio][value="+eeInfiltraEsfRadio[0]+"]").click().attr('checked', true);	    		
	    		jQuery("input[name=esfinterMedidaRadio][value="+eeInfiltraEsfRadio[1]+"]").click().attr('checked', true);
	    		jQuery("#eePostFecha").val(respNeoadyuante.eeFecha);
	    		
	    		
	    		RESP_TRATAMIENTO_NEO_ID = respNeoadyuante.idrespuestatrataneo;
	    	}
	       // jQuery("#dialogLoading").dialog("close");	        
	     }
	   }); 
};

function addRespuestaNeoadyuante() { 	
			
		var centroPostTrata = jQuery("#centroPostTrata").val();	
		var fechaPostTrata = jQuery("#fechaPostTrata").val();
		var distanciaPostTrata = jQuery("#distanciaPostTrata").val();
		var distMargenPostTrataRadio = jQuery("input[name=distMargenPostTrataRadio]:checked").val();
		var alturaPostTrataRadio = jQuery("#alturaPostTrataRadio").val();
		var tumorPostTrataRadio = jQuery("input[name=tumorPostTrataRadio]:checked").val();
		var tumorPostTrataNRadio = jQuery("input[name=tumorPostTrataNRadio]:checked").val();
		var crmPostTrataRadio = jQuery("input[name=crmPostTrataRadio]:checked").val();
		var emviPostTrataRadio = jQuery("input[name=emviPostTrataRadio]:checked").val();
		var depoSatiRadio = jQuery("input[name=depoSatiRadio]:checked").val();
		var estaRInteriorRadio = jQuery("input[name=estaRInteriorRadio]:checked").val();
		var gradoRegresionRadio = jQuery("input[name=gradoRegresionRadio]:checked").val();
		var inguinalesRadio = jQuery("input[name=inguinalesRadio]:checked").val();
		var gaLateRadio = jQuery("input[name=gaLateRadio]:checked").val();
		var infiltraEsPostRadio = jQuery("input[name=infiltraEsPostRadio]:checked").val();
		var evaPostRadio = jQuery("input[name=evaPostRadio]:checked").val();
		
		var movilRectalRadio = jQuery("input[name=movilRectalRadio]:checked").val();
		var fijoRectalRadio = jQuery("input[name=fijoRectalRadio]:checked").val();
		var esfinterPostRectalRadio = jQuery("input[name=esfinterPostRectalRadio]:checked").val();
		var rscPostPresenteRadio = jQuery("input[name=rscPostPresenteRadio]:checked").val();
		var rscesfinterRectalRadio = jQuery("input[name=rscesfinterRectalRadio]:checked").val();
		var alturaRSC = jQuery("#alturaRSC").val();
		var fechaRSC = jQuery("#fechaRSC").val();
		var vccPresentePostRadio = jQuery("input[name=vccPresentePostRadio]:checked").val();
		var tipoVCCRadio = jQuery("input[name=tipoVCCRadio]:checked").val();
		var vccMedidaRadio = jQuery("input[name=vccMedidaRadio]:checked").val();
		var vccAlturaPost = jQuery("#vccAlturaPost").val();
		var vccFechaPost = jQuery("#vccFechaPost").val();
		var eePresenteRadio = jQuery("input[name=eePresenteRadio]:checked").val();
		
		var eeTumorRadio = jQuery("input[name=eeTumorRadio]:checked").val();
		var eeTumorNRadio = jQuery("input[name=eeTumorNRadio]:checked").val();
		var eeesfinterRadio = jQuery("input[name=eeesfinterRadio]:checked").val();
		var esfinterMedidaRadio = jQuery("input[name=esfinterMedidaRadio]:checked").val();
		var eePostFecha = jQuery("#eePostFecha").val();	
		 
		var respuestaNeoadyuante = {'idConsulta':CONSULTA_ID,'idrespuestatrataneo':RESP_TRATAMIENTO_NEO_ID,'rmFecha':fechaPostTrata,'rmCentro':centroPostTrata,'rmDistEsfinter':distanciaPostTrata,
							 'rmDistAnal':distMargenPostTrataRadio,'rmAltura':alturaPostTrataRadio, "rmTumor":tumorPostTrataRadio+"//"+tumorPostTrataNRadio,
							 'crm':crmPostTrataRadio,'emvi':emviPostTrataRadio,'depSatelites':depoSatiRadio,
							 'gangliosImgui':inguinalesRadio,'gangliosLateral':gaLateRadio,'infiltraEsf':infiltraEsPostRadio,'estadifTumor':estaRInteriorRadio,
							 'gradoRegre':gradoRegresionRadio,'evaRespuesta':evaPostRadio,'tactoRectal':movilRectalRadio+"//"+fijoRectalRadio,'exaInfiltraEsf':esfinterPostRectalRadio,
							 'rsc':rscPostPresenteRadio+"//"+rscesfinterRectalRadio,'rscAltura':alturaRSC,'rscFecha':fechaRSC,'vcc':vccPresentePostRadio+"//"+tipoVCCRadio+"//"+vccMedidaRadio,
							 'vccAltura':vccAlturaPost,'vccFecha':vccFechaPost,'ee':eePresenteRadio+"//"+eeTumorRadio+"//"+eeTumorNRadio,'eeInfiltraEsf':eeesfinterRadio+"//"+esfinterMedidaRadio,
							 'eeFecha':eePostFecha};		  		 
		 
    jQuery.ajax({
         url: '<c:url value="/addNewRespuestaNeoadyuante.json" />',
         type: "POST",
         dataType: "json",
         contentType: "application/json",
         data: JSON.stringify( respuestaNeoadyuante ), 
         success: function(resp){                                       
        	 if(resp!=-1){ 
        		 jQuery("#dialogSuccessOperation").dialog("option","title","Agregar Respuesta NeoAdyuante");
        		 jQuery("#dialogSuccessOperation").dialog("open");
        		 addConductaPostNeo();
     	 	}
     	 	else{
       		 jQuery("#dialogErrorOperation").dialog("open");
     	 	}           
         }
       });  		
}
       

function loadConductaPostNeo(consultaId){
	//jQuery("#dialogLoading").dialog("open");
	jQuery.ajax({
	     url: '<c:url value="/loadConductaPostNeoadyuante.json" />',
	     type: "GET",
	     dataType: "json",
	     contentType: "application/json",
	     data: {'idConsulta':consultaId}, 
	     success: function(conductapostneo){   	    
	    	if(conductapostneo != null){
	    		
	    		var cirugiaRadio = conductapostneo.cirugia.split("//");
	    		jQuery("input[name=ciruNeoRadio][value="+cirugiaRadio[0]+"]").click().attr('checked', true);
	    		jQuery("input[name=prodCiruRadio][value="+cirugiaRadio[1]+"]").click().attr('checked', true);
	    		var milesCilindricoRadio = conductapostneo.milesCilindrico.split("//");
	    		jQuery("input[name=milesCiliRadio][value="+milesCilindricoRadio[0]+"]").click().attr('checked', true);
	    		jQuery("#milesCiliOtro").val(milesCilindricoRadio[1]);

	    		jQuery("input[name=urgenciaRadio][value="+conductapostneo.urgencia+"]").click().attr('checked', true);
	    		jQuery("#urgenciaFecha").val(conductapostneo.urgenciaFecha);
	    		
	    		jQuery("#cirujaName").val(conductapostneo.cirujano);
	    		jQuery("input[name=waitSeeRadio][value="+conductapostneo.waitAndSee+"]").click().attr('checked', true);
	    		jQuery("#fechaInicioConducta").val(conductapostneo.fechaInicio);	    	
	    		
	    		CONDUCTAPOSTNEO_ID = conductapostneo.idconductapostneo;
	    	}
	       // jQuery("#dialogLoading").dialog("close");	        
	     }
	   }); 
};


 function addConductaPostNeo() { 	
			
		var ciruNeoRadio = jQuery("input[name=ciruNeoRadio]:checked").val();
		var prodCiruRadio = jQuery("input[name=prodCiruRadio]:checked").val();
		var milesCiliRadio = jQuery("input[name=milesCiliRadio]:checked").val();
		var milesCiliOtro = jQuery("#milesCiliOtro").val();
		var urgenciaRadio = jQuery("input[name=urgenciaRadio]:checked").val();
		var urgenciaFecha = jQuery("#urgenciaFecha").val();
		var cirujaName = jQuery("#cirujaName").val();
		var waitSeeRadio = jQuery("input[name=waitSeeRadio]:checked").val();
		var fechaInicioConducta = jQuery("#fechaInicioConducta").val();
	
	

		var conductaPostNeo = {'idConsulta':CONSULTA_ID,'idconductapostneo':CONDUCTAPOSTNEO_ID,'cirugia':ciruNeoRadio+"//"+prodCiruRadio,'milesCilindrico':milesCiliRadio+"//"+milesCiliOtro,'urgencia':urgenciaRadio,
							 'urgenciaFecha':urgenciaFecha,'cirujano':cirujaName, "waitAndSee":waitSeeRadio,
							 'fechaInicio':fechaInicioConducta};		  		 
		 
    jQuery.ajax({
         url: '<c:url value="/addNewConductaPostNeo.json" />',
         type: "POST",
         dataType: "json",
         contentType: "application/json",
         data: JSON.stringify( conductaPostNeo ), 
         success: function(resp){                                       
        	 if(resp!=-1){ 
        		 jQuery("#dialogSuccessOperation").dialog("option","title","Agregar Anatomia Patológica");
        		 jQuery("#dialogSuccessOperation").dialog("open");
     	 	}
     	 	else{
       		 jQuery("#dialogErrorOperation").dialog("open");
     	 	}           
         }
       });  		
	}




 function loadAnatomiaPostForm(consultaId){
		//jQuery("#dialogLoading").dialog("open");
		jQuery.ajax({
		     url: '<c:url value="/loadAnaPatologicaPost.json" />',
		     type: "GET",
		     dataType: "json",
		     contentType: "application/json",
		     data: {'idConsulta':consultaId}, 
		     success: function(anatomiaPost){   	    
		    	if(anatomiaPost != null){
		    		
		    		jQuery("#nroBiopsiaPost").val(anatomiaPost.nroBiopsia);
		    		jQuery("#fechaBiopsiaPost").val(anatomiaPost.fechaAp);
		    		jQuery("#diagBiopsiaPost").val(anatomiaPost.diagHisto);		
		    		
		    		jQuery("input[name=gradoDiferPostRadio][value="+anatomiaPost.gradoDif+"]").click().attr('checked', true);
		    		var tumorRadio = anatomiaPost.tumor.split("//");
		    		jQuery("input[name=tumorAnatPostRadio][value="+tumorRadio[0]+"]").click().attr('checked', true);
		    		jQuery("input[name=tumorAnatPostNRadio][value="+tumorRadio[1]+"]").click().attr('checked', true);
		    		
		    		jQuery("#gangliosResaPost").val(anatomiaPost.ganResecados);	
		    		jQuery("#gangliosPosiPost").val(anatomiaPost.ganPositivos);	
	
		    		jQuery("input[name=invaVascularRadio][value="+anatomiaPost.invVascular+"]").click().attr('checked', true);
		    		jQuery("input[name=invaPeriRadio][value="+anatomiaPost.invPeri+"]").click().attr('checked', true);
		    		jQuery("input[name=linfaTicaRadio][value="+anatomiaPost.linfa+"]").click().attr('checked', true);
		    		jQuery("input[name=buddTomoralRadio][value="+anatomiaPost.buddingTumoral+"]").click().attr('checked', true);
		    		jQuery("input[name=pushBorderRadio][value="+anatomiaPost.pushingBorder+"]").click().attr('checked', true);
		    		
		 			jQuery("#gradoRegresionDvorak").val(anatomiaPost.gradoRegresion);
					jQuery("#capVal").val(anatomiaPost.cap);
					
					jQuery("input[name=rtaCompletaRadio][value="+anatomiaPost.rtaComPato+"]").click().attr('checked', true);
					jQuery("input[name=ihqRadio][value="+anatomiaPost.ihq+"]").click().attr('checked', true);
					var krasRadio = anatomiaPost.kras.split("//");
					jQuery("input[name=krasRadio][value="+krasRadio[0]+"]").click().attr('checked', true);
					jQuery("input[name=tipoKrasRadio][value="+krasRadio[1]+"]").click().attr('checked', true);
					
		    		
		    		ANATOMIAPOST_ID = anatomiaPost.idanatomiapatopost;
		    	}
		       // jQuery("#dialogLoading").dialog("close");	        
		     }
		   }); 
	};

jQuery("#addAnatomiaPostForm").validate({
	focusInvalid:false,
    rules: {
//	    	nombreC:{required: true},
    },
    messages: {
//	    	nombreC: {required: "Campo obligatorio"},
    },
	submitHandler: function() { 	
			
		var nroBiopsiaPost = jQuery("#nroBiopsiaPost").val();
		var fechaBiopsiaPost = jQuery("#fechaBiopsiaPost").val();
		var diagBiopsiaPost = jQuery("#diagBiopsiaPost").val();		
		var gradoDiferPostRadio = jQuery("input[name=gradoDiferPostRadio]:checked").val();
		var tumorAnatPostRadio = jQuery("input[name=tumorAnatPostRadio]:checked").val();
		var tumorAnatPostNRadio = jQuery("input[name=tumorAnatPostNRadio]:checked").val();
		var gangliosResaPost = jQuery("#gangliosResaPost").val();
		var gangliosPosiPost = jQuery("#gangliosPosiPost").val();
		var invaVascularRadio = jQuery("input[name=invaVascularRadio]:checked").val();
		var invaPeriRadio = jQuery("input[name=invaPeriRadio]:checked").val();
		var linfaTicaRadio = jQuery("input[name=linfaTicaRadio]:checked").val();
		var buddTomoralRadio = jQuery("input[name=buddTomoralRadio]:checked").val();
		var pushBorderRadio = jQuery("input[name=pushBorderRadio]:checked").val();
		var gradoRegresionDvorak = jQuery("#gradoRegresionDvorak").val();
		var capVal = jQuery("#capVal").val();
		var rtaCompletaRadio = jQuery("input[name=rtaCompletaRadio]:checked").val();
		var ihqRadio = jQuery("input[name=ihqRadio]:checked").val();
		var krasRadio = jQuery("input[name=krasRadio]:checked").val();
		var tipoKrasRadio = jQuery("input[name=tipoKrasRadio]:checked").val();
		
		var anaPatologica = {'idConsulta':CONSULTA_ID,'idanatomiapatopost':ANATOMIAPOST_ID,'nroBiopsia':nroBiopsiaPost,'fechaAp':fechaBiopsiaPost,'diagHisto':diagBiopsiaPost,
							 'gradoDif':gradoDiferPostRadio,'tumor':tumorAnatPostRadio+"//"+tumorAnatPostNRadio, "ganResecados":gangliosResaPost,'ganPositivos':gangliosPosiPost,
							 'invVascular':invaVascularRadio,'invPeri':invaPeriRadio,'linfa':linfaTicaRadio,'buddingTumoral':buddTomoralRadio,
							 'pushingBorder':pushBorderRadio,'gradoRegresion':gradoRegresionDvorak,'cap':capVal,'rtaComPato':rtaCompletaRadio,
							 'ihq':ihqRadio,'kras':krasRadio+"//"+tipoKrasRadio};		  		 
		 
    jQuery.ajax({
         url: '<c:url value="/addNewAnaPatoPost.json" />',
         type: "POST",
         dataType: "json",
         contentType: "application/json",
         data: JSON.stringify( anaPatologica ), 
         success: function(resp){                                       
        	 if(resp!=-1){ 
        		 jQuery("#dialogSuccessOperation").dialog("option","title","Agregar Anatomia Patológica");
        		 jQuery("#dialogSuccessOperation").dialog("open");
     	 	}
     	 	else{
       		 jQuery("#dialogErrorOperation").dialog("open");
     	 	}           
         }
       });  		
	}
         
});  


function loadTrataAdyuForm(consultaId){
	//jQuery("#dialogLoading").dialog("open");
	jQuery.ajax({
	     url: '<c:url value="/loadTrataAdyuvante.json" />',
	     type: "GET",
	     dataType: "json",
	     contentType: "application/json",
	     data: {'idConsulta':consultaId}, 
	     success: function(tratamientoAdyu){   	    
	    	if(tratamientoAdyu != null){	    		
	    		var quimioterapiaRadio = tratamientoAdyu.quimioterapia.split("//");	    		
	    		jQuery("input[name=trataAdyuYesRadio][value="+quimioterapiaRadio[0]+"]").click().attr('checked', true);
	    		jQuery("input[name=quimiotrataRadio][value="+quimioterapiaRadio[1]+"]").click().attr('checked', true);
 				jQuery("#quimiotrataOtro").val(quimioterapiaRadio[2]);
 	    		jQuery("#nroCiclosTrata").val(tratamientoAdyu.quimioNroCiclos); 	    		
 	    		
 	    		jQuery("input[name=radioTeRadio][value="+tratamientoAdyu.radioterapia+"]").click().attr('checked', true);
 	    		
 	    		jQuery("#dosisTotalTrata").val(tratamientoAdyu.radioDosis);
 	    		jQuery("#dosisTRataFechaInicio").val(tratamientoAdyu.radioFechaInicio);
 	    		jQuery("#dosisTRataFechaFin").val(tratamientoAdyu.radioFechaFinal);

 	    		var suspendioRadio = tratamientoAdyu.suspendio.split("//");	
   				jQuery("input[name=suspendioYesRadio][value="+suspendioRadio[0]+"]").click().attr('checked', true); 	    		
	    		jQuery("#suspenTrataDias").val(suspendioRadio[1]);
	    		jQuery("#comentCTrataAdyu").val(tratamientoAdyu.notas);
	    			    		
				TRATAADYU_ID = tratamientoAdyu.idtratamientoadyu;
	    	}
	       // jQuery("#dialogLoading").dialog("close");	        
	     }
	   }); 
};

jQuery("#addTrataAdyuForm").validate({
	focusInvalid:false,
    rules: {
//	    	nombreC:{required: true},
    },
    messages: {
//	    	nombreC: {required: "Campo obligatorio"},
    },
	submitHandler: function() { 	
			
		var trataAdyuYesRadio = jQuery("input[name=trataAdyuYesRadio]:checked").val();
		var quimiotrataRadio = jQuery("input[name=quimiotrataRadio]:checked").val();
		var quimiotrataOtro = jQuery("#quimiotrataOtro").val();
		var nroCiclosTrata = jQuery("#nroCiclosTrata").val();	
		var radioTeRadio = jQuery("input[name=radioTeRadio]:checked").val();

		var dosisTotalTrata = jQuery("#dosisTotalTrata").val();
		var dosisTRataFechaInicio = jQuery("#dosisTRataFechaInicio").val();
		var dosisTRataFechaFin = jQuery("#dosisTRataFechaFin").val();	
		var suspendioYesRadio = jQuery("input[name=suspendioYesRadio]:checked").val();
		var suspenTrataDias = jQuery("#suspenTrataDias").val();			
		if(suspendioYesRadio == 0){
			suspenTrataDias="";
		}
		var comentCTrataAdyu = jQuery("#comentCTrataAdyu").val();
		
		var tratamientoAdyu = {'idConsulta':CONSULTA_ID,'idtratamientoadyu':TRATAADYU_ID,'quimioterapia':trataAdyuYesRadio+"//"+quimiotrataRadio+"//"+quimiotrataOtro,'quimioNroCiclos':nroCiclosTrata,'radioterapia':radioTeRadio,
							 'radioDosis':dosisTotalTrata,'radioFechaInicio':dosisTRataFechaInicio, "radioFechaFinal":dosisTRataFechaFin,
							 'suspendio':suspendioYesRadio+"//"+suspenTrataDias,'notas':comentCTrataAdyu};		  		 
		 
    jQuery.ajax({
         url: '<c:url value="/addNewTrataAdyuvante.json" />',
         type: "POST",
         dataType: "json",
         contentType: "application/json",
         data: JSON.stringify( tratamientoAdyu ), 
         success: function(resp){                                       
        	 if(resp!=-1){ 
        		 jQuery("#dialogSuccessOperation").dialog("option","title","Agregar tratamiento Adyuvante");
        		 jQuery("#dialogSuccessOperation").dialog("open");
     	 	}
     	 	else{
       		 jQuery("#dialogErrorOperation").dialog("open");
     	 	}           
         }
       });  		
	}
         
});  

jQuery("#dialogErrorOperation").dialog({
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

	jQuery("#dialogErrorPaciente").dialog({
		autoOpen: false,
		height: 180,
		modal:true,
		buttons: {
			"Ok": function() {
				jQuery( this ).dialog( "close" );
	              window.location.href = "<%=request.getContextPath()%>/buscarPaciente.json";
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
	
   
});
//Other functions


</script> 

  </body>
</html>
