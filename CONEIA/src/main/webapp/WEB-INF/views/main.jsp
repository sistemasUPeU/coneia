
<%
	HttpSession sesion = request.getSession();
	if (sesion.getAttribute("dni") != null) {
		response.sendRedirect("/CONEIA/principal");

	} else {
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!--Global Config-->
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title>CONEIA</title>
<link rel="shortcut icon"
	href="<c:url value='/resources/img/favicon/favicon.ico'></c:url>">
<%-- <link rel="png" href="<c:url value='/resources/img/coneia.png'></c:url>"> --%>

<!-- Global Styles-->
<link href="<c:url value='/resources/css/materialize.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='/resources/js/plugins/dropify/css/dropify.min.css'/>"
	type="text/css" rel="stylesheet" media="screen,projection">

<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css'>
<link
	href="<c:url value='/resources/js/plugins/sweetalert/sweetalert.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lobster+Two"
	rel="stylesheet">

<link rel="stylesheet"
	href="<c:url value='resources/css/custom/menu.css'/>" />


<link
	href="<c:url value='https://fonts.googleapis.com/icon?family=Material+Icons'></c:url>"
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
var gth_context_path = "<%=request.getContextPath()%>";
</script>
<style>
.parallax_img {
	height: 350px;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: 100% auto;
}

@media screen and (max-width: 768px) {
	.parallax_img {
		background-attachment: inherit;
	}
}
</style>
</head>
<body>

	<div id="mobile-collapse-button" class="section"
		style="padding-top: 0; padding-bottom: 0">
		<nav class="#000000 black">
			<div class="nav-wrapper">
				<a href="#!" class="brand-logo"><img class=""
					src="<c:url value="/resources/img/cones.png"/>"
					style="width: 300px; height: 35%; outline-color: none; margin-left: 5%"></img></a>
				<a href="#" data-activates="mobile-demo" class="button-collapse"><i
					class="mdi-navigation-menu"></i></a>
				<ul class="right hide-on-med-and-down">
					<li><a class="home">Home</a></li>
					<li><a class="enrollment">Inscripción</a></li>
					<li><a class="login">Iniciar sesión</a></li>
				</ul>
				<ul class="side-nav" id="mobile-demo">
					<li><a class="home">Home</a></li>
					<li><a class="enrollment">Inscripción</a></li>
					<li><a class="login">Iniciar sesión</a></li>

				</ul>
			</div>
		</nav>
	</div>


	<!-- 	<div class="parallax_img" id="img1"></div> -->

	<div class="row container">
		<div id="space" style="position: relative; padding-top: 5%;">
			<div class="row center" style="padding-top: 10%;">
				<div class="col s12 m6 l6">


					<a class="circulo enrollment waves-effect waves-light "
						style="text-decoration: none; color: black">
						<div class="circulo2">
<!-- 							<img class="contA mdi-action-open-with large icon-demo size-icon" -->
<%-- 								src="<c:url value="/resources/img/cones2.png"/>" --%>
<!-- 								style="width: 50%; margin-left: 10%; margin-top: -5%; outline-color: none"></img> -->
							<i class="contA mdi-action-assignment large icon-demo size-icon"
								style="color: black; margin-top: 30%;"></i>
							<div class="light italic letrinha"
								style="margin-top: -5%; font-family: 'Lobster Two', cursive;">
								<b>Inscripción</b>
							</div>
						</div>
					</a>

				</div>
				<div class="col s12 m6 l6">
					<a class="circulo login waves-effect waves-light "
						style="text-decoration: none; color: black">
						<div class="circulo2">
							<i class="contA mdi-social-group large icon-demo size-icon"
								style="color: black; margin-top: 30%;"></i>
							<div class="light italic letrinha"
								style="margin-top: -5%; font-family: 'Lobster Two', cursive;">
								<b>Iniciar sesión</b>
							</div>
						</div>
					</a>
				</div>
			</div>

		</div>

	</div>

	<!-- 	<div class="parallax-container"> -->
	<!-- 		<div class="parallax"> -->
	<!-- 			<div -->
	<!-- 				style="width: auto; min-width: 100%; position: relative; height: 0px; width: 100%; padding-bottom: 56.25%; margin: 0"> -->
	<!-- 				<video autoplay loop muted plays-inline -->
	<!-- 					style="width: 100%; height: auto; margin: 0; padding: 0; position: absolute; right: 0; bottom: 0;; min-width: 100%;"> -->
	<!-- 					<source -->
	<!-- 						src="http://posgrado.upeu.edu.pe/webmaster/videos/posgrado.mp4"> -->

	<!-- 				</video> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<div style="display: none">
		<form id="loginForm">
			<fieldset>
				<div class="row margin">
					<div class="input-field col s12 center">
						<br /> <br /> <img
							class="home mdi-action-open-with large icon-demo size-icon"
							src="<c:url value="/resources/img/cones2.png"/>"
							style="width: 50%; cursor: pointer; margin-left: 10%; margin-top: -5%; outline-color: none"></img>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s12">
						<i class="mdi-social-person-outline prefix"></i> <input
							class="validate" id="user_dni" type="text"
							onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
							maxlength=8 required aria-required="true" autofocus> <label
							for="user_dni" data-error="Campo vacío" data-success="" class=""
							style="width: 100%">Ingrese su DNI</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<a id="logon" class="btn waves-effect waves-light col s12">Login</a>
					</div>
				</div>
			</fieldset>
		</form>

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
	<script type="text/javascript">
		$(document).ready(function() {
			$('.modal').modal();
			$(".button-collapse").sideNav();

// 			$('.parallax').parallax();
			/* resize the image(s) on page load */
// 			resize_all_parallax();
			
		});
		
	
		
		var url = window.location.href;
		var arr = url.split("/");

		// 		$('#img1').css('background-image',
		// 				'url(' + gth_context_path + '/resources/img/cones3.png)');

		$(".programa").click(function() {
			var link = gth_context_path + "/programa"

			location.href = link;
		})

		$(".home").click(function() {
			var link = gth_context_path + "/"

			location.href = link;
		})

		$(".login").click(
				function() {
					alertify.genericDialog($('#loginForm')[0]).set('selector',
							'input[type="text"]');
				})

		$(".talleres").click(function() {
			$.get("talleres", null, function(data, status) {
				$("#space").html(data);
			});
		})

		$("#logon").click(
				function() {
					var dni = $("#user_dni").val();
					$.get("logon", {
						op : 1,
						dni : dni
					}, function(data) {
						// 				alert(data);
						var login = JSON.parse(data);
						if (login.op == 1) {
							var link = gth_context_path + "/principal"

							location.href = link;
						} else {
							$("#user_dni").next("label").attr('data-error',
									'Número no registrado');
							$("#user_dni").removeClass("valid");
							$("#user_dni").addClass("invalid");
						}
					});
				});

		$("#user_dni").keypress(function(e) {
			console.log(e.which);
			if (e.which == 13) {
				$("#logon").click();
			}
		});

		/* resize the image(s) on page resize */
// 		$(window).on('resize', function() {
// 			resize_all_parallax();
// 		});

		/* keep all of your resize function calls in one place so you don't have to edit them twice (on page load and resize) */
		// 		function resize_all_parallax() {
		// 			var div_id = 'img1'; /* the ID of the div that you're resizing */
		// 			var img_w = 1000; /* the width of your image, in pixels */
		// 			var img_h = 548; /* the height of your image, in pixels */
		// 			resize_parallax(div_id, img_w, img_h);
		// 		}
		/* this resizes the parallax image down to an appropriate size for the viewport */
		// 		function resize_parallax(div_id, img_w, img_h) {
		// 			var div = $('#' + div_id);
		// 			var divwidth = div.width();
		// 			if (divwidth < 769) {
		// 				var pct = (img_h / img_w) * 105;
		// 			} else {
		// 				var pct = 60;
		// 			}
		// 			var newheight = Math.round(divwidth * (pct / 180));
		// 			newheight = newheight + 'px';
		// 			div.height(newheight);
		// 		}
		alertify.genericDialog
				|| alertify.dialog('genericDialog', function() {
					return {
						main : function(content) {
							this.setContent(content);
						},
						setup : function() {
							return {
								focus : {
									element : function() {
										return this.elements.body
												.querySelector(this
														.get('selector'));
									},
									select : true
								},
								options : {
									basic : true,
									maximizable : false,
									resizable : false,
									padding : false
								}
							};
						},
						settings : {
							selector : undefined
						}
					};
				});
	</script>
	<script
		src="<c:url value='/resources/js/plugins/jquery-validation/jquery.validate.min.js'></c:url>"
		type="text/javascript"></script>

	<script
		src="<c:url value='/resources/js/plugins/leanModal.js'></c:url>"
		type="text/javascript"></script>


	<script
		src="<c:url value='/resources/js/plugins/dropify/js/dropify.min.js'></c:url>"
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
<%
	}
%>
