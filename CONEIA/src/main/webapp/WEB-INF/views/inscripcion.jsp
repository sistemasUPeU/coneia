<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<style>
div.container {
	max-width: 1200px
}

div.radio {
	width: 300px;
	height: 30px;
	display: table;
	margin-bottom: 1%;
	margin-top: 2%;
	/*   background:#ccddcc;   */
}

div.radio p {
	text-align: center;
	vertical-align: middle;
	display: table-cell;
}

.special_row {
	width: 50%;
}

#personal {
	width: 80%;
}

.modal {
	max-height: 100%;
	width: 90%;
	height: 200px;
}

@media only screen and (max-width: 600px) {
	div.radio {
		width: 300px;
		height: 50px;
		display: table;
		/*   background:#ccddcc;   */
	}
	div.radio p {
		text-align: left;
		vertical-align: middle;
		display: table-cell;
	}
	div.second {
		margin-bottom: 15%;
	}
	.special_row {
		width: 100%;
		padding: 0px;
	}
	#modal1 #modal2 {
		width: 300px;
		height: 500px;
	}
	#personal {
		width: 100%;
	}
	.carta {
		width: 46px;
	}
}

@media only screen and (min-width: 600px) { /* 	#modal1 #modal2 { */
	/* 		width: 80%; */
	/* 		height: 500px; */
	/* 	} */
}
</style>


