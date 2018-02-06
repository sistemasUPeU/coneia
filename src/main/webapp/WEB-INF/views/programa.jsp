
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="shortcut icon"
	href="<c:url value='/resources/img/favicon/favicon.ico'></c:url>">
<link href="<c:url value='/resources/css/materialize.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="<c:url value='/resources/css/alertify.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lobster+Two"
	rel="stylesheet">
<link href="<c:url value='/resources/css/programa.css'></c:url>"
	rel="stylesheet" type="text/css" />

</head>
<body>
	<input type="hidden" value="${sessionScope.rol}" id="rolcito" />
	<div id="mobile-collapse-button" class="section" style="padding-top: 0">
		<nav class="#000000 black">
		<div class="nav-wrapper">
			<a href="#!" class="brand-logo"><img class=""
				src="<c:url value="/resources/img/cones.png"/>"
				style="width: 300px; height: 35%; outline-color: none; margin-left: 5%"></img></a>
			<a href="#" data-activates="mobile-demo" class="button-collapse"><i
				class="mdi-navigation-menu"></i></a>
			<ul class="right hide-on-med-and-down">
				<li><a class="m principal">Home</a></li>
				<li><a class="m programa">Programa</a></li>
				<li><a class="m asistencia">Asistencia</a></li>
				<li><a class="m dropdown-button" href="#!"
					data-activates="dropdown1"><b>${sessionScope.nombre}
							${sessionScope.paterno} ${sessionScope.materno}</b></a>
					<ul id='dropdown1' class='dropdown-content'>
						<li><a href="#!" class="salir">Salir</a></li>
					</ul></li>
			</ul>
			<ul class="side-nav" id="mobile-demo">
				<li><a class="dropdown-button" href="#!"
					data-activates="dropdown2"><b>${sessionScope.nombre}
							${sessionScope.paterno} ${sessionScope.materno}</b></a>
					<ul id='dropdown2' class='dropdown-content '>
						<li><a href="#!" class="salir">Salir</a></li>
					</ul></li>

				<li><a class="principal">Home</a></li>
				<li><a class="programa">Programa</a></li>
				<li><a class="asistencia">Asistencia</a></li>
			</ul>
		</div>
		</nav>

	</div>

	<div class="row center container">

		<h4>
			<i class="material-icons md-dark md-36">alarm</i><span
				style="font-family: 'Lobster Two', cursive;">Programación
				para el evento </span> CONEIA <span
				style="font-family: 'Lobster Two', cursive;">2018</span>
		</h4>

	</div>
	<div class="row center container" >
		<div class="col s3"> Inscripción:</div>
		<div class="col s6">
			<div class="progress">
				<div class="determinate" style="width: 100%"></div>
			</div>
		</div>
		<div class="col s3" id="progreso"></div>
	</div>

	<div class="row">
		<div class="col s12 #ccff90 light-green accent-1">
			<ul class="tabs  #ccff90 light-green accent-1">
				<li class="tab "><a id="1" class="#ccff90 "
					style="color: #003300; font-weight: bold" href="#swipe-1"
					onclick="Materialize.showStaggeredList('#staggered-test')"><span
						class="nigga">LUNES</span></a></li>
				<li class="tab active"><a
					style="color: #003300; font-weight: bold" id="2" href="#swipe-2"
					onclick="Materialize.showStaggeredList('#staggered-test2')"><span
						class="nigga">MARTES</span></a></li>
				<li class="tab"><a style="color: #003300; font-weight: bold"
					id="3" href="#swipe-3"
					onclick="Materialize.showStaggeredList('#staggered-test3')"><span
						class="nigga">MIÉRCOLES</span></a></li>
				<li class="tab"><a style="color: #003300; font-weight: bold"
					id="4" href="#swipe-4"
					onclick="Materialize.showStaggeredList('#staggered-test4')"><span
						class="nigga">JUEVES</span></a></li>
				<li class="tab"><a style="color: #003300; font-weight: bold"
					id="5" href="#swipe-5"
					onclick="Materialize.showStaggeredList('#staggered-test5')"><span
						class="nigga">VIERNES</span></a></li>
			</ul>
		</div>

		<!-- D I A   L U N E S -->
		<div id="swipe-1" class="col s12 #82b1ff blue accent-1"
			style="height: auto">
			<div class="row container">
				<br /> <br />
				<ul class="collapsible popout" data-collapsible="accordion"
					 style="z-index: 15">
					<li>
						<div class="collapsible-header">
							<div class="row center">
								<div class="col l7 m7 s12">
									<i class="material-icons">rowing</i> Recepción de delegaciones
									y entrega de materiales
								</div>
								<div class="col l4 m4 s11">6:30 - 8:30 am</div>
								<div class="col l1 m1 s1 "></div>
							</div>
						</div>

					</li>
					<li>
						<div class="collapsible-header">
							<div class="row center">
								<div class="col l7 m7 s12">
									<i class="material-icons">highlight</i> Inauguración del evento
								</div>
								<div class="col l4 m4 s11">8:30 - 10:30 am</div>
								<div class="col l1 m1 s1 ">
									<i class="material-icons i right">expand_more</i>
								</div>

							</div>
						</div>
						<div class="collapsible-body">
							<div class="row center">Lugar: CARPA MÓVIL</div>
						</div>
					</li>
					<li>
						<div class="collapsible-header">
							<div class="row center">
								<div class="col l7 m7 s12">
									<i class="material-icons">mic</i> Ponencias paralelas <span
										class="luz" id="blink">(Inscripción)</span>
								</div>
								<div class="col l4 m4 s11">10:30 am - 12:30 pm</div>
								<div class="col l1 m1 s1 ">
									<i class="material-icons i right">expand_more</i>
								</div>

							</div>
						</div>
						<div class="collapsible-body">
							<div class="row center">Horario: 10:30 - 11:30 am</div>
							<div class="row center choose1">Elija una de las tres
								ponencias a las que asistirá</div>
							<div class="row center took1" style="display: none">Ya
								eligió el horario</div>
							<div class="row center bot1" style="display: none">
								<button
									class="1 btn waves-effect waves-light #ff6d00 orange accent-4 again1">
									Volver a elegir <i class="material-icons right">colorize</i>
								</button>
							</div>
							<div class="row center pick1">

								<div class="col s4">
									<div class="row">
										<img
											class="contA mdi-action-open-with large icon-demo size-icon"
											src="<c:url value="/resources/img/coneia.png"/>"
											style="width: 50%;"></img>
									</div>
									<div class="row">
										Tema: <b><c:out value="${lista[0].tema}" /> </b>
									</div>
									<div class="row">
										Ponente:<i> <c:out value="${lista[1].ponente}" /></i>
									</div>
									<div class="row">
										Lugar:
										<c:out value="${lista[0].lugar}" />
									</div>
									<div class="row">
										Cupos: <span class="1" style="color: green; font-weight: bold">
											<c:out value="${lista[0].stock}" />
										</span>
									</div>
									<div class="row">
										<button
											class="btn waves-effect waves-light  #00b0ff light-blue accent-3 b1"
											type="submit">
											<i class="material-icons right">done_all</i>
										</button>

									</div>

								</div>
								<div class="col s4">
									<div class="row">
										<img
											class="contA mdi-action-open-with large icon-demo size-icon"
											src="<c:url value="/resources/img/coneia.png"/>"
											style="width: 50%;"></img>
									</div>
									<div class="row">
										Tema: <b><c:out value="${lista[1].tema}" /> </b>
									</div>
									<div class="row">
										Ponente:<i> <c:out value="${lista[1].ponente}" /></i>
									</div>
									<div class="row">
										Lugar:
										<c:out value="${lista[1].lugar}" />
									</div>
									<div class="row">
										Cupos: <span class="1" style="color: green; font-weight: bold">
											<c:out value="${lista[1].stock}" />
										</span>
									</div>
									<div class="row">
										<button
											class="btn waves-effect waves-light  #00b0ff light-blue accent-3 b2"
											type="submit">
											<i class="material-icons right">done_all</i>
										</button>

									</div>

								</div>
								<div class="col s4">
									<div class="row">
										<img
											class="contA mdi-action-open-with large icon-demo size-icon"
											src="<c:url value="/resources/img/coneia.png"/>"
											style="width: 50%;"></img>
									</div>
									<div class="row">
										Tema: <b><c:out value="${lista[2].tema}" /> </b>
									</div>
									<div class="row">
										Ponente:<i> <c:out value="${lista[2].ponente}" /></i>
									</div>
									<div class="row">
										Lugar:
										<c:out value="${lista[2].lugar}" />
									</div>
									<div class="row">
										Cupos: <span class="1" style="color: green; font-weight: bold">
											<c:out value="${lista[2].stock}" />
										</span>
									</div>
									<div class="row">
										<button
											class="btn waves-effect waves-light  #00b0ff light-blue accent-3 b3"
											type="submit">
											<i class="material-icons right">done_all</i>
										</button>

									</div>

								</div>

							</div>
							<div class="row">
								<div class="divider"></div>
							</div>
							<div class="row center ">
								<i class="material-icons md-18">access_time</i> Horario: 11:30
								am- 12:30 pm
							</div>
							<div class="row center choose2">Elija una de las tres
								ponencias a las que asistirá</div>
							<div class="row center took2" style="display: none">Ya
								eligió el horario</div>
							<div class="row center bot2" style="display: none">
								<button
									class="1 btn waves-effect waves-light #ff6d00 orange accent-4 again2">
									Volver a elegir <i class="material-icons right">colorize</i>
								</button>
								<!-- 									<button -->
								<!-- 										class="1 btn waves-effect waves-light #5c6bc0 indigo lighten-1"> -->
								<!-- 										Ver Asistencia<i class="material-icons right">touch_app</i> -->
								<!-- 									</button> -->

							</div>
							<div class="row center a2" style="display: none"></div>
							<div class="row center pick2">

								<div class="col s4">
									<div class="row">
										<img
											class="contA mdi-action-open-with large icon-demo size-icon"
											src="<c:url value="/resources/img/coneia.png"/>"
											style="width: 50%;"></img>
									</div>
									<div class="row">
										Tema: <b><c:out value="${lista[3].tema}" /> </b>
									</div>
									<div class="row">
										Ponente:<i> <c:out value="${lista[3].ponente}" /></i>
									</div>
									<div class="row">
										Lugar:
										<c:out value="${lista[3].lugar}" />
									</div>
									<div class="row">
										Cupos: <span class="1" style="color: green; font-weight: bold">
											<c:out value="${lista[3].stock}" />
										</span>
									</div>
									<div class="row">
										<button
											class="btn waves-effect waves-light  #00b0ff light-blue accent-3 b4"
											type="submit">
											<i class="material-icons right">done_all</i>
										</button>

									</div>

								</div>
								<div class="col s4">
									<div class="row">
										<img
											class="contA mdi-action-open-with large icon-demo size-icon"
											src="<c:url value="/resources/img/coneia.png"/>"
											style="width: 50%;"></img>
									</div>
									<div class="row">
										Tema: <b><c:out value="${lista[4].tema}" /> </b>
									</div>
									<div class="row">
										Ponente:<i> <c:out value="${lista[4].ponente}" /></i>
									</div>
									<div class="row">
										Lugar:
										<c:out value="${lista[4].lugar}" />
									</div>
									<div class="row">
										Cupos: <span class="1" style="color: green; font-weight: bold">
											<c:out value="${lista[4].stock}" />
										</span>
									</div>
									<div class="row">
										<button
											class="btn waves-effect waves-light  #00b0ff light-blue accent-3 b5"
											type="submit">
											<i class="material-icons right">done_all</i>
										</button>

									</div>

								</div>
								<div class="col s4">
									<div class="row">
										<img
											class="contA mdi-action-open-with large icon-demo size-icon"
											src="<c:url value="/resources/img/coneia.png"/>"
											style="width: 50%;"></img>
									</div>
									<div class="row">
										Tema: <b><c:out value="${lista[5].tema}" /> </b>
									</div>
									<div class="row">
										Ponente:<i> <c:out value="${lista[5].ponente}" /></i>
									</div>
									<div class="row">
										Lugar:
										<c:out value="${lista[5].lugar}" />
									</div>
									<div class="row">
										Cupos: <span class="1" style="color: green; font-weight: bold">
											<c:out value="${lista[5].stock}" />
										</span>
									</div>
									<div class="row">
										<button
											class="btn waves-effect waves-light  #00b0ff light-blue accent-3 b6"
											type="submit">
											<i class="material-icons right">done_all</i>
										</button>

									</div>

								</div>
							</div>

						</div>
					</li>
					<li>
						<div class="collapsible-header">
							<div class="row center">
								<div class="col l7 m7 s12">
									<i class="material-icons">pan_tool</i> Panel
								</div>
								<div class="col l4 m4 s10">12:30 - 1:00 pm</div>
								<div class="col l1 m1 s2 "></div>

							</div>
						</div>
					</li>
					<li>
						<div class="collapsible-header">
							<div class="row center">
								<div class="col l7 m7 s12">
									<i class="material-icons">alarm_on</i> Almuerzo
								</div>
								<div class="col l4 m4 s10">1:00 - 2:30 pm</div>

							</div>
						</div>
					</li>
					<li>
						<div class="collapsible-header ">
							<div class="row center">
								<div class="col l7 m7 s12">
									<i class="material-icons">nature_people</i> <u>Conferencia
										magistral</u>
								</div>
								<div class="col l4 m4 s10">3:00 - 4:00 pm</div>
								<div class="col l1 m1 s2 ">
									<i class="material-icons i md-24">expand_more</i>
								</div>

							</div>
						</div>
						<div class="collapsible-body">
							<div class="row center">
								<div class="col s3"></div>
								<div class="col s6">
									<div class="row">
										<img
											class="contA mdi-action-open-with large icon-demo size-icon"
											src="<c:url value="/resources/img/coneia.png"/>"
											style="width: 50%;"></img>
									</div>
									<div class="row">
										Tema: <b><c:out value="${lista[6].tema }"></c:out></b>
									</div>
									<div class="row">
										Ponente:<i> <c:out value="${lista[6].ponente}" /></i>
									</div>
									<div class="row">
										Lugar:
										<c:out value="${lista[6].lugar}" />
									</div>
									<div class="row">
										Cupos: <span class="1" style="color: green; font-weight: bold">
											No require de inscripción </span>
									</div>
									<div class="row">
										<button
											class="1 btn waves-effect waves-light #00b0ff light-blue accent-3"
											type="submit" disabled>
											<i class="material-icons right">done_all</i>
										</button>
									</div>
								</div>
								<div class="col s3"></div>
							</div>

						</div>
					</li>
					<li>
						<div class="collapsible-header">
							<div class="row center">
								<div class="col l7 m7 s12">
									<i class="material-icons">hourglass_full</i> Intervalo
									Ambiental - Cultural
								</div>
								<div class="col l4 m4 s10">4:00 - 4:30 pm</div>
								<div class="col l1 m1 s2 "></div>

							</div>
						</div>
					</li>
					<li>
						<div class="collapsible-header">
							<div class="row center">
								<div class="col l7 m7 s12">
									<i class="material-icons">nature_people</i> <u>Conferencia
										magistral</u>
								</div>
								<div class="col l4 m4 s10">4:30 - 6:00 pm</div>
								<div class="col l1 m1 s2 ">
									<i class="material-icons i md-24">expand_more</i>
								</div>

							</div>
						</div>
						<div class="collapsible-body">
							<div class="row center">
								<div class="col s3"></div>
								<div class="col s6">
									<div class="row">
										<img
											class="contA mdi-action-open-with large icon-demo size-icon"
											src="<c:url value="/resources/img/coneia.png"/>"
											style="width: 50%;"></img>
									</div>
									<div class="row">
										Tema: <b><c:out value="${lista[7].tema }"></c:out></b>
									</div>
									<div class="row">
										Ponente:<i> <c:out value="${lista[7].ponente}" /></i>
									</div>
									<div class="row">
										Lugar:
										<c:out value="${lista[7].lugar}" />
									</div>
									<div class="row">
										Cupos: <span class="1" style="color: green; font-weight: bold">
											No require de inscripción </span>
									</div>
									<div class="row">
										<button
											class="1 btn waves-effect waves-light #00b0ff light-blue accent-3"
											type="submit" disabled>
											<i class="material-icons right">done_all</i>
										</button>
									</div>
								</div>
								<div class="col s3"></div>
							</div>
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

								<div class="col l1 m1 s2 ">
									<i class="material-icons i md-24">expand_more</i>
								</div>
							</div>
						</div>
						<div class="collapsible-body">
							<div class="row center">
								Lugar:
								<c:out value="${lista[8].lugar}" />
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
								<div class="col l1 m1 s2 ">
									<i class="material-icons i md-24">expand_more</i>
								</div>
							</div>
						</div>
						<div class="collapsible-body">
							<div class="row center">
								Lugar:
								<c:out value="${lista[9].lugar}" />
							</div>
						</div>
					</li>

				</ul>
			</div>
		</div>

		<!-- D  I  A     M  A  R  T  E  S -->
		<div id="swipe-2" class="col s12 #82b1ff blue accent-1"
			style="height: auto">
			<div class="container">
				<br /> <br />
				<ul class="collapsible popout" data-collapsible="accordion"
					id="staggered-test2">
					<li>
						<div class="collapsible-header biselado">
							<div class="row center">
								<div class="col l7 m7 s12">
									<i class="material-icons">style</i> Talleres especializados y
									visitas técnicas <span
										class="luz" id="blink2">(Inscripción)</span>
								</div>
								<div class="col l4 m4 s11">6:30 am - 12:30 pm</div>
								<div class="col l1 m1 s1 ">
									<i class="material-icons i right">expand_more</i>
								</div>

							</div>
						</div>
						<div class="collapsible-body">
						<div class="row">
							<div class="col s6">
								<div class="col s12">
									<div class="row">
										Tema: <b><c:out value="${lista[4].tema}" /> </b>
									</div>
									<div class="row">
										Ponente:<i> <c:out value="${lista[4].ponente}" /></i>
									</div>
									<div class="row">
										Lugar:
										<c:out value="${lista[4].lugar}" />
									</div>
									<div class="row">
										Cupos: <span class="1" style="color: green; font-weight: bold">
											<c:out value="${lista[4].stock}" />
										</span>
									</div>
								
								</div>
									
							
							</div>
							<div class="col s6"></div>
						
						</div>
						
							
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
									<i class="material-icons">transfer_within_a_station</i> GINKANA
									Y COPA CONEIA - PRIMERA FASE
								</div>
								<div class="col l4 m4 s10">6:00 - 9:30 pm</div>

							</div>
						</div>
					</li>

				</ul>
			</div>
		</div>

		<!-- D  I  A     M  I  E  R  C  O  L  E  S -->
		<div id="swipe-3" class="col s12 #82b1ff blue accent-1"
			style="height: auto">
			<div class="container">
				<br /> <br />
				<ul class="collapsible popout " data-collapsible="accordion"
					id="staggered-test3">
					<li>
						<div class="collapsible-header">
							<div class="row center">
								<div class="col l7 m7 s12">
									<i class="material-icons">playlist_add_check</i> INGRESO
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
						<div class="collapsible-header biselado">
							<div class="row center">
								<div class="col l7 m7 s12">
									<i class="material-icons">mic</i> Ponencias paralelas
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
						<div class="collapsible-header biselado">
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
						<div class="collapsible-header biselado">
							<div class="row center">
								<div class="col l7 m7 s12">
									<i class="material-icons">blur_on</i>FERIA AMBIENTAL - CONCURSO
									DE FOTOGRAFÍA - ELECCIÓN DE SEDE XIV CONEIA-2019
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
						<div class="collapsible-header biselado">
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
						<div class="collapsible-header biselado">
							<div class="row center">
								<div class="col l7 m7 s12">
									<i class="material-icons">nature_people</i> <u>Conferencia
										magistral</u> : Calidad de aire en interiores - Rutgers University
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
		<!-- D  I  A     J  U  E  V  E  S -->
		<div id="swipe-4" class="col s12 #82b1ff blue accent-1"
			style="height: auto; z-index: -5">
			<div class="container">
				<br /> <br />
				<ul class="collapsible popout" data-collapsible="accordion"
					id="staggered-test4" style="z-index: 10">
					<li>
						<div class="collapsible-header biselado">
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
						<div class="collapsible-header biselado">
							<div class="row center">
								<div class="col l7 m7 s12">
									<i class="material-icons">nature_people</i> <u>Conferencia
										magistral</u> : Calidad de aire en interiores - Rutgers University
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
						<div class="collapsible-header biselado">
							<div class="row center">
								<div class="col l7 m7 s12">
									<i class="material-icons">nature_people</i> <u>Conferencia
										magistral</u> : Calidad de aire en interiores - Rutgers University
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

		<!-- D  I  A    V  I  E  R  N  E  S -->
		<div id="swipe-5" class="col s12 #82b1ff blue accent-1"
			style="height: 1000px">
			<div class="container">
				<br /> <br />
				<ul class="collapsible popout " data-collapsible="accordion"
					id="staggered-test5" style="z-index: 10">
					<li>
						<div class="collapsible-header">
							<div class="row center">
								<div class="col l7 m7 s12">
									<i class="material-icons">playlist_add_check</i> INGRESO
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
						<div class="collapsible-header biselado">
							<div class="row center">
								<div class="col l7 m7 s12">
									<i class="material-icons">mic</i> Ponencias paralelas
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
	<script
		src="<c:url value='/resources/js/plugins/alertify/alertify.min.js'></c:url>"
		type="text/javascript"></script>
	<script src="<c:url value='/resources/js/programa.js'></c:url>"
		type="text/javascript"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			$('.collapsible').collapsible();
			$(".button-collapse").sideNav({
				accordion : false
			}

			);

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
	</script>
</body>
</html>
<%
	}
%>
