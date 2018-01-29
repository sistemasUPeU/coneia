<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="../../../jspf/general.jspf"%>
<link
	href="<c:url value='http://fonts.googleapis.com/icon?family=Material+Icons'></c:url>"
	rel="stylesheet" type="text/css" />
<style>
div.container {
	max-width: 1200px
}

.special_row {
	width: 40%;
	margin-top: 7%;
	margin-bottom: 7%;
}

@media only screen and (max-width: 600px) {
	.special_row {
		width: 90%;
		padding: 0px;
		margin-top: 7%;
		margin-bottom: 7%;
	}
	#slide-out {
		width : 30%;		
	}
}
</style>

</head>
<body>
	<%@include file="../../../jspf/header.jspf"%>
	<!-- 	<div id="loader-wrapper"> -->
	<!-- 		<div id="loader"></div> -->
	<!-- 		<div class="loader-section section-left"></div> -->
	<!-- 		<div class="loader-section section-right"></div> -->
	<!-- 	</div> -->
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
							<div class="row" id="pizarra">
								<!-- 								<div class="col s12 m6 l4"> -->
								<!-- 									<div id="profile-card" class="card"> -->
								<!-- 										<div class="card-image waves-effect waves-block waves-light" -->
								<!-- 											style="height: 100px;"> -->
								<!-- 											<img class="activator" -->
								<%-- 												src="<c:url value="/resources/images/user-profile-bg.jpg"/>" --%>
								<!-- 												alt="user background"> -->
								<!-- 										</div> -->

								<!-- 										<div class="card-content"> -->

								<!-- 											<img style="top: 60px;" -->
								<%-- 												src="<c:url value='/resources/images/avatar.jpg'/>" alt="" --%>
								<!-- 												class="circle responsive-img activator card-profile-image"> -->
								<!-- 											<a -->
								<!-- 												class="btn-floating btn-large btn-move-up waves-effect waves-light darken-2 right modal-trigger" -->
								<!-- 												id="1" onclick="confirmarModal(this.id)" href="#modal1"> -->
								<!-- 												<i class="mdi-editor-mode-edit"></i> -->

								<!-- 											</a> -->
								<!-- 											<p class="row"> -->
								<!-- 												<span -->
								<!-- 													class="card-title activator grey-text text-darken-4 left">Roger -->
								<!-- 													Waters</span> <span class="right" style="line-height: 30px;">18th -->
								<!-- 													June, 2015</span> -->
								<!-- 											</p> -->



								<!-- 										</div> -->


								<!-- 										<div class="card-reveal"> -->
								<!-- 											<span class="card-title grey-text text-darken-4">Roger -->
								<!-- 												Waters <i class="mdi-navigation-close right"></i> -->
								<!-- 											</span> -->
								<!-- 											<p>Here is some more information about this card.</p> -->
								<!-- 											<p> -->
								<!-- 												<i class="mdi-action-perm-identity cyan-text text-darken-2"></i> -->
								<!-- 												Project Manager -->
								<!-- 											</p> -->
								<!-- 											<p> -->
								<!-- 												<i class="mdi-action-perm-phone-msg cyan-text text-darken-2"></i> -->
								<!-- 												+1 (612) 222 8989 -->
								<!-- 											</p> -->
								<!-- 											<p> -->
								<!-- 												<i class="mdi-communication-email cyan-text text-darken-2"></i> -->
								<!-- 												mail@domain.com -->
								<!-- 											</p> -->
								<!-- 											<p> -->
								<!-- 												<i class="mdi-social-cake cyan-text text-darken-2"></i> 18th -->
								<!-- 												June 1990 -->
								<!-- 											</p> -->
								<!-- 											<p> -->
								<!-- 												<i -->
								<!-- 													class="mdi-device-airplanemode-on cyan-text text-darken-2"></i> -->
								<!-- 												BAR - AUS -->
								<!-- 											</p> -->
								<!-- 										</div> -->
								<!-- 									</div> -->
								<!-- 								</div> -->
							</div>
							<!-- 							<div class="row"> -->
							<!-- 								<h4 class="col s12">Layla</h4> -->
							<!-- 								<div class="col s12 m6 grid"> -->
							<!-- 									<figure class="effect-layla"> -->
							<%-- 										<img src="<c:url value="/resources/images/6.jpg"/>" --%>
							<!-- 											alt="img06" /> -->
							<!-- 										<figcaption> -->
							<!-- 											<h2> -->
							<!-- 												Crazy <span>Layla</span> -->
							<!-- 											</h2> -->
							<!-- 											<p>When Layla appears, she brings an eternal summer -->
							<!-- 												along.</p> -->
							<!-- 											<a href="#">View more</a> -->
							<!-- 										</figcaption> -->
							<!-- 									</figure> -->
							<!-- 								</div> -->
							<!-- 								<div class="col s12 m6 grid"> -->
							<!-- 									<figure class="effect-layla"> -->
							<%-- 										<img src="<c:url value="/resources/images/3.jpg"/>" --%>
							<!-- 											alt="img03" /> -->
							<!-- 										<figcaption> -->
							<!-- 											<h2> -->
							<!-- 												Crazy <span>Layla</span> -->
							<!-- 											</h2> -->
							<!-- 											<p>When Layla appears, she brings an eternal summer -->
							<!-- 												along.</p> -->
							<!-- 											<a href="#">View more</a> -->
							<!-- 										</figcaption> -->
							<!-- 									</figure> -->
							<!-- 								</div> -->
							<!-- 							</div> -->
						</div>
						<br>
						<br>
						<br>
						<br>
	



						<!-- 						</div> -->
						<!--/ end blog list -->

						<div id="modal3" class="modal modal-fixed-footer"
							style="width: 60%; height: 100%;">

							<div class="modal-content modal-form">
								<h4>Evaluación de Inscripción</h4>


								<div class="row">
									<div class="col s8">
										<div class="col s6" id="column1"></div>
										<div class="col s6" id="column2"></div>
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

									<div class="col s4" id="picture">
										<!-- 									D:\\RRHH\\GTH\\gth01\\src\\main\\resources\\jasperreports\\request_report.jasper -->
										<%-- 									<object id="request" data="<c:url value="/resources/files/voucher50.jpg"/>" --%>

										<!-- 										type="image/jpeg" width="auto" height="auto"> </object> -->
										<img class="materialboxed" style="width: 90%; height: 380px;"
											src="<c:url value="/resources/files/voucher56.jpg"/>"
											alt="sample"
											data-caption="A picture of some deer and tons of trees">




									</div>

								</div>
								<br>
								<div class="row">
									<div class="container" id="trueway" style="width: 45%">

										<a class="waves-effect waves-light btn left"
											style="margin-right: 10%;" id="enviarConfirmacion"><i
											class="medium material-icons right">check_circle</i>Confirmar</a>


										<a class="waves-effect waves-light btn red darken-4 right"
											id="observar"><i class="medium material-icons right">error</i>Observar</a>





									</div>

									<div class="container hide" id="falseway" style="width: 45%">

										<a class="waves-effect waves-light btn left indigo"
											style="margin-right: 10%;" id="back"><i
											class="medium material-icons right">keyboard_return</i>Volver</a>


										<a class="waves-effect waves-light btn red darken-4 right"
											id="enviarObservacion"><i
											class="medium material-icons red darken-4 right">send</i>Enviar</a>

									</div>

								</div>



							</div>


							<div class="modal-footer hide">
								<a href="#!"
									class="modal-action modal-close waves-effect waves-green btn-flat "
									id="modal_cancel">Cancelar</a> <a href="#!"
									class="modal-action modal-close waves-effect waves-green btn-flat "
									id="modalconfirm">Confirmar</a>

							</div>
						</div>

						<div id="modal4" class="modal modal-fixed-footer"
							style="width: 85%; height: 100%;">

							<div class="modal-content modal-form">
								<h4 id="title"></h4>


								<div class="row">
									<div class="col s8">
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

									<div class="col s4" id="picture_del">
										<!-- 									D:\\RRHH\\GTH\\gth01\\src\\main\\resources\\jasperreports\\request_report.jasper -->
										<%-- 									<object id="request" data="<c:url value="/resources/files/voucher50.jpg"/>" --%>

										<!-- 										type="image/jpeg" width="auto" height="auto"> </object> -->
										<img class="materialboxed" style="width: 90%; height: 380px;"
											src="<c:url value="/resources/files/voucher56.jpg"/>"
											alt="sample"
											data-caption="A picture of some deer and tons of trees">

									</div>

								</div>
								<br>
								<div class="row">
									<div class="container" id="trueway_del" style="width: 45%">

										<a class="waves-effect waves-light btn left"
											style="margin-right: 10%;" id="enviarConfirmacion_del"><i
											class="medium material-icons right">check_circle</i>Confirmar</a>


										<a class="waves-effect waves-light btn red darken-4 right"
											id="observar_del"><i class="medium material-icons right">error</i>Observar</a>





									</div>

									<div class="container hide" id="falseway_del"
										style="width: 45%">

										<a class="waves-effect waves-light btn left indigo"
											style="margin-right: 10%;" id="back_del"><i
											class="medium material-icons right">keyboard_return</i>Volver</a>


										<a class="waves-effect waves-light btn red darken-4 right"
											id="enviarObservacion_del"><i
											class="medium material-icons red darken-4 right">send</i>Enviar</a>

									</div>

								</div>



							</div>


							<div class="modal-footer hide">
								<a href="#!"
									class="modal-action modal-close waves-effect waves-green btn-flat "
									id="modal_cancel">Cancelar</a> <a href="#!"
									class="modal-action modal-close waves-effect waves-green btn-flat "
									id="modalconfirm">Confirmar</a>

							</div>
						</div>


					</div>





				</div>
			</section>
		</div>
		<%-- 		<%-- 		<%@include file="../../../jspf/info_puesto.jspf"%> --%>
		<!-- 		<div id="table-datatables" class="card-panel"> -->
		<!-- 			<div class="col s12 m8 l9 contT"></div> -->
		<!-- 		</div> -->
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



</body>
</html>