</head>
<body>

	<div class="container">
		<div class=" grey-text text-darken-2">

			<div class="row">
				<div class="section col s12 m12 l12">
					<div class="section scrollspy">
						<div class="row">


							<!-- offset-l2 offset-m2 -->
							<div class="container" style="width: 100%">
								<div class="col l12 m12 s12 ">
									<div class="card">
										<div class="card-content" style="height: 800px">
											<ul class="stepper linear horizontal" id="feedbacker"
												style="height: 770px;">

												<li class="step active" id="first">
													<div class="step-title waves-effect" id="first-header">Datos
														Generales</div>
													<div class="step-content">
														<!-- 														<div class="container" -->
														<!-- 															style="width: 100%; padding-top: 1%;"> -->
														<div class="row">
															<div class="col s12 m6 l6 radio">

																<p style="margin-right: 20%;">
																	<input class="with-gap" name="group1" type="radio"
																		id="rd1" value="1" /> <label for="rd1">Inscripción
																		Personal</label>
																</p>



															</div>
															<div class="col s12 m6 l6 radio second">


																<p>
																	<input class="with-gap" name="group1" type="radio"
																		id="rd2" value="2" /> <label for="rd2">Inscripción
																		Delegación</label>
																</p>


															</div>
														</div>
														<!-- 														</div> -->
														<div id="personal" class="container">
															<div class="row">
																<div class="input-field col s12 m6 l6">
																	<i class="material-icons prefix">lock</i> <select
																		id="select" required>
																		<option value="0" disabled selected>Seleccione</option>
																		<option value="1">Estudiante</option>
																		<option value="2">Profesional</option>

																	</select> <label>Perfil</label>
																</div>
																<div class="input-field col s12 m6 l6">
																	<i class="material-icons prefix">account_circle</i> <input
																		id="name" type="text" class="validate" name="name"
																		required disabled autofocus> <label for="name">Nombres</label>
																	<input id="importe_profesional" type="text"
																		class="hide" value="170"> <input
																		id="importe_alumno" type="text" class="hide"
																		value="140">
																</div>


															</div>
															<div class="row">
																<div class="input-field col s12 m6 l6">
																	<i class="material-icons prefix">account_circle</i> <input
																		id="last_name" type="text" class="validate"
																		name="last_name" required disabled> <label
																		for="last_name">Apellidos</label>
																</div>
																<div class="input-field col s12 m6 l6">
																	<i class="material-icons prefix">email</i> <input
																		id="email" name="email" type="email" class="validate"
																		required disabled> <label for="email">Correo</label>
																</div>

															</div>

															<div class="row">
																<div class="input-field col s12 m6 l6">
																	<i class="material-icons prefix">security</i> <input
																		class="validate" id="dni" type="text" name="dni"
																		onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
																		minlength=8 maxlength=8 data-error="" required
																		disabled aria-required="true"> <label
																		for="dni">DNI</label>
																</div>
																<div class="input-field col s12 m6 l6">
																	<i class="material-icons prefix">phone_android</i> <input
																		class="validate" id="phone" type="text" name="phone"
																		onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
																		minlength=9 maxlength=9 data-error="" required
																		aria-required="true" disabled> <label
																		for="phone">Celular</label>
																</div>
															</div>
															<div class="row">

																<div class="input-field col s12 m6 l6" id="div_uni"
																	style="z-index: 2;">
																	<i class="material-icons prefix">account_balance</i> <input
																		type="text" id="university" name="university"
																		class="autocomplete validate univ" required disabled>
																	<label for="university">Universidad</label>
																</div>
																<div class="input-field col s12 m6 l6 hide "
																	id="div_bus" style="z-index: 2;">
																	<i class="material-icons prefix ">business</i> <input
																		type="text" id="business" name="business"
																		class="validate business interchange" required
																		disabled> <label for="business">Empresa
																	</label>
																</div>
																<div class="input-field col s12 m6 l6"
																	style="z-index: 2;">
																	<i class="material-icons prefix">extension</i> <input
																		type="text" id="career" name="career"
																		class="validate autocomplete career" required disabled>
																	<label for="career">Carrera</label>
																</div>
															</div>
														</div>


														<div id="table-datatables">




															<input id="enrollment1" type="text" class="hide">

															<div class="row">
																<div class="col s6 m6 l6 center boton">
																	<button
																		class=" btn-large btn-floating  waves-effect waves-light btn red darken-4 right"
																		id="cleaner" style="margin-top: 12px;">
																		<i class="large material-icons right">delete_sweep</i>
																	</button>
																</div>
																<div class="col s6 m6 l6 center boton">
																	<button
																		class=" btn-floating btn-large waves-effect waves-light light-green darken-1  modal-trigger left"
																		id="add" data-target="modal1"
																		style="margin-top: 12px;">
																		<i class="large material-icons right">add</i>
																	</button>
																</div>
															</div>




															<div id="modal1" class="modal modal-fixed-footer">

																<div class="modal-content modal-form">
																	<h3>Inscripción Personalizada</h3>
																	<h6>Ingrese todos los campos por favor</h6>
																	<br>
																	<div class="row">
																		<div class="input-field col s12 m6 l6">
																			<i class="material-icons prefix">account_circle</i> <input
																				id="ml_name" type="text" name="ml_name"
																				class="validate" required autofocus> <label
																				for="ml_name">Nombres</label><input
																				id="sub_enrollment" type="text" class="hide">
																		</div>
																		<div class="input-field col s12 m6 l6">
																			<i class="material-icons prefix">account_circle</i> <input
																				id="ml_last_name" name="ml_last_name" type="text"
																				class="validate" required> <label
																				for="ml_last_name">Apellidos</label>
																		</div>



																	</div>
																	<div class="row">
																		<div class="input-field col s12 m6 l6">
																			<i class="material-icons prefix">email</i> <input
																				id="ml_email" name="ml_email" type="email"
																				class="validate" required> <label
																				for="ml_email">Correo</label>
																		</div>
																		<div class="input-field col s12 m6 l6">
																			<i class="material-icons prefix">security</i> <input
																				class="validate" id="ml_dni" type="text"
																				name="ml_dni"
																				onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
																				minlength=8 maxlength=8 required
																				aria-required="true"> <label for="ml_dni">DNI</label>
																		</div>

																	</div>
																	<div class="row">

																		<div class="input-field col s12 m6 l6"
																			style="z-index: 2;">
																			<i class="material-icons prefix">account_balance</i>
																			<input type="text" id="ml_university"
																				name="ml_university"
																				class="autocomplete univ validate" required>
																			<label for="ml_university">Universidad</label>
																		</div>
																		<div class="input-field col s12 m6 l6"
																			style="z-index: 2;">
																			<i class="material-icons prefix">extension</i> <input
																				type="text" id="ml_career" name="ml_career"
																				class="validate autocomplete career " required>
																			<label for="ml_career">Carrera</label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="container special_row">

																			<div class="input-field col s12 m12 l12">
																				<i class="material-icons prefix">phone_android</i> <input
																					class="validate" id="ml_phone" type="text"
																					name="ml_phone"
																					onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
																					minlength=9 maxlength=9 data-error="" required
																					aria-required="true"> <label for="ml_phone">Celular</label>
																			</div>

																		</div>
																	</div>


																</div>


																<div class="modal-footer">
																	<a href="#!"
																		class="modal-action modal-close waves-effect waves-green btn-flat "
																		id="modal_cancel">Cancelar</a>

																	<button
																		class=" waves-effect waves-green btn-flat next-step"
																		id="modalconfirm" data-feedback="acceptHandlerModal">Confirmar</button>
																</div>
															</div>

															<div id="modal2" class="modal modal-fixed-footer">

																<div class="modal-content modal-form">
																	<h3>Modificación de datos</h3>
																	<h6>Cambie los que sean necesarios</h6>
																	<br>
																	<div class="row">
																		<div class="input-field col s12 m6 l6">
																			<i class="material-icons prefix">account_circle</i> <input
																				id="ml1_name" type="text" name="ml1_name"
																				class="validate" required autofocus> <label
																				for="ml1_name">Nombres</label><input id="ml_importe"
																				type="text" class="hide" value="130">
																		</div>
																		<div class="input-field col s12 m6 l6">
																			<i class="material-icons prefix">account_circle</i> <input
																				id="ml1_last_name" name="ml1_last_name" type="text"
																				class="validate" required> <label
																				for="ml1_last_name">Apellidos</label>
																		</div>



																	</div>
																	<div class="row">
																		<div class="input-field col s12 m6 l6">
																			<i class="material-icons prefix">email</i> <input
																				id="ml1_email" name="ml1_email" type="email"
																				class="validate" required> <label
																				for="ml1_email">Correo</label>
																		</div>
																		<div class="input-field col s12 m6 l6">
																			<i class="material-icons prefix">security</i> <input
																				class="validate" id="ml1_dni" type="text"
																				name="ml1_dni"
																				onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
																				maxlength=8 required aria-required="true"> <label
																				for="ml1_dni">DNI</label>
																		</div>

																	</div>
																	<div class="row">

																		<div class="input-field col s12 m6 l6"
																			style="z-index: 2;">
																			<i class="material-icons prefix">account_balance</i>
																			<input type="text" id="ml1_university"
																				name="ml1_university"
																				class="autocomplete univ validate" required>
																			<label for="ml1_university">Universidad</label>
																		</div>
																		<div class="input-field col s12 m6 l6"
																			style="z-index: 2;">
																			<i class="material-icons prefix">extension</i> <input
																				type="text" id="ml1_career" name="ml1_career"
																				class="validate autocomplete career " required>
																			<label for="ml1_career">Carrera</label>
																		</div>
																	</div>
																	<div class="container special_row">

																		<div class="input-field col s12 m12 l12">
																			<i class="material-icons prefix">phone_android</i> <input
																				class="validate" id="ml1_phone" type="text"
																				name="ml1_phone"
																				onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
																				minlength=9 maxlength=9 data-error="" required
																				aria-required="true"> <label for="ml1_phone">Celular</label>
																		</div>

																	</div>


																</div>


																<div class="modal-footer">
																	<a href="#!"
																		class="modal-action modal-close waves-effect waves-green btn-flat ">Cancelar</a>

																	<button
																		class=" waves-effect waves-green btn-flat next-step"
																		data-feedback="acceptHandlerModal"
																		id="modal_edit_change">Guardar</button>
																</div>
															</div>





															<div id="ui-alert" class="section">


