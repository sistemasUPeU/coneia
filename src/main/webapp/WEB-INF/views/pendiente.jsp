
<%
	HttpSession sesion = request.getSession();
	if (sesion.getAttribute("dni") == null || sesion.getAttribute("rol") == null) {
		response.sendRedirect(request.getContextPath() + "/");

	} else {
		if(Integer.parseInt(sesion.getAttribute("idrol").toString()) == 7){
			response.sendRedirect(request.getContextPath() + "/admin/asistencia");
		}else{
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
div.container {
	max-width: 1200px
}

.special_row {
	width: 50%;
	margin-top: 3%;
	margin-bottom: 3%;
}

#modal3 {
	width: 78%;
	height: 60%;
}

#modal4 {
	width: 87%;
	height: 100%;
}

@media only screen and (max-width: 600px) {
	.special_row {
		width: 90%;
		padding: 0px;
		margin-top: 5%;
		margin-bottom: 5%;
	}
	#slide-out {
		width: 30%;
	}
	#modal3 {
		width: 95%;
		height: 100%;
	}
	#modal4 {
		width: 98%;
		height: 100%;
	}
}
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
						<div class="container special_row">
							<div class="row">
								<div class="input-field col s12">
									<i class="material-icons prefix">lock</i> <select
										id="get_selected" required>
										<option value="0" disabled selected>Seleccione una opción</option>
										<option value="1">Inscripción personal</option>
										<option value="2">Inscripción por delegación</option>

									</select> <label>Tipo de Inscripción</label>
								</div>
							</div>


						</div>


						<div id="card-widgets">
							<div class="row" id="pizarra"></div>
							<br> <br> <br> <br>


							<div id="modal3" class="modal modal-fixed-footer">

								<div class="modal-content modal-form">
									<h4>Evaluación de Inscripción</h4>


									<div class="row">
										<div class="col s12 m12 l6">
											<div class="col s12 m6 l6" id="column1"></div>
											<div class="col s12 m6 l6" id="column2"></div>
											<div class="row">
												<div class="col s12">
													<div class="input-field col s12" id="div_message">
														<i class="material-icons prefix">mode_edit</i>
														<textarea id="message" class="materialize-textarea"
															disabled></textarea>
														<label for="icon_prefix2">Observación</label>
													</div>
												</div>
											</div>
										</div>

										<div class="col s12 m12 l6" id="picture">

<!-- 											<img class="materialboxed" style="width: 90%; height: 380px;" -->
<%-- 												src="<c:url value="/resources/files/voucher56.jpg"/>" --%>
<!-- 												alt="sample" -->
<!-- 												data-caption="A picture of some deer and tons of trees"> -->




										</div>

									</div>
									<br>


									<div class="row">
										<div class="row" id="trueway">

											<div class="col s12 m12 l6 center boton">
												<button class="waves-effect waves-light btn center"
													style="margin-top: 10px;" id="enviarConfirmacion">
													<i class="medium material-icons right">check_circle</i>Confirmar
												</button>


											</div>
											<div class="col s12 m12 l6 center boton">
												<button
													class="waves-effect waves-light btn red darken-4 center"
													id="observar" style="margin-top: 10px;">
													<i class="medium material-icons right">error</i>Observar
												</button>

											</div>

										</div>
										<div class="container" id="loader-wrap" style="width: 50%">
											<p class="center">Enviando email</p>
											<div class="progress"
												style="background-color: rgba(255, 64, 64, 0)">

												<div class="indeterminate"></div>
											</div>
										</div>

										<div class="container hide" id="falseway">

											<a class="waves-effect waves-light btn left indigo"
												style="margin-right: 10%;" id="back"><i
												class="medium material-icons right">keyboard_return</i>Volver</a>


											<a class="waves-effect waves-light btn red darken-4 right"
												id="enviarObservacion"><i
												class="medium material-icons red darken-4 right">send</i>Enviar</a>

										</div>

									</div>



								</div>



							</div>

							<div id="modal4" class="modal modal-fixed-footer">

								<div class="modal-content modal-form">
									<h4 id="title"></h4>


									<div class="row">
										<div class="col s12 m12 l7">
											<div class="col s12" id="column1d">
												<div id="table-datatables">
													<div id="cuerpo" class="container">
														<div id="tablegroup" class="row"></div>



													</div>

												</div>
											</div>
											<div class="row">
												<div class="col s12">
													<div class="input-field col s12" id="div_message_del">
														<i class="material-icons prefix">mode_edit</i>
														<textarea id="message_del" class="materialize-textarea"
															disabled></textarea>
														<label for="icon_prefix2">Observación</label>
													</div>
												</div>
											</div>
										</div>

										<div class="col s12 m12 l5" id="picture_del">

<!-- 											<img class="materialboxed" style="width: 90%; height: 380px;" -->
<%-- 												src="<c:url value="/resources/files/voucher56.jpg"/>" --%>
<!-- 												alt="sample" -->
<!-- 												data-caption="A picture of some deer and tons of trees"> -->

										</div>

									</div>
									<br>
									<div class="row">
										<div class="row" id="trueway_del">

											<div class="col s12 m12 l6 center boton">
												<button class="waves-effect waves-light btn center"
													style="margin-top: 10px;" id="enviarConfirmacion_del">
													<i class="medium material-icons right">check_circle</i>Confirmar
												</button>


											</div>
											<div class="col s12 m12 l6 center boton">
												<button
													class="waves-effect waves-light btn red darken-4 center"
													id="observar_del" style="margin-top: 10px;">
													<i class="medium material-icons right">error</i>Observar
												</button>

											</div>

										</div>

										<div class="container" id="loader-wrap1" style="width: 50%">
											<p class="center">Enviando email</p>
											<div class="progress"
												style="background-color: rgba(255, 64, 64, 0)">

												<div class="indeterminate"></div>
											</div>
										</div>
										<div class="container hide" id="falseway_del">

											<a class="waves-effect waves-light btn left indigo"
												style="margin-right: 10%;" id="back_del"><i
												class="medium material-icons right">keyboard_return</i>Volver</a>


											<a class="waves-effect waves-light btn red darken-4 right"
												id="enviarObservacion_del"><i
												class="medium material-icons red darken-4 right">send</i>Enviar</a>

										</div>

									</div>



								</div>



							</div>


						</div>





					</div>

				</div>
			</section>
		</div>

	</div>
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
		src="<c:url value='/resources/js/businessCore/admin_confirmar.js'></c:url>"
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
		$('.progress').fadeOut('fast');
		$('#loader-wrap').fadeOut('fast');
		$('#loader-wrap1').fadeOut('fast');
	</script>


</body>
</html>
<%
		}
	}
%>