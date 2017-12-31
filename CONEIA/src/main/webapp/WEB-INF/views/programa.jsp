<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="<c:url value='/resources/css/programa.css'></c:url>"
	rel="stylesheet" type="text/css" />
</head>
<body>
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
					<li class="tab col s3"><a id="1" class="#ccff90 "
						style="color: #003300; font-weight: bold" href="#swipe-1"
						onclick="Materialize.showStaggeredList('#staggered-test')">LUNES</a></li>
					<li class="tab col s3 active"><a
						style="color: #003300; font-weight: bold" id="2" href="#swipe-2"
						onclick="Materialize.showStaggeredList('#staggered-test2')">MARTES</a></li>
					<li class="tab col s3"><a
						style="color: #003300; font-weight: bold" id="3" href="#swipe-3"
						onclick="Materialize.showStaggeredList('#staggered-test3')">MIÉRCOLES</a></li>
					<li class="tab col s3 "><a
						style="color: #003300; font-weight: bold" id="4" href="#swipe-4"
						onclick="Materialize.showStaggeredList('#staggered-test4')">JUEVES</a></li>
					<li class="tab col s3 "><a
						style="color: #003300; font-weight: bold" id="5" href="#swipe-5"
						onclick="Materialize.showStaggeredList('#staggered-test5')">VIERNES</a></li>
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
										<i class="material-icons">playlist_add_check</i> INGRESO - Visitas
										técnicas
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
			<div id="swipe-4" class="col s12 #82b1ff blue accent-1" style="height: 1000px">
				<div class="container" >
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
										<i class="material-icons">playlist_add_check</i> INGRESO - Visitas
										técnicas
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
										<i class="material-icons">audiotrack</i>Clausura del evento, Entrega de premios, Presentación de la nueva sede y Firma de compromisos
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


	<script src="<c:url value='/resources/js/programa.js'></c:url>"
		type="text/javascript"></script>
</body>
</html>