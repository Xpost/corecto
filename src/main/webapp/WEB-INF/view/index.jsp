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
    </style>
    
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="js/c3-0.4.9/c3.css" rel="stylesheet" type="text/css">
	<style type="text/css">
	.c3-ygrids line {
		opacity:0.7
	} 
	</style>
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->
    
             
  </head>

  <body>

		<jsp:include flush="true" page="menu.jsp">
				<jsp:param name="left" value="1" />
		</jsp:include>

    <div class="container">
        <div class="hero-unit" style="padding: 20px 60px 90px">
      		<sec:authorize ifNotGranted="ROLE_USER,ROLE_ADMIN">        
	            <h1>Logueo de usuario </h1>
	            <p>Se deberá loguear para poder acceder a las diferentes opciones del menú</p>
	            <div><a href="#" id="helpLoginButton" class="btn btn-primary btn-large">Ayuda &raquo;</a></div>
            </sec:authorize>
            <sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">          
	            	<h1>Bienvenido!</h1>
	            	<div class="span7 alert alert-success" style="margin-left: 0px">
	                <p style="margin-bottom: 0px">Se encuentra logueado con el usuario:
	                		 <sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
							 <strong><sec:authentication property="principal.username"/></strong>
							 </sec:authorize>.
					</p>		 
				    <p style="margin-bottom: 0px"> Si lo desea puede <span class="label label-info" style="font-size: 14px">Salir</span> y loguearse con otro usuario</p>
					</div>	        
	               	<c:url value="/logout" var="logoutUrl"/>	  
	             <div class="span2" style="margin-left: 0px">
	          	 <p><a class="btn btn-primary btn-large" href="${logoutUrl}" style="font-size: 20px;" >Salir <i style="margin-left:5px" class="icon-share"></i></a></p>
	          	 </div>                 
	         </sec:authorize>
          </div>
      <div class="row-fluid">
            <div class="span6 show-grid">
              <h2>Últimos pacientes agregados</h2>
					<div id="chart"></div>
					<p><a class="btn" href="#">Mas detalles &raquo;</a></p>
            </div><!--/span-->
            <div class="span6 show-grid">
              <h2 class="text-center">Tratamiento Udaondo</h2>
              <div id="chartPie" align="center"></div>
            </div><!--/span-->
          </div><!--/row-->

      <hr>

    </div><!--/.fluid-container-->
  <div id="footer">
      <div class="container">
        <p class="muted credit">Creada por <a href="#">[Matias Iseas]</a>.</p>
      </div>
    </div>
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="js/jquery-1.7.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src=js/d3/d3.min.js></script>
	<!-- decidir cual de los dos usar! -->	
	<script src="js/c3-0.4.9/c3.js"></script>



<script type="text/javascript">
jQuery(function() {

<sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
	jQuery("div[lang='loginDivData']").hide();
	jQuery("div[lang='alreadyLoggued']").show();
</sec:authorize>
<sec:authorize ifNotGranted="ROLE_USER">
jQuery("div[lang='alreadyLoggued']").hide();
jQuery("div[lang='loginDivData']").show();
jQuery("#j_username").focus();
</sec:authorize>

$('#helpLoginButton').popover({html:true,content:"Debe acceder con un <strong>usuario/password</strong> en la barra de menú de arriba"});

createC3Chart();
createPieChart();
});

function createC3Chart(){
	
var chart = c3.generate({
	    bindto: '#chart',
	    data: {
	    	   types: {
	    		   Pacientes: 'bar' // ADD
	   	      }, // the same as
			  //type: 'bar',
			  labels:  true, //{format: function (v, id, i, j) { return "$"+v; }},
		      columns: [
		        ['Pacientes', 67, 90, 120, 60, 100]
		      ],
		      axes: {
		    	  Pacientes: 'y'
		       }
	    },
	    bar: {
	        width: {
	            ratio: 0.7 // this makes bar width 50% of length between ticks
	        }
	        // or
	        //width: 100 // this makes bar width 100px
	    },
	    grid: {
	        y: {
	            show: true
	        }
	    },
	    axis: {
	        x: {
	            type: 'category',
	            categories: ['2010', '2011', '2012', '2013', '2014'],
	            label: {
                    text: 'Años',
                    position: 'outer-middle'
                    // inner-top : default
      			},
      			tick: {
                    // format: function (x) { return "Año "+x; }
                   //format: '%Y' // format string is also available for timeseries data
                 }
	        },
	        y : {
	        	label: {
	                      text: 'Cantidad pacientes',
	                      position: 'outer-middle'
	                      // inner-top : default
	        	}         
// 	        	tick: {
//                 format: d3.format("$")  
//             	}
// 	        	,max:130, 
// 	        	min:-20
	        }
	    }
	    ,tooltip: {
	        format: {
	            title: function (v) { 
	            	return "Año " + chart.internal.config.axis_x_categories[v];
	            	},
	        }
	    }
	});
};

function createPieChart(){
	var chart = c3.generate({
		bindto: '#chartPie',
	    data: {
	        // iris data from R
	        columns: [
	            ['Si', 120],
	            ['No', 70],
	            ['Otro', 10]
	        ],
	        names:{'Si':'Si  (120)','No':'No  (70)','Otro':'Otro  (10)'},
	        type : 'pie',
	        onclick: function (d, i) { console.log("onclick", d, i); },
	        labels: {format: function (v, id, i, j) { return "esaaaaa"; }}, 
	        //,onmouseover: function (d, i) { console.log("onmouseover", d, i); },
	        //onmouseout: function (d, i) { console.log("onmouseout", d, i); }
	    },
	    pie: {
	        label: {
// 	            format: function (value, ratio, id) {
// 	                return (value); 
// 	            }
	        },
	        expand: true //animacion expansion
	    },
	    legend: {
	        position: 'right'
	    }
	});
}
</script> 
   

  </body>
</html>
