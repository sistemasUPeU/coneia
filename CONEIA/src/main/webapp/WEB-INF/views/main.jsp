<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!--Global Config-->
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title>GTH</title>
<link rel="icon"
	href="<c:url value='/resources/img/favicon/favicon.ico'></c:url>">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<!-- Global Styles-->
<link href="<c:url value='/resources/css/materialize.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css'>
<link rel="stylesheet"
	href="<c:url value='resources/css/custom/menu.css'/>" />

<script>
	var gth_context_path = '${pageContext.request.contextPath}';
</script>

</head>
<body>
	<div id="mobile-collapse-button" class="section">

		<div class="row">

			<div class="col s12 m12 l12">
				<nav class="#33691e light-green darken-4">
				<div class="nav-wrapper">
					<div class="col s12">
						<a href="#!" class="brand-logo">CONEIA</a> <a href="#"
							data-activates="mobile-demo" class="button-collapse"><i
							class="mdi-navigation-menu"></i></a>
						<ul class="right hide-on-med-and-down">
							<li><a onclick="location.reload();">Home</a></li>
							<li><a href="#" class="programa">Programa</a></li>
							<li><a href="javascript.html">Ponentes</a></li>
							<li><a id="register">Registrarse</a></li>
							<li><a href="mobile.html">Sign In</a></li>
						</ul>
						<ul class="side-nav" id="mobile-demo">
							<li><a href="sass.html">Home</a></li>
							<li><a href="#" class="programa">Programa</a></li>
							<li><a href="javascript.html">Ponentes</a></li>
							<li><a href="mobile.html">Registrarse</a></li>
							<li><a href="mobile.html">Sign In</a></li>
						</ul>
					</div>
				</div>
				</nav>
			</div>
		</div>
	</div>
	<div id="space">
		<div class="row center">
			<div class="col s6">
				<button class="circulo waves-effect waves-light programa">Programa
					usuario nuevo</button>
			</div>
			<div class="col s6">
				<button class="circulo waves-effect waves-light talleres">Programa
					usuario registrado</button>
			</div>
		</div>
	</div>
	<footer class="page-footer #33691e light-green darken-4">
	<div class="footer-copyright #33691e light-green darken-4">
		<div class="container">
			Copyright © 2017 <a class="grey-text text-lighten-4" target="_blank">Alpha
				Team</a> All rights reserved. <span class="right">Developed by <a
				class="grey-text text-lighten-4">Alpha Team</a></span>
		</div>
	</div>
	</footer>
	<!-- Javascript-->
	<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='/resources/js/plugins/materialize.min.js'></c:url>"
		type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			$(".button-collapse").sideNav();
		});



		$("#register").click(function() {
			$.get("inscripcion", null, function(data, status) {
				$("#space").html(data);
			});
		});

		$(".programa").click(function() {
			$.get("programa", null, function(data, status) {
				$("#space").html(data);
			});
		})
		
		$(".talleres").click(function() {
			$.get("talleres", null, function(data, status) {
				$("#space").html(data);
			});
		})
	</script>
</body>
</html>
