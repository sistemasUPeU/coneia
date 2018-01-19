
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
<title>Principal</title>
<!--Global Config-->
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="png" href="<c:url value='/resources/img/coneia.png'></c:url>">

<!-- Global Styles-->
<link href="<c:url value='/resources/css/materialize.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
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
<link rel="stylesheet"
	href="<c:url value='resources/css/custom/principal.css'/>" />

<script>
	var gth_context_path = '${pageContext.request.contextPath}';
</script>
</head>
<body>
<input type="hidden" value="${sessionScope.rol}" id="rolcito" />
	<div id="mobile-collapse-button" class="section">

		<div class="row">

			<div class="col s12 m12 l12">
				<nav class="#33691e light-green darken-4">
				<div class="nav-wrapper">
					<div class="col s12">
						<a href="#!" class="brand-logo"><img class=""
							src="<c:url value="/resources/img/coneia5.png"/>"
							style="width: 200px; height: 30%; outline-color: none;"></img></a> <a
							href="#" data-activates="mobile-demo" class="button-collapse"><i
							class="mdi-navigation-menu"></i></a>
						<ul class="right hide-on-med-and-down">
							<li><a class="principal">Home</a></li>
							<li><a class="programa">Programa</a></li>
							<li><a class="asistencia">Asistencia</a></li>
							<li><a class="dropdown-button" href="#!"
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
				</div>
				</nav>
			</div>
		</div>
	</div>
	<div id="space"
		style="position: relative; margin-top: 10%; margin-bottom: 10%">
		<div class="row center">
			<div class="col s12 ">
				<div class="row">
					<h6>Aquí se encuentra la programación del evento CONEIA 2018 y
						además usted podrá elegir los talleres, ponencias o conferencias a
						los que puede asistir.</h6>
				</div>

				<div class="circulo waves-effect waves-light programa">
					<div class="circulo2">
						<div class="row">
							<div class="col s12">
								<i class="fa fa-graduation-cap" aria-hidden="true"></i>
							</div>

						</div>
						<div class="row">
							<div class="light italic letrinha s12"
								style="margin-top: -5%; font-family: 'Lobster Two', cursive;">
								<b>Programación</b>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="col s12 ">
				<div class="row">
					<h6>Aquí se irá mostrando los talleres, ponencias o
						conferencias en las que usted participó para la elaboración de su
						correspondiente certificado.</h6>
				</div>
				<a class="circulo asistencia waves-effect waves-light "
					style="text-decoration: none; color: black">
					<div class="circulo2">
						<div class="row">
							<div class="col s12">
								<i class="fa fa-user-plus s6" aria-hidden="true"></i> <i
								class="fa fa-user-times s6" aria-hidden="true"></i>
							</div>
						</div>

						<div class="light italic letrinha"
							style="margin-top: -5%; font-family: 'Lobster Two', cursive;">
							<b>Asistencia</b>
						</div>
					</div>
				</a>
			</div>
		</div>




	</div>


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
		});
		var url = window.location.href;
		var arr = url.split("/");
		var context_path = arr[0] + "//" + arr[2] + "/CONEIA"

		$("#register").click(function() {
			$.get("inscripcion", null, function(data, status) {
				$("#space").html(data);
			});
		});


		$(".programa").click(function() {
			var link="";
			var rol =  $("#rolcito").val();
			if(rol=="administrador"){
				link = context_path + "/programaAdmin";
				}else{
					 link = context_path + "/programa";
					}
			location.href = link;
		});

		$(".principal").click(function() {
			var link = context_path + "/principal"

			location.href = link;
		})

		$(".asistencia").click(function() {
			var link="";
			var rol =  $("#rolcito").val();
			if(rol=="administrador"){
				link = context_path + "/asistenciaAdmin";
				}else{
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

		$(".talleres").click(function() {
			$.get("talleres", null, function(data, status) {
				$("#space").html(data);
			});
		})
	</script>
</body>
</html>
<%
	}
%>