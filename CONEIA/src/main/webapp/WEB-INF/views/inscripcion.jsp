<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>




</head>
<body>

	<div class="container">
		<div class=" grey-text text-darken-2">

			<div class="row">
				<div class="section col s12 m9 l12">
					<div class="section scrollspy">
						<div class="row">
							<div class="col s12 light italic letrinha center"
								style="margin-top: -5%; font-family: 'Lobster Two', cursive; font-size: 6em">
								<b>Inscripción</b>
							</div>

							<!-- offset-l2 offset-m2 -->
							<div class="container" style="width: 80%">
								<div class="col l12 m12 s12 ">
									<div class="card">
										<div class="card-content">
											<ul class="stepper linear horizontal" id="feedbacker">

												<li class="step active" id="first">
													<div class="step-title waves-effect">Datos Generales</div>
													<div class="step-content">
														<div class="row">
															<div class="col s12 m6 offset-l3 offset-m1 "
																style="display: -webkit-inline-box; margin-bottom: 5%">

																<p style="margin-right: 15%;">
																	<input class="with-gap" name="group1" type="radio"
																		id="rd1" value="1" /> <label for="rd1">Inscripción
																		Personal</label>
																</p>

																<p>
																	<input class="with-gap" name="group1" type="radio"
																		id="rd2" value="2" /> <label for="rd2">Inscripción
																		por delegación</label>
																</p>


															</div>
														</div>
														<div id="personal">
															<div class="row">
																<div class="input-field col s6">
																	<i class="material-icons prefix">account_circle</i> <input
																		id="name" type="text" class="validate" name="name"
																		required> <label for="name" data-error="campo requerido">Nombres</label> <input
																		id="enrollment" type="text" class="hide">
																</div>
																<div class="input-field col s6">
																	<i class="material-icons prefix">email</i> <input
																		id="email" name="email" type="email" class="validate"
																		required> <label for="email">Correo</label>
																</div>

															</div>
															<div class="row">
																<div class="input-field col s6">
																	<i class="material-icons prefix">account_circle</i> <input
																		id="last_name" type="text" class="validate"
																		name="last_name" required> <label
																		for="last_name">Apellidos</label>
																</div>

																<div class="input-field col s6" style="z-index: 2;">
																	<i class="material-icons prefix">account_balance</i> <input
																		type="text" id="university" name="university"
																		class="autocomplete univ" required> <label
																		for="university">Universidad</label>
																</div>
															</div>
															<div class="row">
																<div class="input-field col s6">
																	<i class="material-icons prefix">security</i> <input
																		class="validate" id="dni" type="text" name="dni"
																		onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
																		minlength = 8 maxlength=8 data-error="" required aria-required="true">
															
																	<label for="dni">DNI</label>
																</div>

																<div class="input-field col s6" style="z-index: 2;">
																	<i class="material-icons prefix">extension</i> <input
																		type="text" id="career" name="career"
																		class="autocomplete career" required> <label
																		for="career">Carrera</label>
																</div>
															</div>
														</div>


														<div id="table-datatables">

															<input id="enrollment1" type="text" class="hide">
															<div class="right">


																<a
																	class="btn-floating btn-large waves-effect waves-light green accent-3 btn modal-trigger"
																	href="#modal1"><i class="material-icons">add</i> </a>

																<div id="modal1" class="modal modal-fixed-footer"
																	style="width: 900px; height: 500px;">

																	<div class="modal-content modal-form">
																		<h3>Nª</h3>
																		<br>

																		<div class="row">
																			<div class="input-field col s6">
																				<i class="material-icons prefix">account_circle</i>
																				<input id="ml_name" type="text" name="ml_name"
																					class="validate" required> <label
																					for="ml_name">Nombres</label><input
																					id="sub_enrollment" type="text" class="hide">
																			</div>
																			<div class="input-field col s6">
																				<i class="material-icons prefix">email</i> <input
																					id="ml_email" name="ml_email" type="email"
																					class="validate" required> <label
																					for="ml_email">Correo</label>
																			</div>


																		</div>
																		<div class="row">
																			<div class="input-field col s6">
																				<i class="material-icons prefix">account_circle</i>
																				<input id="ml_last_name" name="ml_last_name"
																					type="text" class="validate" required> <label
																					for="ml_last_name">Apellidos</label>
																			</div>

																			<div class="input-field col s6" style="z-index: 2;">
																				<i class="material-icons prefix">account_balance</i>
																				<input type="text" id="ml_university"
																					name="ml_university"
																					class="autocomplete univ validate" required>
																				<label for="ml_university">Universidad</label>
																			</div>
																		</div>
																		<div class="row">
																			<div class="input-field col s6">
																				<i class="material-icons prefix">security</i> <input
																					class="validate" id="ml_dni" type="text"
																					name="ml_dni"
																					onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
																					maxlength=8 required aria-required="true">

																				<label for="ml_dni">DNI</label>
																			</div>

																			<div class="input-field col s6" style="z-index: 2;">
																				<i class="material-icons prefix">extension</i> <input
																					type="text" id="ml_career" name="ml_career"
																					class="autocomplete career validate" required>
																				<label for="ml_career">Carrera</label>
																			</div>
																		</div>


																	</div>


																	<div class="modal-footer">
																		<a href="#!"
																			class="modal-action modal-close waves-effect waves-green btn-flat ">Cancelar</a>

																		<button
																			class=" waves-effect waves-green btn-flat next-step"
																			data-feedback="acceptHandlerModal">Confirmar</button>
																	</div>
																</div>
															</div>

															<div id="cuerpo" class="container">
																<div id="contTable" class="row"></div>

															</div>

														</div>



														<div class="step-actions" style="z-index: 1;">
														
															<button class="waves-effect waves-dark btn next-step"
																id="first-step" data-feedback="nextStepFirstHandler"
																data-validator="validateFirstStep">CONTINUE</button>
														</div>
													</div>

												</li>





												<li class="step" id="second">
													<div class="step-title waves-effect">Verificación</div>
													<div class="step-content">


														<div id="table-datatables">
															<div id="cuerpo" class="container">
																<div id="reportTable" class="row"></div>



															</div>

														</div>

														<div class="step-actions">
															<button class="waves-effect waves-dark btn next-step" id="second-step">CONTINUE</button>
															<button
																class="waves-effect waves-dark btn-flat previous-step">BACK</button>
														</div>
													</div>
												</li>
												<li class="step">
													<div class="step-title waves-effect">Confirmación</div>
													<div class="step-content">
														Finish!
														<div class="step-actions">
															<button class="waves-effect waves-dark btn" type="submit"
																id="accept">SUBMIT</button>
														</div>
													</div>
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

		<!-- 		<div class="section scrollspy" id="feedback-step"> -->
		<!-- 			<div class="row"> -->
		<!-- 				<div class="col s12"> -->
		<!-- 					<h5>Feedback Step</h5> -->
		<!-- 				</div> -->
		<!-- 				<div class="col l6 m12 s12"> -->
		<!-- 					<div class="card"> -->
		<!-- 						<div class="card-content"> -->
		<!-- 							<ul class="stepper" id="feedbacker"> -->
		<!-- 								<li class="step active"> -->
		<!-- 									<div data-step-label="It's just a second..." -->
		<!-- 										class="step-title waves-effect waves-dark">Step 1</div> -->
		<!-- 									<div class="step-content"> -->
		<!-- 										<div class="row"> -->
		<!-- 											<div class="input-field col s6"> -->
		<!-- 												<input name="email" type="email" class="validate" required> -->
		<!-- 												<label for="email">Your e-mail</label> -->
		<!-- 											</div> -->
		<!-- 											<div class="input-field col s6"> -->
		<!-- 												<input name="name" type="text" class="validate" required> -->
		<!-- 												<label for="name">Your e-mail</label> -->
		<!-- 											</div> -->


		<!-- 											<div class="input-field col s6"> -->
		<!-- 												<i class="material-icons prefix">account_circle</i> <input -->
		<!-- 													id="last_name" type="text" class="validate" -->
		<!-- 													name="last_name" required> <label for="last_name">Apellidos</label> -->
		<!-- 											</div> -->

		<!-- 											<div class="input-field col s6" style="z-index: 2;"> -->
		<!-- 												<i class="material-icons prefix">account_balance</i> <input -->
		<!-- 													type="text" id="university" name="university" -->
		<!-- 													class="autocomplete univ" required> <label -->
		<!-- 													for="university">Universidad</label> -->
		<!-- 											</div> -->
		<!-- 											<div class="input-field col s6"> -->
		<!-- 												<i class="material-icons prefix">security</i> <input -->
		<!-- 													id="dni" type="number" name="dni" class="validate" required> -->
		<!-- 												<label for="dni">DNI</label> -->
		<!-- 											</div> -->

		<!-- 											<div class="input-field col s6" style="z-index: 2;"> -->
		<!-- 												<i class="material-icons prefix">extension</i> <input -->
		<!-- 													type="text" id="career" name="career" -->
		<!-- 													class="autocomplete career" required> <label -->
		<!-- 													for="career">Carrera</label> -->
		<!-- 											</div> -->

		<!-- 										</div> -->
		<!-- 										<div class="step-actions"> -->
		<!-- 											<button class="waves-effect waves-dark btn blue next-step" -->
		<!-- 												data-feedback="someFunction">CONTINUE</button> -->
		<!-- 										</div> -->
		<!-- 									</div> -->
		<!-- 								</li> -->
		<!-- 								<li class="step"> -->
		<!-- 									<div class="step-title waves-effect waves-dark">Step 2</div> -->
		<!-- 									<div class="step-content"> -->
		<!-- 										<div class="row"> -->
		<!-- 											<div class="input-field col s12"> -->
		<!-- 												<input id="pa" name="password" type="password" -->
		<!-- 													class="validate" required> <label for="password">Your -->
		<!-- 													password</label> -->
		<!-- 											</div> -->
		<!-- 										</div> -->
		<!-- 										<div class="step-actions"> -->
		<!-- 											<button class="waves-effect waves-dark btn blue next-step" -->
		<!-- 												data-feedback="someFunction">CONTINUE</button> -->
		<!-- 											<button -->
		<!-- 												class="waves-effect waves-dark btn-flat previous-step">BACK</button> -->
		<!-- 										</div> -->
		<!-- 									</div> -->
		<!-- 								</li> -->
		<!-- 								<li class="step"> -->
		<!-- 									<div class="step-title waves-effect waves-dark">Step 3</div> -->
		<!-- 									<div class="step-content"> -->
		<!-- 										Finish! -->
		<!-- 										<div class="step-actions"> -->
		<!-- 											<button class="waves-effect waves-dark btn blue" -->
		<!-- 												type="submit">SUBMIT</button> -->
		<!-- 										</div> -->
		<!-- 									</div> -->
		<!-- 								</li> -->
		<!-- 							</ul> -->
		<!-- 						</div> -->
		<!-- 					</div> -->
		<!-- 				</div> -->
		<!-- 				<div class="col l6 m12 s12"> -->
		<!-- 					<p>If you want, for example, to check if an e-mail exists in -->
		<!-- 						your DB, you can define a feedback function with data-feedback -->
		<!-- 						attribute in your next button.</p> -->
		<!-- 					<p>When the user try to move forward, a loading screen will -->
		<!-- 						overlay the active step until you trigger .nextStep manually.</p> -->
		<!-- 					<p> -->
		<!-- 						<b>Example:</b> -->
		<!-- 					</p> -->
		<!-- 					<pre class="language-markup"> -->
		<%-- 							<code class=" language-markup"> --%>
		<!-- 		&lt;script&gt; -->
		<!-- 		$(selector).nextStep(); -->
		<!-- 		&lt;/script&gt; -->
		<%-- 		                        </code> --%>
		<!-- 						</pre> -->
		<!-- 				</div> -->
		<!-- 			</div> -->
		<!-- 		</div> -->
	</div>
	<script
		src="<c:url value='/resources/js/businessCore/inscripcion.js'></c:url>"
		type="text/javascript"></script>

</body>
</html>