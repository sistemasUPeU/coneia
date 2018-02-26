
<%
	HttpSession sesion = request.getSession();
	if (sesion.getAttribute("dni") == null || sesion.getAttribute("rol") == null) {
		response.sendRedirect(request.getContextPath() + "/");

	} else {

		if (Integer.parseInt("" + sesion.getAttribute("idrol")) == 5) {
			response.sendRedirect(request.getContextPath() + "/admin/waiting");
		} else {
			if (Integer.parseInt("" + sesion.getAttribute("idrol")) == 7) {
				response.sendRedirect(request.getContextPath() + "/admin/asistencia");
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
<link rel="shortcut icon"
	href="<c:url value='/resources/img/favicon/favicon.ico'></c:url>">
<!--Global Config-->
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="png" href="<c:url value='/resources/img/coneia.png'></c:url>">

<!-- Global Styles-->
<link href="<c:url value='/resources/css/materialize.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
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
<link href="<c:url value='/resources/css/style.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
<script>
	var coneia_context_path  = '${pageContext.request.contextPath}';
</script>

<style type="text/css">
.input-field div.error {
	position: relative;
	top: -1rem;
	left: 3rem;
	font-size: 0.8rem;
	color: #e11313;
	-webkit-transform: translateY(0%);
	-ms-transform: translateY(0%);
	-o-transform: translateY(0%);
	transform: translateY(0%);
}

.input-field label.active {
	width: 100%;
}

#modal_changepass {
	width: 30%;
}

@media only screen and (max-width: 600px) {
	#modal_changepass {
		width: 85%;
	}
}

@media only screen and (min-width: 601px) and (max-width: 1100px) {
	#modal_changepass {
		width: 40%;
	}
}
</style>


