
<%
	HttpSession sesion = request.getSession();
	if (sesion.getAttribute("dni") == null || sesion.getAttribute("rol") == null) {
		response.sendRedirect(request.getContextPath() + "/");

	} else {
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="../../../jspf/general.jspf"%>

<style>
#responsive_row {
	width: 80%
}

.special_row {
	width: 50%;
}

@media only screen and (max-width: 600px) {
	#responsive_row {
		width: 100%
	}
	.special_row {
		width: 100%;
		padding: 0px;
	}
}
f
</style>

</head>
<body>
	<%@include file="../../../jspf/header.jspf"%>
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
	</div>
	<div id="main">
		<div class="wrapper">
			<%@include file="../../../jspf/aside_left.jspf"%>
			<section id="content">

				<div class="container" style="width: 95%;">
					<div class="section">
						<div class="container" id="responsive_row"
							style="margin-top: 37px; margin-bottom: 30px;">
							<div class="row" style="margin-top: 15px;">
								<div class="col s12 m12 l8">
									<div class="input-field col s12">
										<i class="material-icons prefix">lock</i> <select id="change"
											required>
											<option value="0" disabled selected>Seleccione una opción</option>
											<option value="1">Inscripción personal</option>
											<option value="2">Inscripción por delegación</option>

										</select> <label>Tipo de Inscripción</label>
									</div>
								</div>
								<div class="col s12 m12 l4 center">
									<button
										class=" center waves-effect waves-light btn red darken-4 center"
										id="clean" style="margin-top: 12px;">
										<i class="medium material-icons red darken-4 right">delete_sweep</i>Limpiar
									</button>
								</div>
							</div>


						</div>
						<div id="table-datatables">
							<div id="cuerpo" class="container" style="width: 100%">
								<div id="tableaceptados" class="row"></div>



							</div>

						</div>

						<div id="modal8" class="modal modal-fixed-footer"
							style="width: 65%; height: 100%;">

							<div class="modal-content modal-form">



								<div class="container" id="vervoucher" style="width: 75%"></div>

								<br>
							</div>


							<div class="modal-footer">
								<a href="#!"
									class="modal-action modal-close waves-effect waves-green btn-flat "
									id="modal_cancel">Cancelar</a> <a href="#!"
									class="modal-action modal-close waves-effect waves-green btn-flat "
									id="download">Descargar</a>

							</div>
						</div>
						<div id="modal9" class="modal modal-fixed-footer"
							style="width: 65%; height: 100%;">
							<form id="formValidate" method="get" class="formValidate" action="">
								<div class="modal-content modal-form">

									<input id="idpersona" class="hide">
									<input id="importe" class="hide">

									<div class="row">
										<div class="input-field col s12 m6 l6">
											<i class="material-icons prefix">account_circle</i> <input
												id="name" type="text" name="name" class="validate" required
												autofocus> <label for="name">Nombres</label>
										</div>
										<div class="input-field col s12 m6 l6">
											<i class="material-icons prefix">account_circle</i> <input
												id="last_name" name="last_name" type="text" class="validate"
												required> <label for="last_name">Apellidos</label>
										</div>



									</div>
									<div class="row">
										<div class="input-field col s12 m6 l6">
											<i class="material-icons prefix">email</i> <input id="email"
												name="email" type="text" pattern=".+@.+" class="validate"
												required> <label for="email">Correo</label>
										</div>
										<div class="input-field col s12 m6 l6">
											<i class="material-icons prefix">security</i> <input
												class="validate" id="dni" type="text" name="dni"
												onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
												minlength=8 maxlength=8 required aria-required="true">
											<label for="dni">DNI</label>
										</div>

									</div>
									<div class="row">

										<div class="input-field col s12 m6 l6" style="z-index: 2;">
											<i class="material-icons prefix">account_balance</i> <input
												type="text" id="universidad" name="universidad"
												class="autocomplete univ validate" required> <label
												for="universidad">Universidad</label>
										</div>
										<div class="input-field col s12 m6 l6" style="z-index: 2;">
											<i class="material-icons prefix">extension</i> <input
												type="text" id="carrera" name="carrera"
												class="validate autocomplete career " required> <label
												for="carrera">Carrera</label>
										</div>
									</div>
									<div class="row">
										<div class="container special_row">

											<div class="input-field col s12 m12 l12">
												<i class="material-icons prefix">phone_android</i> <input
													class="validate" id="phone" type="text" name="phone"
													onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
													minlength=9 maxlength=9 data-error="" required
													aria-required="true"> <label for="phone">Celular</label>
											</div>

										</div>
									</div>
								</div>

								<div class="modal-footer">
									<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat "
										id="modal_cancel">Cancelar</a> <button
										class="waves-effect waves-green btn-flat " id="savechanges"
										type="submit">Guardar Cambios</button>

								</div>
							</form>
						</div>


					</div>


				</div>
			</section>
		</div>

	</div>
	<br>
	<br>
	<br>


	<%@include file="../../../jspf/footer.jspf"%>
	<!-- chartist -->

	<script
		src="<c:url value='/resources/js/plugins/chartist-js/chartist.min.js'></c:url>"
		type="text/javascript"></script>
	<!-- masonry -->
	<script
		src="<c:url value='/resources/js/plugins/masonry.pkgd.min.js'></c:url>"
		type="text/javascript"></script>

	<!-- imagesloaded -->
	<script
		src="<c:url value='/resources/js/plugins/imagesloaded.pkgd.min.js'></c:url>"
		type="text/javascript"></script>

	<!-- magnific-popup -->
	<script
		src="<c:url value='/resources/js/plugins/magnific-popup/jquery.magnific-popup.min.js'></c:url>"
		type="text/javascript"></script>

	<script
		src="<c:url value='/resources/js/businessCore/aceptado.js'></c:url>"
		type="text/javascript"></script>

	<script type="text/javascript">
		$(window).on("load", function() {
			setTimeout(function() {
				$('body').addClass('loaded');
			}, 200);
		})

		$(document).ready(function() {

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
	</script>


</body>
</html>
<%
	}
%>