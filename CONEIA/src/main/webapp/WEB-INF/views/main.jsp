<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!--Global Config-->
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title>CONEIA</title>
<link rel="png"
	href="<c:url value='/resources/img/coneia.png'></c:url>">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
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

<link rel="stylesheet"
	href="<c:url value='resources/css/custom/menu.css'/>" />


<link
	href="<c:url value='http://fonts.googleapis.com/icon?family=Material+Icons'></c:url>"
	rel="stylesheet" type="text/css" />



<link href="<c:url value='/resources/css/style.min.css'></c:url>"
	rel="stylesheet" type="text/css" />

<link
	href="<c:url value='/resources/css/perfect-scrollbar.css'></c:url>"
	rel="stylesheet" type="text/css" />

<link
	href="<c:url value='/resources/materialize-stepper.min.css'></c:url>"
	rel="stylesheet" type="text/css" />

<link
	href="<c:url value='/resources/js/plugins/data-tables/css/jquery.dataTables.min.css'></c:url>"
	rel="stylesheet" type="text/css" />

<link href="<c:url value='/resources/css/alertify.min.css'></c:url>"
	rel="stylesheet" type="text/css" />

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
						<a href="#!" class="brand-logo"><img class=""
							src="<c:url value="/resources/img/coneia5.png"/>"
							style="width: 200px; height: 30%; outline-color: none;"></img></a> <a
							href="#" data-activates="mobile-demo" class="button-collapse"><i
							class="mdi-navigation-menu"></i></a>
						<ul class="right hide-on-med-and-down">
							<li><a class="home">Home</a></li>
							<li><a href="#" class="programa">Programa</a></li>
							<li><a class="enrollment">Inscripción</a></li>
							<li><a class="login">Iniciar sesión</a></li>

						</ul>
						<ul class="side-nav" id="mobile-demo">
							<li><a class="home">Home</a></li>
							<li><a href="#" class="programa">Programa</a></li>
							<li><a class="enrollment">Inscripción</a></li>
							<li><a class="login">Iniciar sesión</a></li>

						</ul>
					</div>
				</div>
				</nav>
			</div>
		</div>
	</div>
	<div id="space"
		style="position: relative; margin-top: 5%; margin-bottom: 5%">
		<div class="row center">
			<div class="col s12 m6 l6">


				<a class="circulo enrollment waves-effect waves-light "
					style="border: 10px inset green; text-decoration: none; color: black">
					<div class="circulo2">
						<img class="contA mdi-action-open-with large icon-demo size-icon"
							src="<c:url value="/resources/img/coneia.png"/>"
							style="width: 50%; margin-left: 10%; margin-top: -5%; outline-color: none"></img>
						<div class="light italic letrinha"
							style="margin-top: -5%; font-family: 'Lobster Two', cursive;">
							<b>Inscripción</b>
						</div>
					</div>
				</a>

			</div>
			<div class="col s12 m6 l6">
				<a class="circulo login waves-effect waves-light "
					style="border: 10px inset green; text-decoration: none; color: black">
					<div class="circulo2">
						<i class="contA mdi-social-group large icon-demo size-icon"
							style="color: green;"></i>
						<div class="light italic letrinha"
							style="margin-top: -5%; font-family: 'Lobster Two', cursive;">
							<b>Iniciar sesión</b>
						</div>
					</div>
				</a>
			</div>
		</div>

		<div id="modal1" class="modal modal-fixed-footer"
			style="width: 40%; height: 200px; margin-top: 15%">
			<div class="modal-header"></div>
			<div class="modal-content #b9f6ca green accent-1">
				<div class="row">
					<div class="input-field col s12">
						<input type="text" id="dni" class="validate"
							placeholder="Escriba su número de dni"
							onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
							maxlength=8 autofocus /> <label for="dni">Escriba su
							número de dni</label>
					</div>


				</div>


			</div>
			<div class="modal-footer">
				<a href="#!"
					class="modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
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
			$('.modal').modal();
			$(".button-collapse").sideNav();
			$('.btn-message').click(function() {
				swal("Here's a message!");
			});
		});
		var url = window.location.href;
		var arr = url.split("/");
		var context_path = arr[0] + "//" + arr[2] + "/CONEIA"

		$(".programa").click(function() {
			var link = context_path + "/programa"

			location.href = link;
		})

		$(".home").click(function() {
			var link = context_path + "/"

			location.href = link;
		})

		$(".login").click(function() {
			var link = context_path + "/login"

			location.href = link;
		})

		$(".talleres").click(function() {
			$.get("talleres", null, function(data, status) {
				$("#space").html(data);
			});
		})
	</script>
	<script
		src="<c:url value='/resources/js/plugins/jquery-validation/jquery.validate.min.js'></c:url>"
		type="text/javascript"></script>	

	<script src="<c:url value='/resources/js/plugins/leanModal.js'></c:url>"
		type="text/javascript"></script>

	<script
		src="<c:url value='/resources/js/perfect-scrollbar.min.js'></c:url>"
		type="text/javascript"></script>
<%-- 	<script src="<c:url value='/resources/js/plugins.min.js'></c:url>" --%>
<!-- 		type="text/javascript"></script> -->
	<script
		src="<c:url value='/resources/js/businessCore/connection.js'></c:url>"
		type="text/javascript"></script>

	<script src="<c:url value='/resources/materialize-stepper.js'></c:url>"
		type="text/javascript"></script>


	<script
		src="<c:url value='/resources/js/businessCore/inscripcion.js'></c:url>"
		type="text/javascript"></script>

	<script
		src="<c:url value='/resources/js/plugins/data-tables/js/jquery.dataTables.min.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='/resources/js/plugins/data-tables/data-tables-script.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='/resources/js/plugins/alertify/alertify.min.js'></c:url>"
		type="text/javascript"></script>
</body>
</html>
