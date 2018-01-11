
<%
	HttpSession sesion = request.getSession();
	if (sesion.getAttribute("dni") == null) {
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/materialize.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="<c:url value='/resources/css/programa.css'></c:url>"
	rel="stylesheet" type="text/css" />

</head>
<body>
	<div id="mobile-collapse-button" class="section">

		<div class="row">

			<div class="col s12 m12 l12">
				<nav class="#33691e light-green darken-4">
				<div class="nav-wrapper">
					<div class="col s12">
						<a href="#!" class="brand-logo" ><img
							class=""
							src="<c:url value="/resources/img/coneia5.png"/>"
							style="width: 200px; height:30%; outline-color: none;"></img></a>
							<a href="#" data-activates="mobile-demo" class="button-collapse"><i
							class="mdi-navigation-menu"></i></a>
						<ul class="right hide-on-med-and-down">
							<li><a class="principal">Home</a></li>
							<li><a href="#" class="programa">Programa</a></li>
							<li><a href="mobile.html">Asistencia</a></li>
							<li><a class="dropdown-button" href="#!"
								data-activates="dropdown1"><b>${sessionScope.nombre}</b></a>
								<ul id='dropdown1' class='dropdown-content'>
									<li><a href="#!" class="salir">Salir</a></li>

								</ul></li>



						</ul>
						<ul class="side-nav" id="mobile-demo">
							<li><a class="dropdown-button" href="#!"
								data-activates="dropdown2"><b>${sessionScope.nombre}</b></a>
								<ul id='dropdown2' class='dropdown-content '>
									<li><a href="#!" class="salir">Salir</a></li>
								</ul></li>

							<li><a class="principal">Home</a></li>
							<li><a href="#" class="programa">Programa</a></li>
							<li><a href="mobile.html">Asistencia</a></li>

						</ul>
					</div>
				</div>
				</nav>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row center">

			<h4>
				<i class="material-icons md-dark md-36">alarm</i> Programación para
				el evento CONEIA 2018
			</h4>
		</div>
		<div class="row">
			<div class="col s12 #ccff90 light-green accent-1">
				<ul id="tabs-swipe-demo" class="tabs  #ccff90 light-green accent-1">
					<li class="tab "><a id="1" class="#ccff90 "
						style="color: #003300; font-weight: bold" href="#swipe-1"
						onclick="Materialize.showStaggeredList('#staggered-test')"><span class="nigga">LUNES</span></a></li>
					<li class="tab active"><a
						style="color: #003300; font-weight: bold" id="2" href="#swipe-2"
						onclick="Materialize.showStaggeredList('#staggered-test2')"><span class="nigga">MARTES</span></a></li>
					<li class="tab"><a
						style="color: #003300; font-weight: bold" id="3" href="#swipe-3"
						onclick="Materialize.showStaggeredList('#staggered-test3')"><span class="nigga">MIÉRCOLES</span></a></li>
					<li class="tab"><a
						style="color: #003300; font-weight: bold" id="4" href="#swipe-4"
						onclick="Materialize.showStaggeredList('#staggered-test4')"><span class="nigga">JUEVES</span></a></li>
					<li class="tab"><a
						style="color: #003300; font-weight: bold" id="5" href="#swipe-5"
						onclick="Materialize.showStaggeredList('#staggered-test5')"><span class="nigga">VIERNES</span></a></li>
				</ul>
			</div>

			<div id="swipe-1" class="col s12 #82b1ff blue accent-1"
				style="height: 1000px">
				<div class="container">
					<br /> <br />
					<ul class="collapsible popout " data-collapsible="accordion"
						id="staggered-test">
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">rowing</i> Recepción de delegaciones
										y entrega de materiales
									</div>
									<div class="col l4 m4 s10">6:30 - 8:30 am</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>


							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">highlight</i> Inauguración del
										evento
									</div>
									<div class="col l4 m4 s10">8:30 - 10:30 am</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">mic</i> Ponencias paralelas
									</div>
									<div class="col l4 m4 s10">10:30 am - 12:30 pm</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">pan_tool</i> Panel
									</div>
									<div class="col l4 m4 s10">12:30 - 1:00 pm</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">alarm_on</i> Almuerzo
									</div>
									<div class="col l4 m4 s10">1:00 - 2:00 pm</div>

								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">forward</i> Traslado al auditorio
									</div>
									<div class="col l4 m4 s10">2:0 - 3:00 pm</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">nature_people</i> <u>Conferencia
											magistral</u> : Recursos naturales estratégicos, revoluciones
										industriales y sistema de producción - Guatemala
									</div>
									<div class="col l4 m4 s10">3:00 - 4:30 pm</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">nature_people</i> <u>Conferencia
											magistral</u> : Sustentabilidad y competitividad forestal -
										Argentina
									</div>
									<div class="col l4 m4 s10">4:30 - 6:00 pm</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">format_shapes</i> Presentación de
										delegaciones
									</div>
									<div class="col l4 m4 s10">6:00 - 7:00 pm</div>


								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">brightness_3</i> NOCHE CULTURAL
									</div>
									<div class="col l4 m4 s10">7:30 - 9:30 pm</div>

								</div>
							</div>
						</li>

					</ul>
				</div>
			</div>
			<div id="swipe-2" class="col s12 #82b1ff blue accent-1"
				style="height: 1000px">
				<div class="container">
					<br /> <br />
					<ul class="collapsible popout" data-collapsible="accordion"
						id="staggered-test2">
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">playlist_add_check</i>INGRESO
									</div>
									<div class="col l4 m4 s10">6:30 - 7:30 am</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>


							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">style</i> Talleres especializados
									</div>
									<div class="col l4 m4 s10">7:30 am - 12:30 pm</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">alarm_on</i> Almuerzo
									</div>
									<div class="col l4 m4 s10">12:30 - 2:00 pm</div>

								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">layers_clear</i> <u>Concursos</u>
									</div>
									<div class="col l4 m4 s10">2:00 - 6:00 pm</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">transfer_within_a_station</i>
										GINKANA Y COPA CONEIA - PRIMERA FASE
									</div>
									<div class="col l4 m4 s10">6:00 - 9:30 pm</div>

								</div>
							</div>
						</li>

					</ul>
				</div>
			</div>
			<div id="swipe-3" class="col s12 #82b1ff blue accent-1"
				style="height: 1000px">
				<div class="container">
					<br /> <br />
					<ul class="collapsible popout " data-collapsible="accordion"
						id="staggered-test3">
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">playlist_add_check</i> INGRESO -
										Visitas técnicas
									</div>
									<div class="col l4 m4 s10">6:30 - 8:00 am</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>


							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">mic</i> Ponencias paralelas -
										Visitas técnicas
									</div>
									<div class="col l4 m4 s10">8:00 - 10:00 am</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">nature</i> Intervalo ambiental
									</div>
									<div class="col l4 m4 s10">10:00 - 10:30 am</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">mic</i> Ponencias paralelas
									</div>
									<div class="col l4 m4 s10">10:30 am - 12:30 pm</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">alarm_on</i> Almuerzo
									</div>
									<div class="col l4 m4 s10">1:00 - 2:00 pm</div>

								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">blur_on</i>FERIA AMBIENTAL -
										CONCURSO DE FOTOGRAFÍA - ELECCIÓN DE SEDE XIV CONEIA-2019
									</div>
									<div class="col l4 m4 s10">2:00 - 3:00 pm</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">nature_people</i> <u>Conferencia
											magistral</u> : Edificios inteligentes y energías limpias -
										Rutgers University
									</div>
									<div class="col l4 m4 s10">4:30 - 6:00 pm</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">nature_people</i> <u>Conferencia
											magistral</u> : Calidad de aire en interiores - Rutgers
										University
									</div>
									<div class="col l4 m4 s10">6:00 - 7:30 pm</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">nature</i> COMPROMISO AMBIENTAL -
										CONEIA AL DÍA
									</div>
									<div class="col l4 m4 s10">7:30 - 9:30 pm</div>

								</div>
							</div>
						</li>

					</ul>
				</div>

			</div>
			<div id="swipe-4" class="col s12 #82b1ff blue accent-1"
				style="height: 1000px">
				<div class="container">
					<br /> <br />
					<ul class="collapsible popout" data-collapsible="accordion"
						id="staggered-test4">
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">style</i> Talleres especializados -
										Visitas técnicas
									</div>
									<div class="col l4 m4 s10">6:30 am - 12:30 pm</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">alarm_on</i> Almuerzo
									</div>
									<div class="col l4 m4 s10">12:30 - 2:00 pm</div>

								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">nature_people</i> <u>Conferencia
											magistral</u> : Calidad de aire en interiores - Rutgers
										University
									</div>
									<div class="col l4 m4 s10">2:00 - 3:30 pm</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">nature_people</i> <u>Conferencia
											magistral</u> : Calidad de aire en interiores - Rutgers
										University
									</div>
									<div class="col l4 m4 s10">3:30 - 5:00 pm</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">transfer_within_a_station</i> COPA
										CONEIA - FINAL
									</div>
									<div class="col l4 m4 s10">5:00 - 9:30 pm</div>

								</div>
							</div>
						</li>

					</ul>
				</div>
			</div>
			<div id="swipe-5" class="col s12 #82b1ff blue accent-1"
				style="height: 1000px">
				<div class="container">
					<br /> <br />
					<ul class="collapsible popout " data-collapsible="accordion"
						id="staggered-test5">
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">playlist_add_check</i> INGRESO -
										Visitas técnicas
									</div>
									<div class="col l4 m4 s10">6:30 - 8:00 am</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>


							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">mic</i> Ponencias paralelas -
										Visitas técnicas
									</div>
									<div class="col l4 m4 s10">8:00 - 10:00 am</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">nature</i> PROYECCIÓN SOCIAL
									</div>
									<div class="col l4 m4 s10">10:00 am - 12:30 pm</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">alarm_on</i> Almuerzo
									</div>
									<div class="col l4 m4 s10">12:30 - 2:00 pm</div>

								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">audiotrack</i>Clausura del evento,
										Entrega de premios, Presentación de la nueva sede y Firma de
										compromisos
									</div>
									<div class="col l4 m4 s10">2:00 - 5:00 pm</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons">aspect_ratio</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<span>Lorem ipsum dolor sit amet.</span>
							</div>
						</li>


					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 	<footer class="page-footer #33691e light-green darken-4" -->
	<!-- 		style="position:absolute;bottom:0;width:100%"> -->
	<!-- 	<div class="footer-copyright #33691e light-green darken-4"> -->
	<!-- 		<div class="container"> -->
	<!-- 			Copyright © 2017 <a class="grey-text text-lighten-4" target="_blank">Alpha -->
	<!-- 				Team</a> All rights reserved. <span class="right">Developed by <a -->
	<!-- 				class="grey-text text-lighten-4">Alpha Team</a></span> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<!-- 	</footer> -->
	<div>
		<%@include file="../../../jspf/footer.jspf"%>
	</div>
	<!-- Javascript-->
	<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='/resources/js/plugins/materialize.min.js'></c:url>"
		type="text/javascript"></script>

	<script src="<c:url value='/resources/js/programa.js'></c:url>"
		type="text/javascript"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			
			$(".button-collapse").sideNav(
					 {accordion: false}

					);
			$('.collapsible').collapsible();
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
		var url = window.location.href;
		var arr = url.split("/");
		var context_path = arr[0] + "//" + arr[2] + "/CONEIA"

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
			var link = context_path + "/programa"

			location.href = link;
		})

		$(".talleres").click(function() {
			var link = context_path + "/talleres"

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
	</script>
</body>
</html>
<%
	}
%>
