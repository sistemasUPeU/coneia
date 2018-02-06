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


</head>
<body>
	<%@include file="../../../jspf/header.jspf"%>

	<div id="main">
		<div class="wrapper">
			<%@include file="../../../jspf/aside_left.jspf"%>
			<section id="content">

				<div class="container" style="width: 95%;">
					<div class="section">
						<div class="container" style="width: 70%;">
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
										class=" center waves-effect waves-light btn red darken-4 right"
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
							style="width: 60%; height: 100%;">

							<div class="modal-content modal-form" >
								<h4>Ver Voucher</h4>


								<div class="container" id="vervoucher" style="width: 70%"></div>
								<br>
							</div>


							<div class="modal-footer">
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

	</div>
	<br>
	<br>
	<br>

	<%-- 		<%-- 		<%@include file="../../../jspf/info_puesto.jspf"%> --%>
	<!-- 		<div id="table-datatables" class="card-panel"> -->
	<!-- 			<div class="col s12 m8 l9 contT"></div> -->
	<!-- 		</div> -->
<!-- 	</div> -->
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



</body>
</html>