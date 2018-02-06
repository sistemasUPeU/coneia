
<%
	HttpSession sesion = request.getSession();
	if (sesion.getAttribute("dni") == null || sesion.getAttribute("rol") == null) {
		response.sendRedirect("/portal/");

	} else {
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<%@include file="../../../jspf/general.jspf"%>

<link
	href="<c:url value='https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css'></c:url>"
	rel="stylesheet" type="text/css" />



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

						<div class="container" style="width: 90%;">
							<div class="row">
								<div class="input-field col s12 m4 l4">
									<i class="material-icons prefix">date_range</i> <input
										id="fecha" ;
										type="text" class="datepicker">
									<label for="name">Fecha</label>

								</div>

								<div class="input-field col s12 m4 l4">
									<i class="material-icons prefix"> call_split</i> <select
										id="selected" required>
										<option value="0" disabled selected>Seleccione una opción</option>
										<option value="1">Inscripción personal</option>
										<option value="2">Inscripción por delegación</option>

									</select> <label>Tipo de Inscripción</label>
								</div>
								<div class="input-field col s12 m4 l4">
									<i class="material-icons prefix">explore</i> <select id="set"
										required disabled>



									</select> <label>Personalizar</label>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="row" id="ttt">

									<div class="col s12 m12 l6 center boton">
										<button class="waves-effect waves-light btn indigo center"
											style="margin-top: 10px;" id="buscar" onclick="buscar()">
											<i class="medium material-icons right"">search</i>Buscar
										</button>



									</div>
									<div class="col s12 m12 l6 center boton">
										<button
											class="waves-effect waves-light btn red darken-4 center"
											id="clean" style="margin-top: 10px;">
											<i class="medium material-icons red darken-4 right">delete_sweep</i>Limpiar
										</button>


									</div>

								</div>
								<div class="container" style="width: 50%"></div>
							</div>
							<br> <br>


						</div>
						<div id="table-datatables">
							<div id="cuerpo" class="container" style="width: 100%">
								<div id="table" class="row"></div>



							</div>

						</div>
						<br> <br> <br>

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

	<script
		src="<c:url value='/resources/js/businessCore/reportes.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js'></c:url>"
		type="text/javascript"></script>
	<script type="text/javascript">
		$(window).on("load", function() {
			setTimeout(function() {
				$('body').addClass('loaded');
			}, 200);
		})
	</script>

</body>
</html>
<%
	}
%>