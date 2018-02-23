
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
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Programa - CONEIA</title>
<link rel="shortcut icon"
	href="<c:url value='/resources/img/favicon/favicon.ico'></c:url>">
	
<link href="<c:url value='/resources/css/materialize.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css'>
	<link href="<c:url value='/resources/css/alertify.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Lobster+Two"
	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Cinzel" rel="stylesheet">
<link href="<c:url value='/resources/css/programa.css'></c:url>"
	rel="stylesheet" type="text/css" />
<script>
var coneia_context_path = "<%=request.getContextPath()%>";
	function setUrlPath(url) {
		var s = coneia_context_path + url;
		return s;
	}
</script>
<style>
.sticky {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 100;
}
html {
  height: 100%;
  min-height: 100%;
}
body {
  min-height: 100%;
}
</style>
</head>
<body >
	<input type="hidden" value="${sessionScope.rol}" id="rolcito" />
	<div class="todo" >
		<div id="mobile-collapse-button" class="section"
			style="padding-top: 0">
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
						><b>${sessionScope.nombre}
								${sessionScope.apellidos} </b></a>
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
		<div class="row center container">
			<div class="col s12"><h4>
					<i class="material-icons md-dark md-36 white">alarm</i><span
						style="font-family: 'Lobster Two', cursive;">Programación
						para el evento </span> CONEIA <span
						style="font-family: 'Lobster Two', cursive;">2018</span>
				</h4></div>
		</div>
		<div class="fijo" style="width: 100%; background: white" >
			<div class="row center container">
				
				<div class="col s3">Inscripción:</div>
				<div class="col s6">
					<div class="progress" style="height: 1em; border-radius: 5px;">
						<div class="determinate" style="width: 100%; background: #0091ea"></div>
					</div>
				</div>
				<div class="col s3" id="progreso"></div>
			</div>
			<div class="row center confirmar" style="display: none">
				<button
					class="btn  #0091ea waves-effect waves-light btn light-blue accent-4">
					Confirmar</button>
			</div>


		</div>
		<div class="row #bdbdbd grey lighten-1" style="height: auto;min-height:1000px;margin-bottom:0" id="urusai">
			<div class="col s12 #ccff90 light-green accent-1" id="myHeader">
				<ul class="tabs  #ccff90 light-green accent-1">
					<li class="tab "><a id="one" class="#ccff90 "
						style="color: #003300; font-weight: bold" href="#swipe-1"
						onclick="Materialize.showStaggeredList('#staggered-test')"><span
							class="nigga">LUNES</span></a></li>
					<li class="tab active"><a
						style="color: #003300; font-weight: bold" id="two" href="#swipe-2"
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
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">rowing</i> Recepción de delegaciones
										y entrega de materiales
									</div>
									<div class="col l4 m4 s11">06:30 - 08:30 am</div>
									<div class="col l1 m1 s1 "></div>
								</div>
							</div>

						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">highlight</i> Inauguración del
										evento
									</div>
									<div class="col l4 m4 s11">08:30 - 10:30 am</div>
									<div class="col l1 m1 s1 ">
										<i class="material-icons i right">expand_more</i>
									</div>
									<input type="hidden" id="a" value="<c:out value="${actividadesLunes[2].idtaller}" />"/>
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
											class="luz" id="blink">(Elegir opción)</span>
									</div>
									<div class="col l4 m4 s11">10:30 am - 12:30 pm</div>
									<div class="col l1 m1 s1 ">
										<i class="material-icons i right">expand_more</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">

								<div class="row center ponenciasLunes"></div>
								<div class="row">
									<div class="divider"></div>
								</div>
								<div class="row center ponenciasLunes2"></div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
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
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">alarm_on</i> Almuerzo
									</div>
									<div class="col l4 m4 s10">01:00 - 02:30 pm</div>

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
									<div class="col l4 m4 s10">02:30 - 04:00 pm</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons i md-24">expand_more</i>
									</div>
									
								</div>
							</div>
							<div class="collapsible-body">
								<div class="row center">
									<div class="col s3"></div>
									<div class="col s6 ">
										<div class="row">
											Tema: <b><c:out value="${conferenciaLunes[0].tema }"></c:out></b>
										</div>
										<div class="row">
											Ponente:<i> <c:out value="${conferenciaLunes[0].ponente}" /></i>
										</div>
										<div class="row">
											Lugar:
											<c:out value="${conferenciaLunes[0].lugar}" />
										</div>
										<input type="hidden" id="b" value="<c:out value="${conferenciaLunes[0].idtaller}" />"/>
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
									<div class="col l4 m4 s10">04:00 - 04:30 pm</div>
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
									<div class="col l4 m4 s10">04:30 - 06:00 pm</div>
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
											Tema: <b><c:out value="${conferenciaLunes[1].tema }"></c:out></b>
										</div>
										<div class="row">
											Ponente:<i> <c:out value="${conferenciaLunes[1].ponente}" /></i>
										</div>
										<div class="row">
											Lugar:
											<c:out value="${conferenciaLunes[1].lugar}" />
										</div><input type="hidden" id="c" value="<c:out value="${conferenciaLunes[1].idtaller}" />"/>
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
									<div class="col l4 m4 s10">06:00 - 07:00 pm</div>

									<div class="col l1 m1 s2 ">
										<i class="material-icons i md-24">expand_more</i>
									</div>
								</div>
							</div>
							<div class="collapsible-body">
								<div class="row center">
									Lugar:
									<c:out value="${actividadesLunes[0].lugar}" />
								</div><input type="hidden" id="d" value="<c:out value="${actividadesLunes[0].idtaller}" />"/>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">brightness_3</i> NOCHE CULTURAL
									</div>
									<div class="col l4 m4 s10">07:30 - 09:30 pm</div>
									<div class="col l1 m1 s2 ">
										<i class="material-icons i md-24">expand_more</i>
									</div>
								</div>
							</div>
							<div class="collapsible-body">
								<div class="row center">
									Lugar:
									<c:out value="${actividadesLunes[1].lugar}" />
								</div><input type="hidden" id="e" value="<c:out value="${actividadesLunes[1].idtaller}" />"/>
							</div>
						</li>

					</ul>
				</div>
			</div>

			<!-- D  I  A     M  A  R  T  E  S -->
			<div id="swipe-2" class="col s12 #bdbdbd grey lighten-1"
				style="height: auto; margin-bottom: 2em">
				<div class="container">
					<br /> <br />
					<ul class="collapsible popout" data-collapsible="accordion"
						id="staggered-test2">
						<li>
							<div class="collapsible-header biselado">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">style</i> Talleres especializados y
										visitas técnicas <span class="luz" id="blink2">(Elegir
											opción)</span>
									</div>
									<div class="col l4 m4 s11">06:30 am - 12:30 pm</div>
									<div class="col l1 m1 s1 ">
										<i class="material-icons i right">expand_more</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<div class="row center">
									<h6 style="color: grey;">
										Considere que si elige una <u>visita técnica</u> entonces
										deberá asistir el <b>jueves</b> a un taller especializado; en
										cambio, si elige un <u>taller especializado</u> entonces el <b>jueves</b>
										deberá asistir una visita técnica
									</h6>
								</div>
								<div class="row">
									<input class="with-gap col s6" name="grupo1" type="radio"
										value="vt1" id="vt1" checked /> <label for="vt1">Visitas
										técnicas</label> <input class="with-gap col s6" name="grupo1"
										type="radio" id="tm1" value="tm1" /> <label for="tm1">Talleres
										especializados</label>
								</div>
								<div class="row ">
									<div class="col s6 visitaMartes"></div>
									<div class="col s6 talleresMartes"></div>

								</div>


							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">alarm_on</i> Almuerzo
									</div>
									<div class="col l4 m4 s10">01:00 - 02:30 pm</div>

								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
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
									<div class="col s6">
										<div class="row">
											Tema: <b><c:out value="${concursoMartes[0].tema }"></c:out></b>
										</div>
										<div class="row">
											Lugar:
											<c:out value="${concursoMartes[0].lugar}" />
										</div>
										<div class="row">
											Cupos: <span class="1"
												style="color: green; font-weight: bold"> No require
												de inscripción </span>
										</div><input type="hidden" id="f" value="<c:out value="${concursoMartes[0].idtaller}" />"/>
										<div class="row" style="display: none">
											<button
												class="1 btn waves-effect waves-light #00b0ff light-blue accent-3"
												type="submit" disabled>
												<i class="material-icons right">done_all</i>
											</button>
										</div>
									</div>
									<div class="col s6">
										<div class="row">
											Tema: <b><c:out value="${concursoMartes[1].tema }"></c:out></b>
										</div>

										<div class="row">
											Lugar:
											<c:out value="${concursoMartes[1].lugar}" />
										</div>
										
									</div>
								</div>
								<div class="row center">
									<div class="col s6">
										<div class="row">
											Tema: <b><c:out value="${concursoMartes[2].tema }"></c:out></b>
										</div>
										<div class="row">
											Lugar:
											<c:out value="${concursoMartes[2].lugar}" />
										</div>
										<input type="hidden" id="g" value="<c:out value="${concursoMartes[2].idtaller}" />"/>
									</div>
									<div class="col s6">
										<div class="row">
											Tema: <b><c:out value="${concursoMartes[3].tema }"></c:out></b>
										</div>
										<div class="row">
											Lugar:
											<c:out value="${concursoMartes[3].lugar}" />
										</div>
									
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
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
										<div class="row">
											Tema: <b><c:out value="${concursoMartes[4].tema }"></c:out></b>
										</div>
										<div class="row">
											Lugar:
											<c:out value="${concursoMartes[4].lugar}" />
										</div>
										<input type="hidden" id="h" value="<c:out value="${concursoMartes[4].idtaller}" />"/>
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
					<ul class="collapsible popout " data-collapsible="accordion"
						id="staggered-test3">
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">playlist_add_check</i> INGRESO
									</div>
									<div class="col l4 m4 s10">06:30 - 08:00 am</div>
									<div class="col l1 m1 s1 "></div><input type="hidden" id="i" value="<c:out value="${actividadesMiercoles[3].idtaller}" />"/>
								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header biselado">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">mic</i> Ponencias paralelas <span
											class="luz" id="blink4">(Elegir opción)</span>
									</div>
									<div class="col l4 m4 s11">08:00 - 10:00 am</div>
									<div class="col l1 m1 s1 ">
										<i class="material-icons i right">expand_more</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<div class="row center ponenciasMiercoles1"></div>
								<div class="row">
									<div class="divider"></div>
								</div>
								<div class="row center ponenciasMiercoles2"></div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
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
							<div class="collapsible-header biselado">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">mic</i> Ponencias paralelas <span
											class="luz" id="blink5">(Elegir opción)</span>
									</div>
									<div class="col l4 m4 s11">10:30 am - 12:30 pm</div>
									<div class="col l1 m1 s1 ">
										<i class="material-icons i right">expand_more</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<div class="row center ponenciasMiercoles3"></div>
								<div class="row">
									<div class="divider"></div>
								</div>
								<div class="row center ponenciasMiercoles4"></div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
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
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">alarm_on</i> Almuerzo
									</div>
									<div class="col l4 m4 s10">01:00 - 02:00 pm</div>

								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header biselado">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">blur_on</i>FERIA AMBIENTAL -
										CONCURSO DE FOTOGRAFÍA
									</div>
									<div class="col l4 m4 s11">02:00 - 04:30 pm</div>
									<div class="col l1 m1 s1 ">
										<i class="material-icons i right">expand_more</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<div class="row center">
									<div class="col s6">
										<div class="row">
											Tema: <b><c:out value="${actividadesMiercoles[0].tema }"></c:out></b>
										</div>
										<div class="row">
											Lugar:
											<c:out value="${actividadesMiercoles[0].lugar}" />
										</div>
										
									</div>
									<div class="col s6">
										<div class="row">
											Tema: <b><c:out value="${actividadesMiercoles[1].tema }"></c:out></b>
										</div>
										<div class="row">
											Lugar:
											<c:out value="${actividadesMiercoles[1].lugar}" />
										</div>
										<input type="hidden" id="j" value="<c:out value="${actividadesMiercoles[1].idtaller}" />"/>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header biselado">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">nature_people</i> <u>Conferencia
											magistral</u>
									</div>
									<div class="col l4 m4 s11">04:30 - 06:00 pm</div>
									<div class="col l1 m1 s1 ">
										<i class="material-icons i right">expand_more</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<div class="row center">
									<div class="col s3"></div>
									<div class="col s6">
										<div class="row">
											Tema: <b><c:out value="${conferenciaMiercoles[0].tema }"></c:out></b>
										</div>
										<div class="row">
											Ponente: <b><c:out
													value="${conferenciaMiercoles[0].ponente }"></c:out></b>
										</div>
										<div class="row">
											Lugar:
											<c:out value="${conferenciaMiercoles[0].lugar}" />
										</div>
										<input type="hidden" id="k" value="<c:out value="${conferenciaMiercoles[0].idtaller}" />"/>
									</div>
									<div class="col s3"></div>
								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
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
							<div class="collapsible-header biselado">
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
								<div class="row center">
									<div class="col s3"></div>
									<div class="col s6">
										<div class="row">
											Tema: <b><c:out value="${conferenciaMiercoles[1].tema }"></c:out></b>
										</div>
										<div class="row">
											Ponente: <b><c:out
													value="${conferenciaMiercoles[1].ponente }"></c:out></b>
										</div>
										<div class="row">
											Lugar:
											<c:out value="${conferenciaMiercoles[1].lugar}" />
										</div>
										<input type="hidden" id="l" value="<c:out value="${conferenciaMiercoles[1].idtaller}" />"/>
									</div>
									<div class="col s3"></div>
								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
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

										<div class="row">
											Tema: <b><c:out value="${actividadesMiercoles[2].tema }"></c:out></b>
										</div>
										<div class="row">
											Lugar:
											<c:out value="${actividadesMiercoles[2].lugar}" />
										</div>
										<input type="hidden" id="m" value="<c:out value="${actividadesMiercoles[2].idtaller}" />"/>
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
							<div class="collapsible-header biselado">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">style</i> Talleres especializados -
										Visitas técnicas <span class="luz" id="blink3">(Elegir
											opción)</span>
									</div>
									<div class="col l4 m4 s11">06:30 am - 12:30 pm</div>
									<div class="col l1 m1 s1 ">
										<i class="material-icons i right">expand_more</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<div class="row center">
									<h6 style="color: grey; line-height: 30px;">
										Considere que si elige una <u>visita técnica</u> entonces
										deberá asistir el <b>martes</b> a un taller especializado; en
										cambio, si elige un <u>taller especializado</u> entonces el <b>martes</b>
										deberá asistir a una visita técnica
									</h6>
								</div>
								<div class="row">
									<input class="with-gap col s6" name="grupo2" type="radio"
										id="vt2" value="vt2" /> <label for="vt2">Visitas
										técnicas</label> <input class="with-gap col s6" name="grupo2"
										type="radio" id="tm2" checked /> <label for="tm2" value="tm2">Talleres
										especializados</label>
								</div>
								<div class="row ">
									<div class="col s6 visitasJueves"></div>
									<div class="col s6 talleresJueves"></div>
								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">alarm_on</i> Almuerzo
									</div>
									<div class="col l4 m4 s10">12:30 - 02:00 pm</div>

								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header biselado">
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
								<div class="row center">
									<div class="col s3"></div>
									<div class="col s6">
										<div class="row">
											Tema: <b><c:out value="${conferenciaJueves[0].tema }"></c:out></b>
										</div>
										<div class="row">
											Ponente: <b><c:out
													value="${conferenciaJueves[0].ponente }"></c:out></b>
										</div>
										<div class="row">
											Lugar:
											<c:out value="${conferenciaJueves[0].lugar}" />
										</div>
										<input type="hidden" id="n" value="<c:out value="${conferenciaJueves[0].idtaller}" />"/>
									</div>
									<div class="col s3"></div>
								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
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
							<div class="collapsible-header biselado">
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
								<div class="row center">
									<div class="col s3"></div>
									<div class="col s6">
										<div class="row">
											Tema: <b><c:out value="${conferenciaJueves[1].tema }"></c:out></b>
										</div>
										<div class="row">
											Ponente: <b><c:out
													value="${conferenciaJueves[1].ponente }"></c:out></b>
										</div>
										<div class="row">
											Lugar:
											<c:out value="${conferenciaJueves[1].lugar}" />
										</div>
										<input type="hidden" id="o" value="<c:out value="${conferenciaJueves[1].idtaller}" />"/>
									</div>
									<div class="col s3"></div>
								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
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
									Lugar: LOSAS DEPORTIVAS
								</div>
								<input type="hidden" id="p" value="<c:out value="${conferenciaJueves[2].idtaller}" />"/>
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
							<div class="collapsible-header">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">playlist_add_check</i> INGRESO
									</div>
									<div class="col l4 m4 s11">06:30 - 08:00 am</div>
									<div class="col l1 m1 s1 "></div>
								</div><input type="hidden" id="q" value="<c:out value="${actividadesViernes[2].idtaller}" />"/>
							</div>
						</li>
						<li>
							<div class="collapsible-header biselado">
								<div class="row center">
									<div class="col l7 m7 s12">
										<i class="material-icons">mic</i> Ponencias paralelas <span
											class="luz" id="blink6">(Elegir opción)</span>
									</div>
									<div class="col l4 m4 s11">8:00 - 10:00 am</div>
									<div class="col l1 m1 s1 ">
										<i class="material-icons i right">expand_more</i>
									</div>

								</div>
							</div>
							<div class="collapsible-body">
								<div class="row center ponenciasViernes1"></div>
								<div class="row">
									<div class="divider"></div>
								</div>
								<div class="row center ponenciasViernes2"></div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
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
							<div class="collapsible-header">
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
										<div class="row">
											Tema: <b><c:out value="${conferenciaViernes[0].tema }"></c:out></b>
										</div>
										<div class="row">
											Lugar:
											<c:out value="${conferenciaViernes[0].lugar}" />
										</div>
										<input type="hidden" id="r" value="<c:out value="${conferenciaViernes[0].idtaller}" />"/>
									</div>
									<div class="col s6">
										<div class="row">
											Tema: <b><c:out value="${actividadesViernes[0].tema }"></c:out></b>
										</div>
										<div class="row">
											Lugar:
											<c:out value="${actividadesViernes[0].lugar}" />
										</div>
										
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
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
							<div class="collapsible-header">
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
										<div class="row">
											Tema: <b><c:out value="${actividadesViernes[1].tema }"></c:out></b>
										</div>
										<div class="row">
											Lugar:
											<c:out value="${actividadesViernes[1].lugar}" />
										</div>
										<input type="hidden" id="s" value="<c:out value="${actividadesViernes[1].idtaller}" />"/>
									</div>
									<div class="col s3"></div>
								</div>
							</div>
						</li>


					</ul>
				</div>
			</div>

		</div>
		<div class="row center confirmar #bdbdbd grey lighten-1"
			style="display: none; margin-bottom: 1em; margin-top: 1em">
			<button
				class="btn btn-large #0091ea waves-effect waves-light btn light-blue accent-4">
				Confirmar</button>
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
	</div>
	<div class="row center loadin" style="margin-top: 20%; display: none">
		<h2 class="col s12" style="font-family:'Cinzel', serif;">Horario registrado</h2>
		<br />
		<h5 class="col s12">Redireccionando ...</h5>
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
	<script
		src="<c:url value='/resources/js/plugins/floatThead/jquery.floatThead.min.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='/resources/js/plugins/floatThead/jquery.floatThead-slim.min.js'></c:url>"
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
				console.error("error al listar info : "+e);
			}
			checkSize();
			$.get("inscrito",null,function(data){
				if(data>10){
					var link = context_path + "/principal"

					location.href = link;
				}
			})
			
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
		$(window).on('resize', function() {
			checkSize()
		});

		function checkSize() {
			if ($(window).width() < 600) {
				// your code here
			
				$("#foot1").addClass("center");
				$("#foot2").addClass("center").removeClass("right");
				$("#foot1").css("padding","5px");

			} else {

				$("#foot1").removeClass("center");
				$("#foot2").removeClass("center").addClass("right");
				$("#foot1").css("padding","15px");
			}
		}
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

		window.onscroll = function() {
			myFunction()
		};

		var header = document.getElementById("myHeader");
		var sticky = header.offsetTop;

		function myFunction() {
			if (window.pageYOffset>=sticky) {
				header.classList.add("sticky");
				$("#urusai").css("padding-top","9%")
			} else {
				header.classList.remove("sticky");
				$("#urusai").css("padding-top","0%");
			}
		}
	</script>
</body>
</html>
<%
	}
%>
