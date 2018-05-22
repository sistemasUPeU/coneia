
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
	<link href="https://fonts.googleapis.com/css?family=Cinzel"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='resources/css/custom/principal.css'/>" media="screen"/>

<script>
	var gth_context_path = '${pageContext.request.contextPath}';
</script>

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
<style>
tr{
font-size:12px;}
td, th {
    padding: 1px 5px;
   
}
	#teachon{
	padding-bottom:0px;
	font-size:10px;
}
.side-nav{
width:50%;
font-size:12px;}
.side-nav a {

    font-size: 12px;}
@media only screen and (max-width: 600px) {
.apellidos{
display:none}
.side-nav{
width:70%;
font-size:8px;}
.side-nav a {

    font-size: 8px;}
html {
    font-size: 11px;
}
	#modal_changepass {
		width: 85%;
	}
	.letrinha{
	font-size:20px;
	}
}

</style>
</head>
<body >

	<input type="hidden" value="${sessionScope.rol}" id="rolcito" />
	<div id="mobile-collapse-button" class="section" style="padding-top: 0">
		<header id="header" class="page-topbar">
	<!-- start header nav-->
		<nav class="navbar-color">
			<div class="nav-wrapper grey darken-3">
				<a href="<%=request.getContextPath()%>/" style="padding:1%; "
								class="brand-logo darken-1 redirect"><img
								src="<c:url value="/resources/img/cones.png"/>" alt="gth logo" style="height:30%;width: 125px; "></a>
				<a href="#" data-activates="mobile-demo" class="button-collapse"><i
					class="mdi-navigation-menu"></i></a>
				<ul class="right hide-on-med-and-down">

					<li>
						<div class="chip grey darken-1 white-text cgProfile" style="cursor: pointer;">
						</div>
					</li>
					<li><a href="<%=request.getContextPath()%>/"
						class="waves-effect waves-block waves-light tooltipped redirect"
						data-position="bottom" data-delay="50" data-tooltip="Menú"><i
							class="medium material-icons prefix">navigation</i></a></li>

					<li><a 
						class="waves-effect waves-block waves-light tooltipped salir"
						data-position="bottom" data-delay="50"
						data-tooltip="Cerrar Sesión"><i class="medium material-icons prefix">exit_to_app</i></a>
					</li>
				</ul>
				<ul class="side-nav" id="mobile-demo">
					<li><a href="#!"
						><b>${sessionScope.nombre} <span class="apellidos"> ${sessionScope.apellidos}</span></b></a>
						</li>
					
					<li><a class="principal">Home</a></li>
					<li><a href="#!" class="salir">Salir</a></li>

				</ul>

				<ul id="notifications-dropdown" class="dropdown-content">
					<li>
						<h5>
							NOTIFICATIONS <span class="new badge">5</span>
						</h5>
					</li>
					<li class="divider"></li>

				</ul>
			</div>
		</nav>

