
<%
	HttpSession sesion = request.getSession();
	if (sesion.getAttribute("dni") == null || sesion.getAttribute("rol") == null) {
		response.sendRedirect("/CONEIA/");

	} else {
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Asistencia</title>
<link rel="shortcut icon"
	href="<c:url value='/resources/img/favicon/favicon.ico'></c:url>">
<!--Global Config-->
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="png" href="<c:url value='/resources/img/coneia.png'></c:url>">

<!-- Global Styles-->
<link href="<c:url value='/resources/css/materialize.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css'>
<link rel='stylesheet prefetch' 
	href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css'>
<link
	href="<c:url value='/resources/js/plugins/sweetalert/sweetalert.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lobster+Two"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Quicksand"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='resources/css/custom/principal.css'/>" />

<script>
	var gth_context_path = '${pageContext.request.contextPath}';
</script>
<style media="scren">
	#teachon{
	padding-bottom:0px;
	font-size:10px;
}
</style>
<style type="text/css" media="print">
@page {
	size: A4 landscape;
	page-break-before:avoid;
	margin-top:0;
}
.demo1 thead{
background:#ECEFF1;
border: 1px solid black;
font-size:8px;
}
.techi{padding:3px;
}
.demo1 tbody{
	font-size:6px;
	cellpadding:1;
	font-size:8px;
	
}#teachon{
	padding-bottom:0px;
	font-size:10px;
}.kimochi{font-size:9px;padding:3}
.desu{
	font-size:10px;
}
td{
	padding:2.5px;
	border: 1px solid black;
}
thead tr{
	padding-bottom:-5%;
	border: 1px solid black;
}

.zz{
	width: 100px; height: 37%;overflow:hidden;
}

