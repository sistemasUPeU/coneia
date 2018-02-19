
<%
	HttpSession sesion = request.getSession();
	if (sesion.getAttribute("dni") == null || sesion.getAttribute("rol") == null) {
		response.sendRedirect("/CONEIA/");

	} else {
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*,java.util.*, java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<link
	href="<c:url value='/resources/js/plugins/dropify/css/dropify.min.css'/>"
	type="text/css" rel="stylesheet" media="screen,projection">
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css'>

<link
	href="<c:url value='http://fonts.googleapis.com/icon?family=Material+Icons'></c:url>"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/style.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='/resources/css/perfect-scrollbar.css'></c:url>"
	rel="stylesheet" type="text/css" />

<!-- <link -->
<%-- 	href="<c:url value='/resources/materialize-stepper.min.css'></c:url>" --%>
<!-- 	rel="stylesheet" type="text/css" /> -->

<link
	href="<c:url value='/resources/js/plugins/data-tables/css/jquery.dataTables.min.css'></c:url>"
	rel="stylesheet" type="text/css" />


<script>
var coneia_context_path = "<%=request.getContextPath()%>";
	function setUrlPath(url) {
		var s = coneia_context_path + url;
		return s;
	}
</script>
<%@include file="../../../jspf/general.jspf"%>
<link href="<c:url value='/resources/css/alertify.min.css'></c:url>"
	rel="stylesheet" type="text/css" />

<link href="<c:url value='/resources/css/programaAdmin.css'></c:url>"
	rel="stylesheet" type="text/css" />
<script src="<c:url value='/resources/js/programaAdmin.js'></c:url>"
	type="text/javascript"></script>
<link href="https://fonts.googleapis.com/css?family=Lobster+Two"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Crimson+Text"
	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Cinzel" rel="stylesheet">
<style>

div.container {
	max-width: 1200px
}
.row{
width:100%;
}
.modal{
margin-left:30%;
}
.s-alert-box {

}.alertify .ajs-modal{  z-index: 9999;margin-top:20%;margin-left:25%; }
.special_row {
	width: 40%;
	margin-top: 7%;
	margin-bottom: 7%;
}

.collapsible li.active .i {
	-ms-transform: rotate(180deg); /* IE 9 */
	-webkit-transform: rotate(180deg); /* Chrome, Safari, Opera */
	transform: rotate(180deg);
}

.fonto {
	font-family: 'Crimson Text', serif;
	font-size: 18px;
	font-weight: bold;
}
@media only screen and (max-width: 995px) {
	.modal{margin-left:10%;}.alertify .ajs-modal{ margin-top:10%;margin-left:15%; }
}

@media only screen and (max-width: 600px) {
	.special_row {
		width: 90%;
		padding: 0px;
		margin-top: 7%;
		margin-bottom: 7%;
	}.modal{margin-left:10%;}
	
	#slide-out {
		width: 30%;
	}
}
</style>
<title>Programa</title>
</head>
<body>
	<%@include file="../../../jspf/header.jspf"%>
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>

	</div>
	<div id="main">
	
		<div class="wrapper">
			<%@include file="../../../jspf/aside_left.jspf"%>
			<section id="content">
			<div class="row center container">
				<div class="col s12">
					<h4>
						<i class="material-icons md-dark md-36 white">alarm</i><span
							style="font-family: 'Lobster Two', cursive;">Programación
							para el evento </span> CONEIA <span
							style="font-family: 'Lobster Two', cursive;">2018</span>
						
  
					</h4>
				</div>
			</div>

			<div class="row  #bdbdbd grey lighten-1"
				style="height: auto; min-height: 1000px;" id="urusai">
				<div class="col s12 #ccff90 light-green accent-1" id="myHeader">
					<ul class="tabs tabs-fixed-width #ccff90 light-green accent-1">
						<li class="tab "><a id="one" class="#ccff90 "
							style="color: #003300; font-weight: bold" href="#swipe-1"
							onclick="Materialize.showStaggeredList('#staggered-test')"><span
								class="nigga">LUNES</span></a></li>
						<li class="tab active"><a
							style="color: #003300; font-weight: bold" id="two"
							href="#swipe-2"
							onclick="Materialize.showStaggeredList('#staggered-test2')"><span
								class="nigga">MARTES</span></a></li>
						<li class="tab"><a style="color: #003300; font-weight: bold"
							id="three" href="#swipe-3"
							onclick="Materialize.showStaggeredList('#staggered-test3')"><span
								class="nigga">MIÉRCOLES</span></a></li>
						<li class="tab"><a style="color: #003300; font-weight: bold"
							id="four" href="#swipe-4"
							onclick="Materialize.showStaggeredList('#staggered-test4')"><span
								class="nigga">JUEVES</span></a></li>
						<li class="tab"><a style="color: #003300; font-weight: bold"
							id="five" href="#swipe-5"
							onclick="Materialize.showStaggeredList('#staggered-test5')"><span
								class="nigga">VIERNES</span></a></li>
					</ul>
				</div>

				<!-- D I A   L U N E S -->
				<div id="swipe-1" class="col s12 #bdbdbd grey lighten-1"
					style="height: auto; margin-bottom: 1em;">
					<div class="row container">
						<br /> <br />
						<ul class="collapsible popout" data-collapsible="accordion"
							style="z-index: 15">
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">rowing</i> Recepción de
											delegaciones y entrega de materiales
										</div>
										<div class="col l5 m4 s11">06:30 - 08:30 am</div>
									
									</div>
								</div>

							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">highlight</i> Inauguración del
											evento
										</div>
										<div class="col l4 m4 s11">08:30 - 10:30 am</div>
										<div class="col l1 m1 s2 ">
											<i class="material-icons i right">expand_more</i>
										</div>

									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center">Lugar: CARPA MÓVIL</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">mic</i> Ponencias paralelas
										</div>
										<div class="col l4 m4 s11">10:30 am - 12:30 pm</div>
										<div class="col l1 m1 s1 ">
											<i class="material-icons i right">expand_more</i>
										</div>

									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center ponenciasLunes"></div>
									<div class="row center ponenciasLunes2"></div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">pan_tool</i> Panel
										</div>
										<div class="col l4 m4 s11">12:30 - 01:00 pm</div>
										<div class="col l1 m1 s1 "></div>

									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">alarm_on</i> Almuerzo
										</div>
										<div class="col l4 m4 s11">01:00 - 02:30 pm</div>

									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">nature_people</i> <u>Conferencia
												magistral</u>
										</div>
										<div class="col l4 m4 s11">03:00 - 04:00 pm</div>
										<div class="col l1 m1 s1 ">
											<i class="material-icons i md-24 right">expand_more</i>
										</div>

									</div>
								</div>
								<div class="collapsible-body ">
									<div class="row center">
										<div class="col s12 conf1"></div>
									</div>

								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons ">hourglass_full</i> Intervalo
											Ambiental - Cultural
										</div>
										<div class="col l4 m4 s11">04:00 - 04:30 pm</div>
								
									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">nature_people</i> <u>Conferencia
												magistral</u>
										</div>
										<div class="col l4 m4 s10">04:30 - 06:00 pm</div>
										<div class="col l1 m1 s2 ">
											<i class="material-icons i md-24 right">expand_more</i>
										</div>

									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center">
										<div class="col s12 conf2"></div>
									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">format_shapes</i> Presentación de
											delegaciones
										</div>
										<div class="col l4 m4 s10">06:00 - 07:00 pm</div>

										<div class="col l1 m1 s2 ">
											<i class="material-icons i md-24 right">expand_more</i>
										</div>
									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center act1"></div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">brightness_3</i> NOCHE CULTURAL
										</div>
										<div class="col l4 m4 s10">07:30 - 09:30 pm</div>
										<div class="col l1 m1 s2 ">
											<i class="material-icons i md-24 right">expand_more</i>
										</div>
									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center act2"></div>
								</div>
							</li>

						</ul>
					</div>
				</div>

				<!-- D  I  A     M  A  R  T  E  S -->
				<div id="swipe-2" class="col s12 #bdbdbd grey lighten-1"
					style="height: auto; margin-bottom: 2em;">
					<div class="container">
						<br /> <br />
						<ul class="collapsible popout" data-collapsible="accordion"
							id="staggered-test2">
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">style</i> Talleres especializados y
											visitas técnicas
										</div>
										<div class="col l4 m4 s11">06:30 am - 12:30 pm</div>
										<div class="col l1 m1 s1 ">
											<i class="material-icons i right">expand_more</i>
										</div>

									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center">
										<div class="col s6 visitaMartes"></div>
										<div class="col s6 talleresMartes"></div>

									</div>


								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">alarm_on</i> Almuerzo
										</div>
										<div class="col l4 m4 s10">01:00 - 02:30 pm</div>

									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">layers_clear</i> <u>Concursos</u>
										</div>
										<div class="col l4 m4 s11">02:30 - 06:00 pm</div>
										<div class="col l1 m1 s1 ">
											<i class="material-icons i right">expand_more</i>
										</div>

									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center">
										<div class="row ">
											<i class="material-icons md-18">access_time</i> Horario: <label style="font-size:14px">
											${concursoMartes[0].horaI } a ${concursoMartes[0].horaF } </label>
										</div>
										<div class="divider"></div><br />
										<div class="col s6">
											<div class="row center act3"></div>
										</div>
										<div class="col s6">
											<div class="row center act4"></div>
										</div>
									</div><br />
									<div class="row center">
										<div class="row ">
											<i class="material-icons md-18">access_time</i> Horario: <label style="font-size:14px">
											${concursoMartes[2].horaI } a ${concursoMartes[2].horaF } </label>
										</div>
										<div class="divider"></div><br />
										<div class="col s6">
											<div class="row center act5"></div>
										</div>
										<div class="col s6">
											<div class="row center act6"></div>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">local_florist</i>Mi compromiso con
											el medio ambiente
										</div>
										<div class="col l4 m4 s11">06:00 - 09:30 pm</div>
										<div class="col l1 m1 s1 ">
											<i class="material-icons i right">expand_more</i>
										</div>
									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center">
										<div class="col s3"></div>
										<div class="col s6">
											<div class="row center act7"></div>
										</div>
										<div class="col s3"></div>
									</div>
								</div>
							</li>

						</ul>
					</div>
				</div>

				<!-- D  I  A     M  I  E  R  C  O  L  E  S -->
				<div id="swipe-3" class="col s12 #bdbdbd grey lighten-1"
					style="height: auto; margin-bottom: 2em">
					<div class="container">
						<br /> <br />
						<ul class="collapsible popout" data-collapsible="accordion"
							id="staggered-test3">
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">playlist_add_check</i> INGRESO
										</div>
										<div class="col l4 m4 s10">06:30 - 08:00 am</div>
										<div class="col l1 m1 s1 "></div>
									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">mic</i> Ponencias paralelas 
										</div>
										<div class="col l4 m4 s11">08:00 - 10:00 am</div>
										<div class="col l1 m1 s1 ">
											<i class="material-icons i right">expand_more</i>
										</div>

									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center ponenciasMiercoles1"></div>
									<div class="row center ponenciasMiercoles2"></div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">nature</i> Intervalo Ambiental -
											Cultural
										</div>
										<div class="col l4 m4 s11">10:00 - 10:30 am</div>
										<div class="col l1 m1 s1 "></div>

									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header biselado bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">mic</i> Ponencias paralelas 
										</div>
										<div class="col l4 m4 s11">10:30 am - 12:30 pm</div>
										<div class="col l1 m1 s1 ">
											<i class="material-icons i right">expand_more</i>
										</div>

									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center ponenciasMiercoles3"></div>
									<div class="row center ponenciasMiercoles4"></div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">pan_tool</i> Panel
										</div>
										<div class="col l4 m4 s10">12:30 - 01:00 pm</div>
										<div class="col l1 m1 s2 "></div>

									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">alarm_on</i> Almuerzo
										</div>
										<div class="col l4 m4 s10">01:00 - 02:00 pm</div>

									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">blur_on</i>FERIA AMBIENTAL -
											CONCURSO DE FOTOGRAFÍA
										</div>
										<div class="col l4 m4 s11">02:00 - 03:00 pm</div>
										<div class="col l1 m1 s1 ">
											<i class="material-icons i right">expand_more</i>
										</div>

									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center">
										<div class="col s6">
											<div class="row center act8"></div>
										</div>
										<div class="col s6">
											<div class="row center act9"></div>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">nature_people</i> <u>Conferencia
												magistral</u>
										</div>
										<div class="col l4 m4 s11">04:00 - 05:30 pm</div>
										<div class="col l1 m1 s1 ">
											<i class="material-icons i right">expand_more</i>
										</div>

									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center conf3"></div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">nature</i> Intervalo Ambiental -
											Cultural
										</div>
										<div class="col l4 m4 s11">06:00 - 06:30 pm</div>
										<div class="col l1 m1 s1 "></div>

									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">nature_people</i> <u>Conferencia
												magistral</u>
										</div>
										<div class="col l4 m4 s11">06:30 - 08:00 pm</div>
										<div class="col l1 m1 s1 ">
											<i class="material-icons i right">expand_more</i>
										</div>

									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center conf4"></div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">nature</i> CONFRATERNIZACIÓN
											AMBIENTAL
										</div>
										<div class="col l4 m4 s11">08:30 - 09:30 pm</div>
										<div class="col l1 m1 s1 ">
											<i class="material-icons i right">expand_more</i>
										</div>
									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center">

										<div class="col s3"></div>
										<div class="col s6">
											<div class="row center act10"></div>
										</div>
										<div class="col s3"></div>
									</div>

								</div>
							</li>

						</ul>
					</div>

				</div>
				<!-- D  I  A     J  U  E  V  E  S -->
				<div id="swipe-4" class="col s12 #bdbdbd grey lighten-1"
					style="height: auto; margin-bottom: 2em">
					<div class="container">
						<br /> <br />
						<ul class="collapsible popout" data-collapsible="accordion"
							id="staggered-test4" style="z-index: 10">
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">style</i> Talleres especializados -
											Visitas técnicas 
										</div>
										<div class="col l4 m4 s11">06:30 am - 12:30 pm</div>
										<div class="col l1 m1 s1 ">
											<i class="material-icons i right">expand_more</i>
										</div>

									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center">
										<div class="col s6 visitasJueves"></div>
										<div class="col s6 talleresJueves"></div>
									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">alarm_on</i> Almuerzo
										</div>
										<div class="col l4 m4 s10">12:30 - 02:00 pm</div>

									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">nature_people</i> <u>Conferencia
												magistral</u>
										</div>
										<div class="col l4 m4 s11">02:00 - 03:30 pm</div>
										<div class="col l1 m1 s1 ">
											<i class="material-icons i right">expand_more</i>
										</div>

									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center conf5"></div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">nature</i> Intervalo Ambiental -
											Cultural
										</div>
										<div class="col l4 m4 s11">03:30 - 04:00 pm</div>
										<div class="col l1 m1 s1 "></div>

									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">nature_people</i> <u>Conferencia
												magistral</u>
										</div>
										<div class="col l4 m4 s11">04:00 - 05:30 pm</div>
										<div class="col l1 m1 s1 ">
											<i class="material-icons i right">expand_more</i>
										</div>

									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center conf6"></div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">transfer_within_a_station</i> COPA
											CONEIA
										</div>
										<div class="col l4 m4 s10">05:30 - 09:30 pm</div>

									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center">
										Lugar: <b>LOSAS DEPORTIVAS</b>
									</div>
								</div>
							</li>

						</ul>
					</div>
				</div>

				<!-- D  I  A    V  I  E  R  N  E  S -->
				<div id="swipe-5" class="col s12 #bdbdbd grey lighten-1"
					style="height: auto; margin-bottom: 2em">
					<div class="container">
						<br /> <br />
						<ul class="collapsible popout " data-collapsible="accordion"
							id="staggered-test5" style="z-index: 10">
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">playlist_add_check</i> INGRESO
										</div>
										<div class="col l4 m4 s11">06:30 - 08:00 am</div>
										<div class="col l1 m1 s1 "></div>
									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">mic</i> Ponencias paralelas 
											</div>
										<div class="col l4 m4 s11">8:00 - 10:00 am</div>
										<div class="col l1 m1 s1 ">
											<i class="material-icons i right">expand_more</i>
										</div>

									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center ponenciasViernes1"></div>
									<div class="row center ponenciasViernes2"></div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">hourglass_full</i> Intervalo
											Ambiental - Cultural
										</div>
										<div class="col l4 m4 s11">10:00 - 10:30 am</div>
										<div class="col l1 m1 s1 "></div>

									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">nature_people</i> <u>Conferencia
												magistral</u> - ELECCIÓN DE SEDE CONEIA 2019
										</div>
										<div class="col l4 m4 s11">10:30 am - 12:00 pm</div>
										<div class="col l1 m1 s1 ">
											<i class="material-icons i right">expand_more</i>
										</div>

									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center">
										<div class="col s6">
											<div class="row center conf7"></div>
										</div>
										<div class="col s6">
											<div class="row center act11"></div>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">alarm_on</i> Almuerzo
										</div>
										<div class="col l4 m4 s11">12:00 - 02:00 pm</div>
										<div class="col l1 m1 s1 "></div>
									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header bananin">
									<div class="row center">
										<div class="col l7 m7 s12">
											<i class="material-icons">audiotrack</i>CLAUSURA DEL EVENTO
										</div>
										<div class="col l4 m4 s11">02:00 - 05:00 pm</div>
										<div class="col l1 m1 s1 ">
											<i class="material-icons i right">expand_more</i>
										</div>

									</div>
								</div>
								<div class="collapsible-body">
									<div class="row center">
										<div class="col s3"></div>
										<div class="col s6">
											<div class="row center act12"></div>
										</div>
										<div class="col s3"></div>
									</div>
								</div>
							</li>


						</ul>
					</div>
				</div>

			</div>
			<div class="row center confirmar"
				style="display: none; margin-bottom: 1em; margin-top: 1em">
				<button
					class="btn btn-large #0091ea waves-effect waves-light btn light-blue accent-4">
					Confirmar</button>
			</div>
		
		</div>
		<div class="row center loadin" style="margin-top: 40%; display: none">
			<h2 class="col s12">Horario registrado</h2>
			<br />
			<h5 class="col s12">Redireccionando ...</h5>
		</div>

		<!-- Javascript-->



	</div>
	<div id="modales"></div>
	
	
	<%@include file="../../../jspf/footer.jspf"%>

	<script type="text/javascript">
		$(window).on("load", function() {
			setTimeout(function() {
				$('body').addClass('loaded');
			}, 200);
		})

		$('.progress').fadeOut('fast');
		$('#loader-wrap').fadeOut('fast');
		$('#loader-wrap1').fadeOut('fast');
	</script>




	<script type="text/javascript">
		$(document).ready(function() {

			$('.collapsible').collapsible();
			$('.modal').modal();
					
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
		});


		$("#register").click(function() {
			$.get("inscripcion", null, function(data, status) {
				$("#space").html(data);
			});
		});

		$(".principal").click(function() {
			var link = context_path + "/principal"

			location.href = link;
		})

		$(".programa").click(function() {
			var link = "";
			var rol = $("#rolcito").val();
			if (rol == "administrador") {
				link = context_path + "/programaAdmin";
			} else {
				link = context_path + "/programa";
			}

			location.href = link;
		})

		$(".asistencia").click(function() {
			var link = "";
			var rol = $("#rolcito").val();
			if (rol == "administrador") {
				link = context_path + "/asistenciaAdmin";
			} else {
				link = context_path + "/asistencia";
			}
			location.href = link;
		})

		$(".salir").on("click", function() {
			$.post("logon", {
				op : '2'
			}, function() {
				var link = context_path + "/"

				location.href = link;
			});

		});

		window.onscroll = function() {
			myFunction()
		};

		var header = document.getElementById("myHeader");
		var sticky = header.offsetTop;

		function myFunction() {
			if (window.pageYOffset >= sticky) {
				header.classList.add("sticky");

			} else {
				header.classList.remove("sticky");

			}
		}
	</script>
</body>
</html>
<%
	}
%>