</head>
<body>
	<input type="hidden" value="${sessionScope.idp}" id="ip" />
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>

	</div>
	<input type="hidden" value="${sessionScope.rol}" id="rolcito" />
	<div id="mobile-collapse-button" class="section" style="padding-top: 0">
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
	<div id="space"
		style="position: relative; margin-top: 10%; margin-bottom: 10%">
		<div class="row center">
			<div class="col s12 prog ">
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
			<div class="col s12 asist">
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

	<div id="modal_changepass" class="modal modal-fixed-footer"
		style="height: 455px;">
		<form class="formValidate" id="formValidate" method="post"
			action="javascript: changePassword();">
			<div class="modal-content modal-form" style="padding: 35px;">
				<br>
				<div style="text-align: center">
					<h5>Cambio de contraseña</h5>
				</div>

				<br>
				<div class="row margin hide">
					<div class="input-field col s12">
						<input class="hide" value="${sessionScope.idp}" id="idper"
							name="idper" />
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<i class="mdi-communication-vpn-key prefix large icon-demo"></i> <input
							id="pass_new" name="pass_new" type="password" class="validate"
							required data-error=".errorTxt3"> <label for="pass_new">Contraseña
							nueva</label>
						<div class="errorTxt3"></div>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<i class="mdi-communication-vpn-key prefix large icon-demo"></i> <input
							id="pass_new_1" name="pass_new_1" type="password"
							class="validate" required data-error=".errorTxt4"> <label
							for="pass_new_1">Repetir contraseña</label>
						<div class="errorTxt4"></div>
					</div>
				</div>

				<div style="text-align: center;">
					<label id="mensaje" style="color: red" style="width: 100%"></label>
				</div>

			</div>


			<div class="modal-footer">
				<button href="#!"
					class="btn modal-action waves-effect waves-green btn-flat submit "
					id="cambiarPass" type="submit"
					style="backgroun-color: rgba(45, 200, 70, 0.53);">Guardar
					cambios</button>

				<!-- 					<button class="btn  waves-light right submit" -->
				<!-- 						type="submit" name="action"> -->
				<!-- 						Submit <i class="mdi-content-send right"></i> -->
				<!-- 					</button> -->

			</div>
		</form>
	</div>
	<div>
		<div class="page-footer #00c853 green accent-4" style="padding: 0;float:left;width:100%;bottom:0;position:fixed" id="foot1">
			<div class="footer-copyright">
				<div class="container" style="color:white">
					Copyright © 2017 <a class="grey-text text-lighten-4" target="_blank">Alpha
					Team</a> All rights reserved. <span class="right" id="foot2">Developed by <a
				class="grey-text text-lighten-4">Alpha Team</a></span>
				</div>
			</div>
		</div>
	</div>
	<!-- Javascript-->
	<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='/resources/js/plugins/materialize.min.js'></c:url>"
		type="text/javascript"></script>

	<script
		src="<c:url value='/resources/js/plugins/jquery-validation/jquery.validate.min.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='/resources/js/plugins/sweetalert/sweetalert.min.js'></c:url>"
		type="text/javascript"></script>
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
		try{
				
				var nombre = "${sessionScope.nombre}";
				var apellidos =  "${sessionScope.apellidos}";

						var s='';
						s +='<img src="<c:url value="/resources/img/user.png"/>" alt="Usuario">';
						s +=nombre.toUpperCase()+", "+apellidos.toUpperCase();
						$(".cgProfile").empty();
						$(".cgProfile").append(s);

			}catch(e){
				
			}
			checkSize();
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
			$.get("inscrito", null, function(data) {
				if (data > 10) {
					$(".prog").css("display", "none");
					$(".asist").css("display", "block");
				} else {
					$(".prog").css("display", "block");
					$(".asist").css("display", "none");
				}
			});

			$('#modal_changepass').modal({
				dismissible : false, // Modal can be dismissed by clicking outside of the
				// modal
				opacity : .5, // Opacity of modal background
				inDuration : 400, // Transition in duration
				outDuration : 200, // Transition out duration
				startingTop : '4%', // Starting top style attribute
				endingTop : '10%', // Ending top style attribute
				ready : function(modal, trigger) { // Callback for Modal open. Modal and
					// trigger parameters available.
				},
				complete : function() {
				} // Callback for Modal close
			});

			var idp = $("#ip").val();

			$.get("checkpass", {
				idpersona : idp
			}, function(data) {
				var data_con = JSON.parse(data);
				var estadopass = data_con.estadopass;

				if (estadopass == 1) {
					//falta cambiar contrase;a
					$("#modal_changepass").modal("open");
				}
			});

		});
		var url = window.location.href;
		var arr = url.split("/");
		var context_path = arr[0] + "//" + arr[2] + "/CONEIA";

		$("#register").click(function() {
			$.get("inscripcion", null, function(data, status) {
				$("#space").html(data);
			});
		});

		document.addEventListener("DOMContentLoaded", function() {
			$('.preloader-background').delay(1700).fadeOut('slow');

			$('.preloader-wrapper').delay(1700).fadeOut();
		});

		$(".programa").click(function() {
			var link = "";
			var rol = $("#rolcito").val();
			if (rol == "administrador") {
				link = coneia_context_path  + "/programaAdmin";
			} else {
				link = coneia_context_path  + "/programa";
			}
			location.href = link;
		});

		$(".principal").click(function() {
			var link = coneia_context_path  + "/principal"

			location.href = link;
		})

		$(".asistencia").click(function() {
			var link = "";
			var rol = $("#rolcito").val();
			if (rol == "administrador") {
				link = coneia_context_path  + "/asistenciaAdmin";
			} else {
				link = coneia_context_path  + "/asistencia";
			}
			location.href = link;
		})

		$(".salir").on("click", function() {
			$.post("logon", {
				op : '2'
			}, function() {
				var link = coneia_context_path  + "/"

				location.href = link;
			});

		});

		$(".talleres").click(function() {
			$.get("talleres", null, function(data, status) {
				$("#space").html(data);
			});
		})

		$(window).on("load", function() {
			window.location.hash = "no-back-button";

			window.location.hash = "Again-No-back-button" //chrome

			window.onhashchange = function() {
				window.location.hash = "";
			}
		});

		function changePassword() {

			var nueva = $("#pass_new_1").val();
			var idpersona = $("#idper").val();

			$.get("changepassword", {
				pass_new_1 : nueva,
				idper : idpersona,
				estado_pass : 1
			}, function(data) {

				if (data == 1) {

					$("#mensaje").text("Se cambió la contraseña")
					setTimeout(function() {
						location.href = coneia_context_path + "/principal";
					}, 2000);

				}
			});
		}
		
		$("#formValidate").validate({
			rules : {

				pass_new : {
					required : true,
					minlength : 5
				},
				pass_new_1 : {
					required : true,
					minlength : 5,
					equalTo : "#pass_new"
				},

			},
			//For custom messages
			messages : {
				pass_new : {
					required : "Ingrese la contraseña",
					minlength : "Ingrese al menos 5 caracteres"
				},
				pass_new_1 : {
					required : "Ingrese la contraseña",
					minlength : "Ingrese al menos 5 caracteres",
					equalTo : "Las contraseñas no coinciden"
				},
			},
			errorElement : 'div',
			errorPlacement : function(error, element) {
				var placement = $(element).data('error');
				if (placement) {
					$(placement).append(error)
				} else {
					error.insertAfter(element);
				}
			}
		});
	</script>
</body>
</html>
<%
	}
		}
	}
%>