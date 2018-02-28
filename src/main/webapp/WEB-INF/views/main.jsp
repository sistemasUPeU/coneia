
<%
	HttpSession sesion = request.getSession();
	if (sesion.getAttribute("dni") != null) {

		response.sendRedirect(request.getContextPath() + "/principal");

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

<!-- Global Styles-->
<link href="<c:url value='/resources/css/materialize.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='/resources/js/plugins/dropify/css/dropify.min.css'/>"
	type="text/css" rel="stylesheet" media="screen,projection">

<!-- <link rel='stylesheet prefetch' -->
<!-- 	href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css'> -->
<link
	href="<c:url value='/resources/css/0.100.2/css/materialize.min.css'/>"
	type="text/css" rel="stylesheet" media="screen,projection">
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
var gth_context_path = '<%=request.getContextPath()%>';
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

	<!-- 	<div id="mobile-collapse-button" class="section" -->
	<!-- 		style="padding-top: 0; padding-bottom: 0"> -->
	<!-- 		<nav class="#000000 black"> -->
	<!-- 			<div class="nav-wrapper"> -->
	<!-- 				<a href="#!" class="brand-logo"><img class="" -->
	<%-- 					src="<c:url value="/resources/img/cones.png"/>" --%>
	<!-- 					style="width: 300px; height: 35%; outline-color: none; margin-left: 5%"></img></a> -->
	<!-- 				<a href="#" data-activates="mobile-demo" class="button-collapse"><i -->
	<!-- 					class="mdi-navigation-menu"></i></a> -->
	<!-- 				<ul class="right hide-on-med-and-down"> -->
	<!-- 					<li><a class="home">Home</a></li> -->
	<!-- 					<li><a class="enrollment">Inscripción</a></li> -->
	<!-- 					<li><a class="login">Iniciar sesión</a></li> -->
	<!-- 				</ul> -->
	<!-- 				<ul class="side-nav" id="mobile-demo"> -->
	<!-- 					<li><a class="home">Home</a></li> -->
	<!-- 					<li><a class="enrollment">Inscripción</a></li> -->
	<!-- 					<li><a class="login">Iniciar sesión</a></li> -->

	<!-- 				</ul> -->
	<!-- 			</div> -->
	<!-- 		</nav> -->
	<!-- 	</div> -->


	<!-- 	<div class="parallax_img" id="img1"></div> -->

	<div class="">
		<div id="space" style="position: relative; padding-top: 1%;">
			<div class="row center" style="padding-top: 10%;">
				<div class="col s12 m6 l6">


					<a class="circulo enrollment waves-effect waves-light "
						style="text-decoration: none; color: black">
						<div class="circulo2">

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


	<div style="display: none">
		<form id="loginForm">

			<div class="row margin">
				<div class="input-field col s12 center">
					<br /> <br /> <img
						class="home mdi-action-open-with large icon-demo size-icon"
						src="<c:url value="/resources/img/cones2.png"/>"
						style="width: 50%; cursor: pointer; margin-left: 10%; margin-top: -5%; outline-color: none"></img>
				</div>
			</div>
			<div class="sign_in" id="sign_in">
				<div class="row margin">
					<div class="input-field col s12">
						<i class="mdi-social-person prefix"></i> <input class="validate"
							id="user_dni" type="text"
							onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
							maxlength=8 required aria-required="true"> <label
							for="user_dni" data-error="Campo vacío" data-success="" class=""
							style="width: 100%">DNI</label>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s12">
						<i class="mdi-communication-vpn-key prefix"></i> <input
							class="validate" id="user_pass" type="password" required
							aria-required="true"> <label for="user_pass"
							data-error="Campo vacío" data-success="" class=""
							style="width: 100%">Contraseña</label>
					</div>
				</div>
				<div style="text-align: center">
					<a href="#" onclick="showChange()">¿Se ha olvidado su
						contraseña?</a>
				</div>
				<div style="text-align: center;">
					<label id="msm" style="color: red" style="width: 100%"></label>
				</div>


				<div class="row">
					<div class="input-field col s12">
						<a id="logon" class="btn waves-effect waves-light col s12">Login</a>
					</div>
				</div>

			</div>
			<div class="restore_password" id="restore_password">

				<div class="row">
					<div class="input-field col s12">
						<i class="mdi-hardware-phone-android prefix"></i> <input
							class="validate" id="user_phone" type="text" name="cuser_phone"
							onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
							onkeydown="checkvalid()" minlength=9 maxlength=9 required>
						<label for="user_phone" style="width: 100%">Celular</label>


					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<i class="mdi-communication-email prefix"></i> <input
							id="user_email" name="cuser_email" type="email" class="validate"
							onkeydown="checkvalid()" required aria-required="true"> <label
							for="user_email">Correo</label>

					</div>



				</div>
				<div style="text-align: center">
					<a href="#" onclick="showChangeSign()">Iniciar sesión</a>
				</div>

				<div class="container" id="loader-wrap" style="width: 50%">
					<p class="center">Procesando</p>
					<div class="progress"
						style="background-color: rgba(255, 64, 64, 0)">

						<div class="indeterminate"></div>
					</div>
				</div>

				<div style="text-align: center;">
					<label id="msm_change" style="color: red" style="width: 100%"></label>
				</div>


				<div class="row">
					<div class="input-field col s12">
						<a id="changePassword"
							class="btn waves-effect waves-light col s12">Enviar solicitud</a>
						<input id="reset" class="hide" type="reset">
					</div>
				</div>

			</div>
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
	<script
		src="<c:url value='/resources/js/plugins/formatter/jquery.formatter.min.js'></c:url>"
		type="text/javascript"></script>

	<script
		src="<c:url value='/resources/js/plugins/jquery-validation/jquery.validate.min.js'></c:url>"
		type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('.modal').modal();
			$(".button-collapse").sideNav();

			// 			$('.parallax').parallax();
			/* resize the image(s) on page load */
			// 			resize_all_parallax();
			$("#user_dni").val("");
			$("#restore_password").hide();
			$('.progress').fadeOut('fast');
			$('#loader-wrap').fadeOut('fast');
			checkSize();

		});

		$(window).on('resize', function() {
			checkSize()
		});

		function checkSize() {
			if ($(window).width() < 600) {
				// your code here

				$("#foot1").addClass("center");
				$("#foot2").addClass("center").removeClass("right");

			} else {

				$("#foot1").removeClass("center");
				$("#foot2").removeClass("center").addClass("right");

			}
		}

		function checkvalid() {

			if ($("#user_email-error").hasClass("active").toString() == "true") {

				$("#user_email-error").css("margin-top", "60px")
				$("#user_email-error").css("font-size", "10px;");
				$("#user_email-error").css("color", "red");
			} else {

				$("#user_email-error").css("margin-top", "35px")
				$("#user_email-error").css("font-size", "7px;");
				$("#user_email-error").css("color", "red");
			}

			if ($("#user_phone-error").hasClass("active").toString() == "true") {

				$("#user_phone-error").css("margin-top", "60px")
				$("#user_phone-error").css("font-size", "12px;");
				$("#user_phone-error").css("color", "red");
			} else {

				$("#user_phone-error").css("margin-top", "35px")
				$("#user_phone-error").css("font-size", "7px;");
				$("#user_phone-error").css("color", "red");
			}

		}

		$("user_email").click(function() {
			checkvalid();
		});

		$("#loginForm").on("click", function() {
			checkvalid();

		})

		function showChange() {

			$("#sign_in").hide().prop('required', false);
			// 			$("#restore_password").removeClass("hide");
			$("#restore_password").show();

		}
		function showChangeSign() {
			$("#sign_in").show()
			// 			$("#restore_password").removeClass("hide");
			$("#restore_password").hide().prop('required', false);
		}

		$("#loginForm").validate({
			rules : {
				cuser_phone : {
					required : true,
					minlength : 9
				},
				cuser_email : {
					required : true
				},

				messages : {
					cuser_phone : {
						required : "Este campo es requerido",
						minlength : "Ingrese al menos 9 caracteres"
					},
					cuser_email : {
						required : "Este campo es requerido",

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
			}
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
					$("#restore_password").hide();
					$("#sign_in").show();
					$("#reset").click()
					Materialize.updateTextFields();
					alertify.genericDialog($('#loginForm')[0]).set('selector',
							'input[type="text"]');

					$("#msm").text("");
				})

		$(".talleres").click(function() {
			$.get("talleres", null, function(data, status) {
				$("#space").html(data);
			});
		})

		$("#logon")
				.click(
						function() {
							var dni = $("#user_dni").val();
							var clave = $("#user_pass").val();

							if (dni == "") {

								if (clave == "") {
									$("#user_pass").next("label").attr(
											'data-error', 'Campo vacío');
									$("#user_dni").next("label").attr(
											'data-error', 'Campo vacío');
									$("#user_dni").next("label").addClass(
											"active")
									$("#user_dni").removeClass("valid");
									$("#user_dni").addClass("invalid");
									$("#user_pass").next("label").addClass(
											"active")
									$("#user_pass").removeClass("valid");
									$("#user_pass").addClass("invalid");
								} else {
									$("#user_dni").next("label").attr(
											'data-error', 'Campo vacío');
									$("#user_dni").next("label").addClass(
											"active")
									$("#user_dni").removeClass("valid");
									$("#user_dni").addClass("invalid");
								}

							} else {

								if (clave == "") {
									$("#user_pass").next("label").attr(
											'data-error', 'Campo vacío');

									$("#user_pass").next("label").addClass(
											"active")
									$("#user_pass").removeClass("valid");
									$("#user_pass").addClass("invalid");
								} else {
									$
											.get(
													"logon",
													{
														op : 1,
														dni : dni,
														clave : clave
													},
													function(data) {
														// 				alert(data);
														var login = JSON
																.parse(data);

														if (login.op == 1) {
															$("#msm").text("");
															$("#msm")
																	.text(
																			'Inscripción no aprobada');
														} else {

															if (login.op == 2) {
																//HA SIDO APROBADO

																var link = gth_context_path
																		+ "/principal"
																location.href = link;

															} else {
																if (login.op == 3) {//ADMINISTRADOR
																	var link = gth_context_path
																			+ "/principal"
																	location.href = link;
																} else {

																	if (login.op == 4) {//HA SIDO APROBADO PERO AUN NO EXISTE UNA ACTIVACION GENERAL
																		var link = gth_context_path
																				+ "/error"
																		location.href = link;
																	} else {
																		$(
																				"#msm")
																				.text(
																						"");
																		$(
																				"#msm")
																				.text(

																				'El usuario o la contraseña son incorrectos');

																		$(
																				"#user_dni")
																				.val(
																						"");
																		$(
																				"#user_pass")
																				.val(
																						"");
																		Materialize
																				.updateTextFields();
																	}

																}

															}

															$("#user_dni")
																	.removeClass(
																			"valid");
															$("#user_dni")
																	.addClass(
																			"invalid");
															$("#user_dni").val(
																	"");
														}
													});
								}

							}

						});

		$("#changePassword")
				.click(
						function() {
							var phone = $("#user_phone").val();
							var email = $("#user_email").val();
							if ($("#user_email").hasClass("valid").toString() == "true"
									&& $("#user_phone").hasClass("valid")
											.toString() == "true") {

								$('#loader-wrap').fadeIn('fast');
								$('.progress').fadeIn('fast');
								$
										.get(
												"resetPassword",
												{
													numero : phone,
													correo : email
												},
												function(data) {

													var converse = JSON
															.parse(data);

													if (converse.res == 1) {
														var idpersona = converse.idpersona;

														var nombre = converse.nombre;
														var apellidos = converse.apellidos;

														var text = "";
														var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

														for (var i = 0; i < 8; i++)
															text += possible
																	.charAt(Math
																			.floor(Math
																					.random()
																					* possible.length));

														var nueva_pass = text;

														//la contrase;a ha sido recuperada, necesita cambiar de contrase;a
														$
																.get(
																		"changepassword",
																		{
																			pass_new_1 : nueva_pass,
																			idper : idpersona,
																			estado_pass : 0
																		},
																		function(
																				data) {

																			if (data == 1) {

																				$
																						.get(
																								"emailRestorePassword",
																								{
																									correo : email,
																									nombre : nombre,
																									apellidos : apellidos,
																									nueva_pass : nueva_pass
																								},
																								function(
																										data) {

																									if (data == 1) {
																										$(
																												'.progress')
																												.delay(
																														800)
																												.fadeOut(
																														'fast');
																										$(
																												'#loader-wrap')
																												.delay(
																														800)
																												.fadeOut(
																														'fast');
																										$(
																												"#msm_change")
																												.text(
																														"");
																										$(
																												"#msm_change")
																												.text(
																														"Una contraseña nueva ha sido enviada a su correo.");
																										setTimeout(
																												function() {
																													location.href = gth_context_path
																															+ "/";
																												},
																												3000);
																									} else {
																										$(
																												'.progress')
																												.delay(
																														200)
																												.fadeOut(
																														'fast');
																										$(
																												'#loader-wrap')
																												.delay(
																														200)
																												.fadeOut(
																														'fast');
																										$(
																												"#msm_change")
																												.text(
																														"");
																										$(
																												"#msm_change")
																												.text(
																														"Error enviando email. Inténtelo más tarde porfavor.");
																										setTimeout(
																												function() {
																													location.href = gth_context_path
																															+ "/";
																												},
																												3000);
																									}
																								});

																			}
																		});

													} else {

														$('.progress').delay(
																200).fadeOut(
																'fast');
														$('#loader-wrap')
																.delay(200)
																.fadeOut('fast');
														$("#msm_change").text(
																"");
														$("#msm_change")
																.text(
																		"Los datos ingresados no existen");
													}

												})
							}

						});

		$("#user_dni").keypress(function(e) {

			if (e.which == 13) {
				$("#logon").click();
			}
		});
		$("#user_pass").keypress(function(e) {

			if (e.which == 13) {
				$("#logon").click();
			}
		});

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

		$(window).on("load", function() {
			window.location.hash = "no-back-button";

			window.location.hash = "Again-No-back-button" //chrome

			window.onhashchange = function() {
				window.location.hash = "";
			}
		})
	</script>


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