#forma{
	border: 1px solid green;
	margin:0;
}
</style>
</head>
<body>

	<input type="hidden" value="${sessionScope.rol}" id="rolcito" />
	<div id="mobile-collapse-button" class="section" style="padding-top: 0">
		<nav class="#000000 black">
		<div class="nav-wrapper">
			<a href="#!" class="brand-logo"><img class="zz"
				src="<c:url value="/resources/img/cones.png"/>"
				style="width: 300px; height: 35%; outline-color: none; margin-left: 5%"></img></a>
			<a href="#" data-activates="mobile-demo" class="button-collapse"><i
				class="mdi-navigation-menu"></i></a>
			<ul class="right hide-on-med-and-down">
				<li><a class="principal">Home</a></li>
				<li class="prog"><a class="programa">Programa</a></li>
				<li class="asist"><a class="asistencia">Asistencia</a></li>
				<li><a class="dropdown-button" href="#!"
					data-activates="dropdown1"><b>${sessionScope.nombre}
							${sessionScope.apellidos}</b></a>
					<ul id='dropdown1' class='dropdown-content'>
						<li><a href="#!" class="salir">Salir</a></li>
					</ul></li>
			</ul>
			<ul class="side-nav" id="mobile-demo">
				<li><a class="dropdown-button" href="#!"
					data-activates="dropdown2"><b>${sessionScope.nombre}
							${sessionScope.apellidos} </b></a>
					<ul id='dropdown2' class='dropdown-content '>
						<li><a href="#!" class="salir">Salir</a></li>
					</ul></li>

				<li><a class="principal">Home</a></li>
				<li class="prog"><a class="programa">Programa</a></li>
				<li class="asist"><a class="asistencia">Asistencia</a></li>
			</ul>
		</div>
		</nav>
	</div>
	<div class="forma" style="margin: 0 5% 0 5%" id="forma">

		<table class="centered demo1" style="border:2px double black"> 
			<thead>
				<tr>
					<th colspan="7" scope="col" id="teachon">
						<div class="row">
							<div class="col s2">
								<a href="#!" class="brand-logo"><img class=""
									src="<c:url value="/resources/img/cones.png"/>"
									style="outline-color: none; margin-left: 5%; float: left; width: 150px"></img></a>
							</div>
							<div class="col s10 kimochi">
								<span style="color: green" class="row"> XIII Congreso
									Nacional de Estudiantes de Ingeniería Ambiental CONEIA 2018 -
									UPeU </span> <span style="font-weight: bold" class="row">
									PROGRAMA GENERAL DE ACTIVIDADES - 04 al 08 de Junio de 2018 </span>

							</div>
						</div>

					</th>

				</tr>
				<tr>
					<th class="techi" width="8%">Hora</th>
					<th class="techi" width="18%">LUNES</th>
					<th class="techi" width="18%">MARTES</th>
					<th class="techi" width="20%">MIÉRCOLES</th>
					<th class="techi" width="18%">JUEVES</th>
					<th class="techi" width="18%"  colspan="2">VIERNES</th>

				</tr>
			</thead>
			<tbody>
				<tr>
					<td>06:30 - 07:00</td>
					<td rowspan="4" class="#82b1ff blue accent-1"><b>Recepcion de delegaciones y entrega de materiales</b></td>
					<td rowspan="13" class="#9fa8da indigo lighten-3"><b><c:out value="${assistance[2].nombre}" /></b><br><c:out value="${assistance[2].ponente}" /><br>
      				<c:choose>
    					<c:when test="${assistance[2].idt=='2'}">
        				  Lugar: <c:out value="${assistance[2].lugar}" />
        				<br />
    					</c:when>    
    					<c:otherwise>
        				
        				<br />
    					</c:otherwise>
					</c:choose>
					</td>
					<td rowspan="3" class="#82b1ff blue accent-1">INGRESO</td>
					<td rowspan="13" class="#ff80ab pink accent-1"><b><c:out value="${assistance[7].nombre}" /></b><br><c:out value="${assistance[7].ponente}" /><br>
      				<c:choose>
    					<c:when test="${assistance[7].idt=='2'}">
        				  Lugar: <c:out value="${assistance[7].lugar}" />
        				<br />
    					</c:when>    
    					<c:otherwise>
        				
        				<br />
    					</c:otherwise>
					</c:choose></td>
					<td rowspan="3" colspan="2" class="#82b1ff blue accent-1">INGRESO</td>
				</tr>
				<tr>
					<td>07:00 - 07:30</td>
				</tr>
				<tr>
					<td>07:30 - 08:00</td>
				</tr>
				<tr>
					<td>08:00 - 08:30</td>
					<td rowspan="2" class="#ffc400 amber accent-3"><b><c:out value="${assistance[3].nombre}" /></b><br><c:out value="${assistance[3].ponente}" /><br>Lugar: <c:out value="${assistance[3].lugar}" /></td>
					<td rowspan="2" colspan="2" class="#ffc400 amber accent-3"><b><c:out value="${assistance[8].nombre}" /></b><br><c:out value="${assistance[8].ponente}" /><br>Lugar: <c:out value="${assistance[8].lugar}" /></td>
				</tr>
				<tr>
					<td>08:30 - 09:00</td>
					<td rowspan="4" class="#ffd180 orange accent-1"><b>Inaguración del Evento</b><br>Lugar: CARPA MÓVIL</td>
				</tr>
				<tr>
					<td>09:00 - 09:30</td>
					<td rowspan="2" class="#ffc400 amber accent-3"><b><c:out value="${assistance[4].nombre}" /></b><br><c:out value="${assistance[4].ponente}" /><br>Lugar: <c:out value="${assistance[4].lugar}" /></td>
					<td rowspan="2" colspan="2" class="#ffc400 amber accent-3"><b><c:out value="${assistance[9].nombre}" /></b><br><c:out value="${assistance[9].ponente}" /><br>Lugar: <c:out value="${assistance[9].lugar}" /></td>
				</tr>
				<tr>
					<td>09:30 - 10:00</td>
				</tr>
				<tr>
					<td>10:00 - 10:30</td>
					<td class="#7cb342 light-green darken-1">Intervalo Ambiental - Cultural</td>
					<td colspan="2" class="#7cb342 light-green darken-1">Intervalo Ambiental - Cultural</td>
				</tr>
				<tr>
					<td>10:30 - 11:00</td>
					<td rowspan="2" class="#ffc400 amber accent-3">
					<b><c:out value="${assistance[0].nombre}" /></b><br><c:out value="${assistance[0].ponente}" /><br>Lugar: <c:out value="${assistance[0].lugar}" /></td>
					<td rowspan="2" class="#ffc400 amber accent-3"><b><c:out value="${assistance[4].nombre}" /></b><br><c:out value="${assistance[4].ponente}" /><br>Lugar: <c:out value="${assistance[4].lugar}" /></td>
					<td rowspan="3"  class="#ef5350 red lighten-1">
						<div ><b><c:out value="${conferenciaViernes[0].tema}" /></b><br>Lugar: <c:out value="${conferenciaViernes[0].lugar}" /></div>
						
					</td >
					<td rowspan="3" class="#69f0ae green accent-2">
						<div><b><c:out value="${actividadesViernes[0].tema}" /></b><br>Lugar: <c:out value="${actividadesViernes[0].lugar}" /></div>	
					
					</td>
				</tr>
				<tr>
					<td>11:00 - 11:30</td>
				</tr>
				<tr>
					<td>11:30 - 12:00</td>
					<td rowspan="2" class="#ffc400 amber accent-3"><b><c:out value="${assistance[1].nombre}" /></b><br><c:out value="${assistance[1].ponente}" /><br>Lugar: <c:out value="${assistance[1].lugar}" /></td>
					<td rowspan="2" class="#ffc400 amber accent-3"><b><c:out value="${assistance[5].nombre}" /></b><br><c:out value="${assistance[5].ponente}" /><br>Lugar: <c:out value="${assistance[5].lugar}" /></td>
				</tr>
				<tr>
					<td>12:00 - 12:30</td>
					<td rowspan="4" class="#b2ff59 light-green accent-2" colspan="2">ALMUERZO</td>
				</tr>
				<tr>
					<td>12:30 - 13:00</td>
					<td class="#ffcdd2 red lighten-4">Panel</td>
					<td class="#ffcdd2 red lighten-4">Panel</td>
				</tr>
				<tr>
					<td>13:00 - 13:30</td>
					<td rowspan="3" class="#b2ff59 light-green accent-2">ALMUERZO</td>
					<td rowspan="3" class="#b2ff59 light-green accent-2">ALMUERZO</td>
					<td rowspan="2" class="#b2ff59 light-green accent-2">ALMUERZO</td>
					<td rowspan="2" class="#b2ff59 light-green accent-2">ALMUERZO</td>
				</tr>
				<tr>
					<td>13:30 - 14:00</td>
				</tr>
				<tr>
					<td>14:00 - 14:30</td>
					<td rowspan="5"  class="#84ffff cyan accent-1">
						<div style="width:50%;float:left"><b><c:out value="${actividadesMiercoles[0].tema}" /></b><br>Lugar: <c:out value="${actividadesMiercoles[0].lugar}" /></div>
						<div  style="width:50%;float:right"><b><c:out value="${actividadesMiercoles[1].tema}" /></b><br>Lugar: <c:out value="${actividadesMiercoles[1].lugar}" /></div>	
					</td>
					<td rowspan="3" class="#ef5350 red lighten-1"><b><c:out value="${conferenciaJueves[0].tema}" /></b><br><c:out value="${conferenciaJueves[0].ponente}" /><br>Lugar: <c:out value="${conferenciaJueves[0].lugar}" /></td>
					<td rowspan="6" colspan="2" class="#69f0ae green accent-2"><b><c:out value="${actividadesViernes[1].tema}" /></b><br>Lugar: <c:out value="${actividadesViernes[1].lugar}" /></td>
				</tr>
				<tr>
					<td>14:30 - 15:00</td>
					<td rowspan="3" class="#ef5350 red lighten-1"><b><c:out value="${conferenciaLunes[0].tema}" /></b><br><c:out value="${conferenciaLunes[0].ponente}" /><br>Lugar: <c:out value="${conferenciaLunes[0].lugar}" /></td>
					<td rowspan="5" class="#84ffff cyan accent-1">
							<div style="width:50%;float:left"><b><c:out value="${concursoMartes[0].tema}" /></b><br>Lugar: <c:out value="${concursoMartes[0].lugar}" /></div>
							<div  style="width:50%;float:right"><b><c:out value="${concursoMartes[1].tema}" /></b><br>Lugar: <c:out value="${concursoMartes[1].lugar}" /></div>				
					</td>
				</tr>
				<tr>
					<td>15:00 - 15:30</td>
				</tr>
				<tr>
					<td>15:30 - 16:00</td>
					<td class="#7cb342 light-green darken-1">Intervalo Ambiental - Cultural</td>
				</tr>
				<tr>
					<td>16:00 - 16:30</td>
					<td class="#7cb342 light-green darken-1">Intervalo Ambiental - Cultural</td>
					<td rowspan="3" class="#ef5350 red lighten-1"><b><c:out value="${conferenciaJueves[1].tema}" /></b><br><c:out value="${conferenciaJueves[1].ponente}" /><br>Lugar: <c:out value="${conferenciaJueves[1].lugar}" /></td>
				</tr>
				<tr>
					<td>16:30 - 17:00</td>
					<td rowspan="3" class="#ef5350 red lighten-1" ><b><c:out value="${conferenciaLunes[1].tema}" /></b><br><c:out value="${conferenciaLunes[1].ponente}" /><br>Lugar: <c:out value="${conferenciaLunes[1].lugar}" /></td>
					<td rowspan="3" class="#ef5350 red lighten-1"><b><c:out value="${conferenciaMiercoles[0].tema}" /></b><br><c:out value="${conferenciaMiercoles[0].ponente}" /><br>Lugar: <c:out value="${conferenciaMiercoles[0].lugar}" /></td>
				</tr>
				<tr>
					<td>17:00 - 17:30</td>
					<td rowspan="2"  class="#84ffff cyan accent-1"><div style="width:50%;float:left"><b><c:out value="${concursoMartes[2].tema}" /></b><br>Lugar: <c:out value="${concursoMartes[2].lugar}" /></div>
							<div  style="width:50%;float:right"><b><c:out value="${concursoMartes[3].tema}" /></b><br>Lugar: <c:out value="${concursoMartes[3].lugar}" /></div></td>
					<td rowspan="9" colspan="2"></td>
				</tr>
				<tr>
					<td>17:30 - 18:00</td>
					<td rowspan="8" class="#76ff03 light-green accent-3"><b>COPA CONEIA</b><br>Lugar: LOSAS DEPORTIVAS</td>
				</tr>
				<tr>
					<td>18:00 - 18:30</td>
					<td rowspan="2" class="#69f0ae green accent-2"><b><c:out value="${actividadesLunes[0].tema}" /></b><br>Lugar: <c:out value="${actividadesLunes[0].lugar}" /></td>
					<td rowspan="7" class="#69f0ae green accent-2"><b><c:out value="${concursoMartes[4].tema}" /></b><br>Lugar: <c:out value="${concursoMartes[4].lugar}" /></td>
					<td class="#7cb342 light-green darken-1">Intervalo Ambiental - Cultural</td>
				</tr>
				<tr>
					<td>18:30 - 19:00</td>
					<td rowspan="3" class="#ef5350 red lighten-1"><b><c:out value="${conferenciaMiercoles[1].tema}" /></b><br><c:out value="${conferenciaMiercoles[1].ponente}" /><br>Lugar: <c:out value="${conferenciaMiercoles[1].lugar}" /></td>
				</tr>
				<tr>
					<td>19:00 - 19:30</td>
					<td rowspan="5" class="#7e57c2 deep-purple lighten-1"><b><c:out value="${actividadesLunes[1].tema}" /></b><br>Lugar: <c:out value="${actividadesLunes[1].lugar}" /></td>
				</tr>
				<tr>
					<td>19:30 - 20:00</td>
				</tr>
				<tr>
					<td>20:00 - 20:30</td>
					<td rowspan="3" class="#69f0ae green accent-2"><b><c:out value="${actividadesMiercoles[2].tema}" /></b><br>Lugar: <c:out value="${actividadesMiercoles[2].lugar}" /></td>
				</tr>
				<tr>
					<td>20:30 - 21:00</td>
				</tr>
				<tr>
					<td>21:00 - 21:30</td>
				</tr>
			</tbody>

		</table>
	</div>

		<div class="row container center" style="margin-top: 3em;margin-bottom:3em">
			<div class="col s6">
				<a class="btn btn-large #aa00ff purple accent-4" onclick="printContent('forma')"><i class="large material-icons left">apps</i> Imprimir Formato 1</a>
			</div>
			<div class="col s6">
				<a class="btn btn-large #aa00ff purple accent-4 agujon "><i class="large material-icons left">filter_3</i> Imprimir Formato 2</a>			
			</div>
		</div>


	<div class="page-footer #00c853 green accent-4" style="padding: 0;float:left;width:100%;bottom:0">
		<div class="footer-copyright">
			<div class="row container">
				Copyright © 2017 <a class="grey-text text-lighten-4" target="_blank">Alpha
					Team</a> All rights reserved. <span class="right ">Developed by
					<a class="grey-text text-lighten-4">Alpha Team</a>
				</span>
			</div>
		</div>
		</div>
	<!-- Javascript-->
	<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='/resources/js/plugins/materialize.min.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='/resources/js/plugins/sweetalert/sweetalert.min.js'></c:url>"
		type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".button-collapse").sideNav();
			$('.btn-message').click(function() {
				swal("Here's a message!");
			});
			$('.dropdown-button').dropdown({
				inDuration : 300,
				outDuration : 225,
				constrainWidth : true, // Does not change width of dropdown to that of the activator
				hover : false, // Activate on hover
				gutter : 0, // Spacing from edge
				belowOrigin : true, // Displays dropdown below the button
				alignment : 'left', // Displays dropdown with edge aligned to the left of button
				stopPropagation : false
			// Stops event propagation

			});
			$.get("inscrito", null, function(data) {
				if (data > 10) {
					$(".prog").css("display", "none");
					$(".asist").css("display", "block");
				} else {
					var link = gth_context_path + "/"
					location.href = link;
				}
			})

		});
		$(".agujon").click(function(){
			var link = gth_context_path + "/printin"

			location.href = link;

			});
			

		$('table.demo1 thead').css('background', '#ECEFF1');

		$("#register").click(function() {
			$.get("inscripcion", null, function(data, status) {
				$("#space").html(data);
			});
		});

		document.addEventListener("DOMContentLoaded", function() {
			$('.preloader-background').delay(1700).fadeOut('slow');

			$('.preloader-wrapper').delay(1700).fadeOut();
		});

		$(".programa").click(function() {
			var link = "";
			var rol = $("#rolcito").val();
			if (rol == "administrador") {
				link = gth_context_path + "/programaAdmin";
			} else {
				link = gth_context_path + "/programa";
			}
			location.href = link;
		});

		$(".principal").click(function() {
			var link = gth_context_path + "/principal"

			location.href = link;
		})

		$(".asistencia").click(function() {
			var link = "";
			var rol = $("#rolcito").val();
			if (rol == "participante") {
				link = gth_context_path + "/asistencia";
			} 
			location.href = link;
		})

		$(".salir").on("click", function() {
			$.post("logon", {
				op : '2'
			}, function() {
				var link = gth_context_path + "/"

				location.href = link;
			});

		});

		$(".talleres").click(function() {
			$.get("talleres", null, function(data, status) {
				$("#space").html(data);
			});
		})
		function printContent(el){
				var restorepage = document.body.innerHTML;
				var printcontent = document.getElementById(el).innerHTML;
				document.body.innerHTML = printcontent;
				window.print();
				document.body.innerHTML = restorepage;
			}
		var mediaQueryList = window.matchMedia('print');
		mediaQueryList.addListener(function(mql) {
		    if (mql.matches) {
		        console.log('before print dialog open');
		    } else {
		        location.reload();
		    }
		});
	</script>
</body>
</html>
<%
	}
%>