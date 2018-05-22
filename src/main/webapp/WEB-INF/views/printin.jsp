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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Programa CONEIA 2018</title>
<link rel="png" href="<c:url value='/resources/img/coneia.png'></c:url>">
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css'>
<link rel='stylesheet prefetch' 
	href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css'>
	<script>
	var gth_context_path = '${pageContext.request.contextPath}';
</script>
	<style type="text/css" media="print">
	
@page {
	size: A4;
	margin-top: 1.5cm;
	margin-bottom: 1cm;
}
.demo1 thead{
background:#ECEFF1;
border: 1px solid green;
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
}
.desu{
	font-size:11px;
}
.kimochi{
	font-size:11px;
}
td{
	padding:2.5px;
	border: 1px solid green;
}
thead tr{
	padding-bottom:-5%;
	border: 1px solid green;
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
	<div class="row center aguja" id="aguja" style="margin: 0 6% 0 6%">
	

					<br />
					<div class="row center">
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
					<div class="row center"><img class=""
									src="<c:url value="/resources/img/vintage.jpg"/>"
									style="outline-color: none; margin-left: 5%; float: left; width: 100px;height:30px;float:left"></img><b>Día lunes 04 de junio del 2018</b><img class=""
									src="<c:url value="/resources/img/vintage.jpg"/>"
									style="outline-color: none; margin-left: 5%; float: left; width: 100px;height:30px;float:right"></img></div>
					<div class="row center">
						<div class="col s2 desu">06:30:00 - 08:30:00</div>
						<div class="col s10 desu"><b>Recepcion de delegaciones y entrega de materiales</b></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu">08:30:00 - 10:30:00</div>
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
						<div class="col s2 desu">12:30:00 - 13:00:00</div>
						<div class="col s10 desu"><b>Panel</b></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu">13:00:00 - 14:30:00</div>
						<div class="col s10 desu">ALMUERZO</div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu"><c:out value="${conferenciaLunes[0].horaI}" /> - <c:out value="${conferenciaLunes[0].horaF}" /></div>
						<div class="col s10 desu"><b><c:out value="${conferenciaLunes[0].tema}" /></b><br><c:out value="${conferenciaLunes[0].ponente}" /><br>Lugar: <c:out value="${conferenciaLunes[0].lugar}" /></div>
				
					</div>
					<div class="row center">
						<div class="col s2 desu">16:00:00 - 16:30:00</div>
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
					<div class="row center"><img class=""
									src="<c:url value="/resources/img/vintage.jpg"/>"
									style="outline-color: none; margin-left: 5%; float: left; width: 100px;height:30px;float:left"></img><b>Día martes 05 de junio del 2018</b><img class=""
									src="<c:url value="/resources/img/vintage.jpg"/>"
									style="outline-color: none; margin-left: 5%; float: left; width: 100px;height:30px;float:right"></img></div>
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
					<div class="row center"><img class=""
									src="<c:url value="/resources/img/vintage.jpg"/>"
									style="outline-color: none; margin-left: 5%; float: left; width: 100px;height:30px;float:left"></img><b>Día miércoles 06 de junio del 2018</b><img class=""
									src="<c:url value="/resources/img/vintage.jpg"/>"
									style="outline-color: none; float: left; width: 100px;height:30px;float:right"></img></div>
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
						<div class="col s10 desu">Intervalo Ambientaol - Cultural</div>
				
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
					<div class="row center"><img class=""
									src="<c:url value="/resources/img/vintage.jpg"/>"
									style="outline-color: none; margin-left: 5%; float: left; width: 100px;height:30px;float:left"></img><b>Día jueves 07 de junio del 2018</b><img class=""
									src="<c:url value="/resources/img/vintage.jpg"/>"
									style="outline-color: none; float: left; width: 100px;height:30px;float:right"></img></div>
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
					<div class="row center"><img class=""
									src="<c:url value="/resources/img/vintage.jpg"/>"
									style="outline-color: none; margin-left: 5%; float: left; width: 100px;height:30px;float:left"></img><b>Día viernes 08 de junio del 2018</b><img class=""
									src="<c:url value="/resources/img/vintage.jpg"/>"
									style="outline-color: none; float: left; width: 100px;height:30px;float:right"></img></div>
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
</body>
<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='/resources/js/plugins/materialize.min.js'></c:url>"
		type="text/javascript"></script>
<script>
$(document).ready(function(){
	printContent('aguja');
	
});
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
    	link = gth_context_path + "/asistencia";
    	location.href=link;
    }
});

</script>
</html>
<%
	}
%>