<!-- 																<div class="row" id="dash_delegacion"> -->

																	<!--WITH Title & ICON-->
																	<!-- 																	<div class="col s12 m3 l3"> -->

																	<!-- 																		<div id="card-alert" class="card cyan darken-1"> -->
																	<!-- 																			<div class="card-content white-text "> -->
																	<!-- 																				<span class="card-title white-text">Persona -->
																	<!-- 																					Nº 67</span> -->
																	<!-- 																				<p>JOEL JAIRO FERNANDEZ MAMANI</p> -->
																	<!-- 																			</div> -->
																	<!-- 																			<div class="card-action cyan lighten-5"> -->
																	<!-- 																				<div class="row"> -->
																	<!-- 																					<div class="col s12 m6 l6 center"> -->
																	<!-- 																						<a href="#" -->
																	<!-- 																							class="white-text btn waves-effect " -->
																	<!-- 																							style="background-color: seagreen;">Eliminar -->
																	<!-- 																							<i class="large material-icons right " -->
																	<!-- 																							style="margin-left: 10px;">delete_sweep</i> -->
																	<!-- 																						</a> -->
																	<!-- 																					</div> -->
																	<!-- 																					<div class="col s12 m6 l6 center"> -->
																	<!-- 																						<a href="#" -->
																	<!-- 																							class="white-text btn waves-effect " -->
																	<!-- 																							style="background-color: seagreen;">Editar <i -->
																	<!-- 																							class="large material-icons right " -->
																	<!-- 																							style="margin-left: 10px;">mode_edit</i></a> -->
																	<!-- 																					</div> -->

																	<!-- 																				</div> -->


																	<!-- 																			</div> -->

																	<!-- 																		</div> -->


																	<!-- 																	</div> -->


<!-- 																</div> -->
															</div>
															
												
															
<!-- 															<div class="container"> -->
<!-- 																<ul class="pagination"> -->
<!-- 																	<li class="disabled"><a href="#!"><i -->
<!-- 																			class="material-icons">chevron_left</i></a></li> -->
<!-- 																	<li class="active"><a href="#!">1</a></li> -->
<!-- 																	<li class="waves-effect"><a href="#!">2</a></li> -->
<!-- 																	<li class="waves-effect"><a href="#!">3</a></li> -->
<!-- 																	<li class="waves-effect"><a href="#!">4</a></li> -->
<!-- 																	<li class="waves-effect"><a href="#!">5</a></li> -->
<!-- 																	<li class="waves-effect"><a href="#!"><i -->
<!-- 																			class="material-icons">chevron_right</i></a></li> -->
<!-- 																</ul> -->