</header>
	</div>
	<div id="divon">
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
					<td class="firsto">07:00 - 07:30</td>
				</tr>
				<tr>
					<td class="firsto">07:30 - 08:00</td>
				</tr>
				<tr>
					<td class="firsto">08:00 - 08:30</td>
					<td rowspan="2" class="#ffc400 amber accent-3"><b><c:out value="${assistance[3].nombre}" /></b><br><c:out value="${assistance[3].ponente}" /><br>Lugar: <c:out value="${assistance[3].lugar}" /></td>
					<td rowspan="2" colspan="2" class="#ffc400 amber accent-3"><b><c:out value="${assistance[8].nombre}" /></b><br><c:out value="${assistance[8].ponente}" /><br>Lugar: <c:out value="${assistance[8].lugar}" /></td>
				</tr>
				<tr>
					<td class="firsto">08:30 - 09:00</td>
					<td rowspan="4" class="#ffd180 orange accent-1"><b>Inaguración del Evento</b><br>Lugar: CARPA MÓVIL</td>
				</tr>
				<tr>
					<td class="firsto">09:00 - 09:30</td>
					<td rowspan="2" class="#ffc400 amber accent-3"><b><c:out value="${assistance[4].nombre}" /></b><br><c:out value="${assistance[4].ponente}" /><br>Lugar: <c:out value="${assistance[4].lugar}" /></td>
					<td rowspan="2" colspan="2" class="#ffc400 amber accent-3"><b><c:out value="${assistance[9].nombre}" /></b><br><c:out value="${assistance[9].ponente}" /><br>Lugar: <c:out value="${assistance[9].lugar}" /></td>
				</tr>
				<tr>
					<td class="firsto">09:30 - 10:00</td>
				</tr>
				<tr>
					<td class="firsto">10:00 - 10:30</td>
					<td class="#7cb342 light-green darken-1">Intervalo Ambiental - Cultural</td>
					<td colspan="2" rowspan="2" class="#7cb342 light-green darken-1">Panel - Intervalo Cultural</td>
				<tr>
					<td class="firsto">10:30 - 11:00</td>
					<td rowspan="2" class="#ffc400 amber accent-3">
					<b><c:out value="${assistance[0].nombre}" /></b><br><c:out value="${assistance[0].ponente}" /><br>Lugar: <c:out value="${assistance[0].lugar}" /></td>
					<td rowspan="2" class="#ffc400 amber accent-3"><b><c:out value="${assistance[4].nombre}" /></b><br><c:out value="${assistance[4].ponente}" /><br>Lugar: <c:out value="${assistance[4].lugar}" /></td>
					
				</tr>
				<tr>
					<td class="firsto">11:00 - 11:30</td>
					<td rowspan="3" class="#69f0ae green accent-2">
						<div><b><c:out value="${actividadesViernes[0].tema}" /></b><br>Lugar: <c:out value="${actividadesViernes[0].lugar}" /></div>	
					
					</td>
					<td rowspan="3"  class="#ef5350 red lighten-1">
						<div ><b><c:out value="${conferenciaViernes[0].tema}" /></b><br>Lugar: <c:out value="${conferenciaViernes[0].lugar}" /></div>
						
					</td >
				</tr>
				<tr>
					<td class="firsto">11:30 - 12:00</td>
					<td rowspan="2" class="#ffc400 amber accent-3"><b><c:out value="${assistance[1].nombre}" /></b><br><c:out value="${assistance[1].ponente}" /><br>Lugar: <c:out value="${assistance[1].lugar}" /></td>
					<td rowspan="2" class="#ffc400 amber accent-3"><b><c:out value="${assistance[5].nombre}" /></b><br><c:out value="${assistance[5].ponente}" /><br>Lugar: <c:out value="${assistance[5].lugar}" /></td>
				</tr>
				<tr>
					<td class="firsto">12:00 - 12:30</td></tr>
				<tr>
					<td class="firsto">12:30 - 13:00</td>
					<td class="#ffcdd2 red lighten-4">Panel</td>
					<td class="#ffcdd2 red lighten-4">Panel</td>
					<td rowspan="3" class="#b2ff59 light-green accent-2" colspan="2">ALMUERZO</td>
				</tr>
				<tr>
					<td class="firsto">13:00 - 13:30</td>
					<td rowspan="3" class="#b2ff59 light-green accent-2">ALMUERZO</td>
					<td rowspan="3" class="#b2ff59 light-green accent-2">ALMUERZO</td>
					<td rowspan="2" class="#b2ff59 light-green accent-2">ALMUERZO</td>
					<td rowspan="2" class="#b2ff59 light-green accent-2">ALMUERZO</td>
				</tr>
				<tr>
					<td class="firsto">13:30 - 14:00</td>
				</tr>
				<tr>
					<td class="firsto">14:00 - 14:30</td>
					<td rowspan="5"  class="#84ffff cyan accent-1">
						<div style="width:50%;float:left"><b><c:out value="${actividadesMiercoles[0].tema}" /></b><br>Lugar: <c:out value="${actividadesMiercoles[0].lugar}" /></div>
						<div  style="width:50%;float:right"><b><c:out value="${actividadesMiercoles[1].tema}" /></b><br>Lugar: <c:out value="${actividadesMiercoles[1].lugar}" /></div>	
					</td>
					<td rowspan="3" class="#ef5350 red lighten-1"><b><c:out value="${conferenciaJueves[0].tema}" /></b><br><c:out value="${conferenciaJueves[0].ponente}" /><br>Lugar: <c:out value="${conferenciaJueves[0].lugar}" /></td>
					<td rowspan="6" colspan="2" class="#69f0ae green accent-2"><b><c:out value="${actividadesViernes[1].tema}" /></b><br>Lugar: <c:out value="${actividadesViernes[1].lugar}" /></td>
				</tr>
				<tr>
					<td class="firsto">14:30 - 15:00</td>
					<td rowspan="3" class="#ef5350 red lighten-1"><b><c:out value="${conferenciaLunes[0].tema}" /></b><br><c:out value="${conferenciaLunes[0].ponente}" /><br>Lugar: <c:out value="${conferenciaLunes[0].lugar}" /></td>
					<td rowspan="5" class="#84ffff cyan accent-1">
							<div style="width:50%;float:left"><b><c:out value="${concursoMartes[0].tema}" /></b><br>Lugar: <c:out value="${concursoMartes[0].lugar}" /></div>
							<div  style="width:50%;float:right"><b><c:out value="${concursoMartes[1].tema}" /></b><br>Lugar: <c:out value="${concursoMartes[1].lugar}" /></div>				
					</td>
				</tr>
				<tr>
					<td class="firsto">15:00 - 15:30</td>
				</tr>
				<tr>
					<td class="firsto">15:30 - 16:00</td>
					<td class="#7cb342 light-green darken-1">Intervalo Ambiental - Cultural</td>
				</tr>
				<tr>
					<td class="firsto">16:00 - 16:30</td>
					<td class="#7cb342 light-green darken-1">Intervalo Ambiental - Cultural</td>
					<td rowspan="3" class="#ef5350 red lighten-1"><b><c:out value="${conferenciaJueves[1].tema}" /></b><br><c:out value="${conferenciaJueves[1].ponente}" /><br>Lugar: <c:out value="${conferenciaJueves[1].lugar}" /></td>
				</tr>
				<tr>
					<td class="firsto">16:30 - 17:00</td>
					<td rowspan="3" class="#ef5350 red lighten-1" ><b><c:out value="${conferenciaLunes[1].tema}" /></b><br><c:out value="${conferenciaLunes[1].ponente}" /><br>Lugar: <c:out value="${conferenciaLunes[1].lugar}" /></td>
					<td rowspan="3" class="#ef5350 red lighten-1"><b><c:out value="${conferenciaMiercoles[0].tema}" /></b><br><c:out value="${conferenciaMiercoles[0].ponente}" /><br>Lugar: <c:out value="${conferenciaMiercoles[0].lugar}" /></td>
				</tr>
				<tr>
					<td class="firsto">17:00 - 17:30</td>
					<td rowspan="2"  class="#84ffff cyan accent-1"><div style="width:50%;float:left"><b><c:out value="${concursoMartes[2].tema}" /></b><br>Lugar: <c:out value="${concursoMartes[2].lugar}" /></div>
							<div  style="width:50%;float:right"><b><c:out value="${concursoMartes[3].tema}" /></b><br>Lugar: <c:out value="${concursoMartes[3].lugar}" /></div></td>
					<td rowspan="9" colspan="2"></td>
				</tr>
				<tr>
					<td class="firsto">17:30 - 18:00</td>
					<td rowspan="8" class="#76ff03 light-green accent-3"><b>COPA CONEIA</b><br>Lugar: LOSAS DEPORTIVAS</td>
				</tr>
				<tr>
					<td class="firsto">18:00 - 18:30</td>
					<td rowspan="2" class="#69f0ae green accent-2"><b><c:out value="${actividadesLunes[0].tema}" /></b><br>Lugar: <c:out value="${actividadesLunes[0].lugar}" /></td>
					<td rowspan="7" class="#69f0ae green accent-2"><b><c:out value="${concursoMartes[4].tema}" /></b><br>Lugar: <c:out value="${concursoMartes[4].lugar}" /></td>
					<td class="#7cb342 light-green darken-1">Intervalo Ambiental - Cultural</td>
				</tr>
				<tr>
					<td class="firsto">18:30 - 19:00</td>
					<td rowspan="3" class="#ef5350 red lighten-1"><b><c:out value="${conferenciaMiercoles[1].tema}" /></b><br><c:out value="${conferenciaMiercoles[1].ponente}" /><br>Lugar: <c:out value="${conferenciaMiercoles[1].lugar}" /></td>
				</tr>
				<tr>
					<td class="firsto">19:00 - 19:30</td>
					<td rowspan="5" class="#7e57c2 deep-purple lighten-1"><b><c:out value="${actividadesLunes[1].tema}" /></b><br>Lugar: <c:out value="${actividadesLunes[1].lugar}" /></td>
				</tr>
				<tr>
					<td class="firsto">19:30 - 20:00</td>
				</tr>
				<tr>
					<td class="firsto">20:00 - 20:30</td>
					<td rowspan="3" ></td>
				</tr>
				<tr>
					<td class="firsto">20:30 - 21:00</td>
				</tr>
				<tr>
					<td class="firsto">21:00 - 21:30</td>
				</tr>
			</tbody>

		</table>
	</div>
	<div class="container solapa" style="display:none;">
		<ul class="collapsible popout " data-collapsible="accordion"
						 style="z-index: 10">
						<li>
							<div class="collapsible-header biselado">
								<div class="row center" style="font-family: 'Cinzel', serif;">
									<b>lunes 04 de junio del 2018</b>
									
									

								</div>
							</div>
							<div class="collapsible-body">
								
					<div class="row center">
						<div class="col s2 desu">06:30 - 08:30</div>
						<div class="col s10 desu"><b>Recepcion de delegaciones y entrega de materiales</b></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu">08:30 - 10:30 </div>
						<div class="col s10 desu"><b>Inauguración del evento</b></div>
				
					</div>
		
					<div class="row center">
						<div class="col s2 desu"><c:out value="${assistance[0].horaI}" /> - <c:out value="${assistance[0].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${assistance[0].nombre}" /></b><br><c:out value="${assistance[0].ponente}" /><br>Lugar: <c:out value="${assistance[0].lugar}" /></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu"><c:out value="${assistance[1].horaI}" /> - <c:out value="${assistance[1].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${assistance[1].nombre}" /></b><br><c:out value="${assistance[1].ponente}" /><br>Lugar: <c:out value="${assistance[1].lugar}" /></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu">12:30  - 13:00</div>
						<div class="col s10 desu"><b>Panel</b></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu">13:00 - 14:30 </div>
						<div class="col s10 desu">ALMUERZO</div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu"><c:out value="${conferenciaLunes[0].horaI}" /> - <c:out value="${conferenciaLunes[0].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${conferenciaLunes[0].tema}" /></b><br><c:out value="${conferenciaLunes[0].ponente}" /><br>Lugar: <c:out value="${conferenciaLunes[0].lugar}" /></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu">16:00 - 16:30 </div>
						<div class="col s10 desu">Intervalo Ambiental - Cultural</div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu"><c:out value="${conferenciaLunes[1].horaI}" /> - <c:out value="${conferenciaLunes[1].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${conferenciaLunes[1].tema}" /></b><br><c:out value="${conferenciaLunes[1].ponente}" /><br>Lugar: <c:out value="${conferenciaLunes[1].lugar}" /></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu"><c:out value="${actividadesLunes[0].horaI}" /> - <c:out value="${actividadesLunes[0].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${actividadesLunes[0].tema}" /></b><br>Lugar: <c:out value="${actividadesLunes[0].lugar}" /></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu"><c:out value="${actividadesLunes[1].horaI}" /> - <c:out value="${actividadesLunes[1].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${actividadesLunes[1].tema}" /></b><br>Lugar: <c:out value="${actividadesLunes[1].lugar}" /></div>
				
					</div>
							</div>
						</li>
						<li>
							
								<div class="collapsible-header biselado">
								<div class="row center" style="font-family: 'Cinzel', serif;">
									 <b>martes 05 de junio del 2018</b>
								</div>
							</div>
					
							<div class="collapsible-body">
								<div class="row center">
						<div class="col s2 desu"><c:out value="${assistance[2].horaI}" /> - <c:out value="${assistance[2].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${assistance[2].nombre}" /></b><br><c:out value="${assistance[2].ponente}" />
						<c:choose>
    					<c:when test="${assistance[2].idt=='2'}">
        				  <br>Lugar: <c:out value="${assistance[2].lugar}" />
        				<br />
    					</c:when>    
    					<c:otherwise>
        				
        				<br />
    					</c:otherwise>
					</c:choose>
						</div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu">13:00:00 - 14:30:00</div>
						<div class="col s10 desu">ALMUERZO</div>
				
					</div>
					
					<div class="row center">
						<div class="col s2 desu"><c:out value="${concursoMartes[0].horaI}" /> - <c:out value="${concursoMartes[0].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${concursoMartes[0].tema}" /></b><br>Lugar: <c:out value="${concursoMartes[0].lugar}" /><br>
						<b><c:out value="${concursoMartes[1].tema}" /></b><br>Lugar: <c:out value="${concursoMartes[1].lugar}" />						
						</div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu"><c:out value="${concursoMartes[2].horaI}" /> - <c:out value="${concursoMartes[2].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${concursoMartes[2].tema}" /></b><br>Lugar: <c:out value="${concursoMartes[2].lugar}" /><br>
						<b><c:out value="${concursoMartes[3].tema}" /></b><br>Lugar: <c:out value="${concursoMartes[3].lugar}" />						
						</div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu"><c:out value="${concursoMartes[4].horaI}" /> - <c:out value="${concursoMartes[4].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${concursoMartes[4].tema}" /></b><br>Lugar: <c:out value="${concursoMartes[4].lugar}" /><br>
											
						</div>
				
					</div><br />
							</div>
						</li>
						<li>
							<div class="collapsible-header" style="font-family: 'Cinzel', serif;">
								<div class="row center">
									<b>miércoles 06 de junio del 2018</b>
								</div>
							</div>
							<div class="collapsible-body">
								<div class="row center">
						<div class="col s2 desu">06:30:00 - 08:00:00</div>
						<div class="col s10 desu"><b>INGRESO</b></div>				
					</div>
					<div class="row center">
						<div class="col s2 desu"><c:out value="${assistance[3].horaI}" /> - <c:out value="${assistance[3].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${assistance[3].nombre}" /></b><br><c:out value="${assistance[3].ponente}" /><br>Lugar: <c:out value="${assistance[3].lugar}" /></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu"><c:out value="${assistance[4].horaI}" /> - <c:out value="${assistance[4].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${assistance[4].nombre}" /></b><br><c:out value="${assistance[4].ponente}" /><br>Lugar: <c:out value="${assistance[4].lugar}" /></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu">10:00:00 - 10:30:00</div>
						<div class="col s10 desu">Intervalo Ambiental - Cultural</div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu"><c:out value="${assistance[5].horaI}" /> - <c:out value="${assistance[5].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${assistance[5].nombre}" /></b><br><c:out value="${assistance[5].ponente}" /><br>Lugar: <c:out value="${assistance[5].lugar}" /></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu"><c:out value="${assistance[6].horaI}" /> - <c:out value="${assistance[6].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${assistance[6].nombre}" /></b><br><c:out value="${assistance[6].ponente}" /><br>Lugar: <c:out value="${assistance[6].lugar}" /></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu">12:30:00 - 13:00:00</div>
						<div class="col s10 desu"><b>Panel</b></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu">13:00:00 - 14:00:00</div>
						<div class="col s10 desu">ALMUERZO</div>
					</div>
					
					<div class="row center">
						<div class="col s2 desu"><c:out value="${actividadesMiercoles[0].horaI}" /> - <c:out value="${actividadesMiercoles[0].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${actividadesMiercoles[0].tema}" /></b><br>Lugar: <c:out value="${actividadesMiercoles[0].lugar}" />
						<br /><b><c:out value="${actividadesMiercoles[1].tema}" /></b><br>Lugar: <c:out value="${actividadesMiercoles[1].lugar}" /></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu"><c:out value="${conferenciaMiercoles[0].horaI}" /> - <c:out value="${conferenciaMiercoles[0].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${conferenciaMiercoles[0].tema}" /></b><br><c:out value="${conferenciaMiercoles[0].ponente}" /><br>Lugar: <c:out value="${conferenciaMiercoles[0].lugar}" /></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu">18:00:00 - 18:30:00</div>
						<div class="col s10 desu">Intervalo Ambiental - Cultural</div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu"><c:out value="${conferenciaMiercoles[1].horaI}" /> - <c:out value="${conferenciaMiercoles[1].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${conferenciaMiercoles[1].tema}" /></b><br><c:out value="${conferenciaMiercoles[1].ponente}" /><br>Lugar: <c:out value="${conferenciaMiercoles[1].lugar}" /></div>
				
					</div>
<!-- 					<div class="row center"> -->
<%-- 						<div class="col s2 desu"><c:out value="${actividadesMiercoles[2].horaI}" /> - <c:out value="${actividadesMiercoles[2].horaF}" /></div> --%>
<%-- 						<div class="col s10 desu"><b><c:out value="${actividadesMiercoles[2].tema}" /></b><br>Lugar: <c:out value="${actividadesMiercoles[2].lugar}" /></div>				 --%>
<!-- 					</div> -->
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center" style="font-family: 'Cinzel', serif;">
									<b>jueves 07 de junio del 2018</b>
								</div>
							</div>
							<div class="collapsible-body">
								<div class="row center">
						<div class="col s2 desu"><c:out value="${assistance[7].horaI}" /> - <c:out value="${assistance[7].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${assistance[7].nombre}" /></b><br><c:out value="${assistance[7].ponente}" />
						<c:choose>
    					<c:when test="${assistance[7].idt=='2'}">
        				  <br>Lugar: <c:out value="${assistance[7].lugar}" />
        				<br />
    					</c:when>    
    					<c:otherwise>
        				
        				<br />
    					</c:otherwise>
					</c:choose>
						</div>
					</div>
					<div class="row center">
						<div class="col s2 desu">13:00:00 - 14:00:00</div>
						<div class="col s10 desu">ALMUERZO</div>
					</div>			
					<div class="row center">
						<div class="col s2 desu"><c:out value="${conferenciaJueves[0].horaI}" /> - <c:out value="${conferenciaJueves[0].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${conferenciaJueves[0].tema}" /></b><br><c:out value="${conferenciaJueves[0].ponente}" /><br>Lugar: <c:out value="${conferenciaJueves[0].lugar}" /></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu">15:30:00 - 16:00:00</div>
						<div class="col s10 desu">Intervalo Ambiental - Cultural</div>				
					</div>
					<div class="row center">
						<div class="col s2 desu"><c:out value="${conferenciaJueves[1].horaI}" /> - <c:out value="${conferenciaJueves[1].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${conferenciaJueves[1].tema}" /></b><br><c:out value="${conferenciaJueves[1].ponente}" /><br>Lugar: <c:out value="${conferenciaJueves[1].lugar}" /></div>
					</div>	
					<div class="row center">
						<div class="col s2 desu">17:30:00 - 21:30:00</div>
						<div class="col s10 desu"><b>COPA CONEIA</b><br>Lugar: LOSAS DEPORTIVAS</div>				
					</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center" style="font-family: 'Cinzel', serif;">
									<b>viernes 08 de junio del 2018</b>
								</div>
							</div>
							<div class="collapsible-body">
								<div class="row center">
						<div class="col s2 desu">06:30:00 - 08:00:00</div>
						<div class="col s10 desu"><b>INGRESO</b></div>				
					</div>
					<div class="row center">
						<div class="col s2 desu"><c:out value="${assistance[8].horaI}" /> - <c:out value="${assistance[8].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${assistance[8].nombre}" /></b><br><c:out value="${assistance[8].ponente}" /><br>Lugar: <c:out value="${assistance[8].lugar}" /></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu"><c:out value="${assistance[9].horaI}" /> - <c:out value="${assistance[9].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${assistance[9].nombre}" /></b><br><c:out value="${assistance[9].ponente}" /><br>Lugar: <c:out value="${assistance[9].lugar}" /></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu">10:00:00 - 11:00:00</div>
						<div class="col s10 desu">Panel Intervalo - Cultural</div>
					</div>
					<div class="row center">
						<div class="col s2 desu"><c:out value="${conferenciaViernes[0].horaI}" /> - <c:out value="${conferenciaViernes[0].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${conferenciaViernes[0].tema}" /></b><br><c:out value="${conferenciaViernes[0].ponente}" /><br>Lugar: <c:out value="${conferenciaViernes[0].lugar}" /><br />
						<b><c:out value="${actividadesViernes[0].tema}" /></b><br>Lugar: <c:out value="${actividadesViernes[0].lugar}" />
						</div>
					</div>	
					<div class="row center">
						<div class="col s2 desu">12:30:00 - 14:00:00</div>
						<div class="col s10 desu">ALMUERZO</div>
					</div>	
					<div class="row center">
						<div class="col s2 desu"><c:out value="${actividadesViernes[1].horaI}" /> - <c:out value="${actividadesViernes[1].horaF}" /></div>
						<div class="col s10 desu">
						<b><c:out value="${actividadesViernes[1].tema}" /></b><br>Lugar: <c:out value="${actividadesViernes[1].lugar}" />
						</div>
					</div>		
							</div>
						</li>


					</ul>
	</div>

		<div class="row container center impresiones" style="margin-top: 3em;margin-bottom:3em">
			<div class="col s6">
				<a class="btn btn-large #aa00ff purple accent-4" onclick="printContent('forma')"><i class="large material-icons left">apps</i> Imprimir Formato 1</a>
			</div>
			<div class="col s6">
				<a class="btn btn-large #aa00ff purple accent-4 agujon "><i class="large material-icons left">filter_3</i> Imprimir Formato 2</a>			
			</div>
		</div>

</div>
	<div class="page-footer #00c853 green accent-4" style="padding: 0;float:left;width:100%;bottom:0" id="foot1">
			<div class="footer-copyright">
				<div class="container" style="color:white">
					Copyright © 2017 <a class="grey-text text-lighten-4" target="_blank">Alpha
					Team</a> All rights reserved. <span class="right" id="foot2">Developed by <a
				class="grey-text text-lighten-4">Alpha Team</a></span>
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
			try{
				
				var nombre = "${sessionScope.nombre}";
				var apellidos =  "${sessionScope.apellidos}";

						var s='';
						s +='<img src="<c:url value="/resources/img/user.png"/>" alt="Usuario">';
						s +=nombre.toUpperCase()+", "+apellidos.toUpperCase();
						$(".cgProfile").empty();
						$(".cgProfile").append(s);

			}catch(e){
				
			}
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
			checkSize();
		});
		$(window).on('resize', function() {
			checkSize()
		});

		function checkSize() {
			if ($(window).width() < 800) {
				// your code here
				if ($(window).width() < 670) {
					$("#foot1").addClass("center");
					$("#foot2").addClass("center").removeClass("right");
					$("#foot1").css("padding","5px");
					$("#forma").hide();
					$(".solapa").show();
					$(".impresiones").hide();
					$("#divon").css("min-height","800px");
					$(".desu").css("font-size","8px");
				}else{
					$("#foot1").addClass("center");
					$("#foot2").addClass("center").removeClass("right");
					$("#foot1").css("padding","5px");
					$(".desu").css("font-size","8px");
					$("#forma").hide();
					$(".solapa").show();
					$(".impresiones").show();
					$("#divon").css("min-height","800px");
					$(".desu").css("font-size","12px");
				}
				

			} else {
				$("#forma").show();	
				$(".solapa").hide();
				$("#foot1").removeClass("center");
				$("#foot2").removeClass("center").addClass("right");
				$("#foot1").css("padding","15px");
				$(".impresiones").show();
				$("#divon").css("min-height","");
			}
		}
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