<!-- 															</div> -->
															<div class="container">
																<div id="pagination-long"></div>
<!-- 																<div id="pagination-short"></div> -->
															</div>



															<div id="cuerpo" class="container">
																<div id="contTable" class="row"></div>

															</div>

														</div>

														<div class="step-actions " style="z-index: 1;">

															<button class="waves-effect waves-dark btn next-step"
																id="first-step" data-feedback="nextStepFirstHandler"
																data-validator="validateFirstStep">CONTINUAR</button>
														</div>
													</div>
												</li>





												<li class="step" id="second">
													<div class="step-title waves-effect" id="second-header">Verificación</div>
													<div class="step-content">


														<div id="table-datatables">
															<div id="cuerpo1" class="container" style="width: 100%">
																<div id="reportTable" class="row"></div>



															</div>

														</div>
														<br> <br>
														<div class="step-actions">
															<div class="row">
																<div class="col s12">
																	<button class="waves-effect waves-dark btn next-step"
																		id="second-step">CONTINUAR</button>
																</div>
															</div>
															<div class="row">
																<div class="col s12">
																	<button
																		class="waves-effect waves-dark btn-flat previous-step"
																		id="backFirst">ATRÁS</button>
																</div>
															</div>


														</div>
													</div>
												</li>
												<li class="step">
													<div class="step-title waves-effect" id="third-header">Confirmación</div>
													<form id="lastStepForm" method="POST"
														enctype="multipart/form-data">
														<div class="step-content">
															<div class="row">
																<div class="container special_row">

																	<div class="col s12"
																		style="padding-bottom: 3%; padding-top: 3%;">
																		<div class="input-field col s12 ">
																			<i class="material-icons prefix">payment</i> <input
																				id="voucher" type="text" class="validate" size="10"
																				maxlength="10"
																				<%-- 																			onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" --%>
																			name="voucher"
																				required> <label for="voucher">Nº de
																				operación </label>
																		</div>
																		<!-- 																<div class="col s12 center" style="margin-right: 2em;"> -->
																		<!-- 																	<button type="submit" -->
																		<!-- 																		class="btn waves-effect waves-light center" id="subir"> -->
																		<!-- 																		Enviar <i class="mdi-content-send right"></i> -->
																		<!-- 																	</button> -->
																		<%-- 																								<input type="hidden" name="${_csrf.parameterName}" --%>
																		<%-- 																								value="${_csrf.token}" /> --%>

																		<!-- 																</div> -->

																	</div>
																	<div class="row col s12">
																		<div id="file-upload" class="section center">

																			<div class="row section">

																				<div class="col s12 m12 l12 center">
																					<input type="file" name="file" id="file-input"
																						class="dropify" data-max-file-size="1M"
																						data-errors-position="outside" required />
																					<!-- 																				<input -->
																					<!-- 																				type="text" id="idvac" name="idvac" -->
																					<!-- 																				value="VAC-000004" class="hide" /> -->
																				</div>


																			</div>
																		</div>


																	</div>



																	<!-- 														<form method="post" -->
																	<%-- 															action="/CONEIA/solicitud/archivos?${_csrf.parameterName}=${_csrf.token}" --%>
																	<!-- 															enctype="multipart/form-data" class="col s12 m8 l11" -->
																	<!-- 															id="documentoForm"> -->




																</div>
															</div>
															<div class="step-actions">
																<div class="row">
																	<div class="col s12">
																		<button class="waves-effect waves-dark btn"
																			type="submit" id="accept">Enviar</button>
																	</div>
																</div>
																<div class="row">
																	<div class="col s12">
																		<button class="waves-effect waves-dark btn-flat"
																			id="cancel">Cancelar</button>
																	</div>
																</div>

																<!-- 																<button -->
																<!-- 																	class="waves-effect waves-dark btn-flat previous-step" -->
																<!-- 																	id="backLast">Atrás</button> -->

															</div>

														</div>
													</form>
												</li>
											</ul>
										</div>
									</div>

								</div>
							</div>
							<!-- 							<div class="col l1 m2 s12"></div> -->
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
	<script
		src="<c:url value='/resources/js/businessCore/inscripcion.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='/resources/js/plugins/materialize-pagination.js'></c:url>"
		type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			checkSize()
		});
	
		$(window).on('resize', function() {
			checkSize()
		});

		function checkSize() {
			if ($(window).width() < 600) {
				// your code here

				$(".boton button").removeClass('right');

				$(".boton button").removeClass('left');
				$(".boton button").addClass('center');
				$("#modal1").css("width", "90%");

			} else {

				$("#cleaner").addClass('right');
				$("#add").addClass('left');
				$("#modal1").css("width", "70%");
			}
		}
	</script>






</body>
</html>