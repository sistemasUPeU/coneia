
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

<%@include file="../../../jspf/general.jspf"%>
<link href="<c:url value='/resources/css/alertify.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='http://fonts.googleapis.com/icon?family=Material+Icons'></c:url>"
	rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lobster+Two"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Crimson+Text"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Cinzel"
	rel="stylesheet">
<style>
div.container {
	max-width: 1200px
}

label {
	display: block;
	float: left;
	width: 100%;
}

.dataTables_wrapper .dataTables_filter {
	float: none;
	width: 50%;
	margin-left: 25%;
}

.special_row {
	width: 40%;
	margin-top: 7%;
	margin-bottom: 1%;
}

.collapsible li.active .i {
	-ms-transform: rotate(180deg); /* IE 9 */
	-webkit-transform: rotate(180deg); /* Chrome, Safari, Opera */
	transform: rotate(180deg);
}

.ajs-message.ajs-custom {
	color: #31708f;
	background-color: #d9edf7;
	border-color: #31708f;
	z-index: 999999
}

.muestra2 {
	margin-left: 35%;
}

.fa {
	width: 35px;
	height: 35px;
	margin-right: 1em;
}

#cuerpo {
	width: 85%;
}

@media only screen and (max-width: 900px) {
	#cuerpo {
		width: 95%;
	}
}

@media only screen and (max-width: 600px) {
	html {
		font-size: 10px;
	}
	.chip {
		height: auto;
		font-size: 10px;
	}
	.modal-trigger, .moe {
		width: 25px;
		height: 25px;
		line-height: 10px;
	}
	.modal-trigger i, .moe i {
		font-size: 1.6rem;
		line-height: 25px;
	}
	#table {
		margin-bottom: 4em;
	}
	.muestra2 {
		margin-bottom: 4em;
		margin-left: 30%;
	}
	.fa {
		width: 15px;
		height: 15px;
	}
	.terraza {
		font-size: 12px;
	}
	h2 {
		font-size: 16px;
	}
	.chama {
		padding: 1px;
	}
	.dataTables_wrapper .dataTables_filter {
		float: none;
		width: 100%;
		margin-left: 0%;
	}
	.special_row {
		width: 90%;
		padding: 0px;
		margin-top: 7%;
		margin-bottom: 1%;
	}
	#slide-out {
		width: 30%;
	}
	.cola {width ="1em";
		
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


				<div class="section">
					<div class="container special_row"
						style="margin-top: 1%; padding-bottom: 1px">
						<div class="row">
							<div class="input-field col s12">
								<i class="material-icons prefix">assignment</i> <select
									id="selected" required>
									<option value="0" disabled selected>Seleccione una opción</option>
									<option value="2018-06-04">LUNES</option>
									<option value="2018-06-05">MARTES</option>
									<option value="2018-06-06">MIÉRCOLES</option>
									<option value="2018-06-07">JUEVES</option>
									<option value="2018-06-08">VIERNES</option>

								</select> <label>Día del evento</label>
							</div>
						</div>

					</div>
					<div class="row muestra" style="width: 95%" style="padding:1px">
						<div class="chip col l3 s5 left"
							style="height: auto; margin-bottom: 1em; align-self: left">

							<a
								class="btn-floating fa waves-effect waves-light #ff9100 red accent-3 tooltipped"
								href="#" data-position="bottom" data-delay="50"
								data-tooltip="No Asistió"><i class="material-icons"
								style="font-size: 20px">done_all</i></a>


							<!-- 									<a class="btn-floating fa waves-effect waves-light #00b0ff light-blue accent-3 accent-3 tooltipped" href="#" data-position="bottom" data-delay="50" data-tooltip="Entrada" ><i class="material-icons" style="font-size: 20px">done_all</i></a>    -->


							<a
								class="btn-floating fa waves-effect waves-light #00c853 green accent-4 tooltipped"
								href="#" data-position="bottom" data-delay="50"
								data-tooltip="Entrada y Salida"><i class="material-icons"
								style="font-size: 20px">done_all</i></a>

						</div>






					</div>

					<div class="col l9 m9 s12 temon" style="margin-left: 5%"></div>
					<div id="buscador" style="display: none">
						<div class="center">
							
									<div class="row">
										<div class="input-field col s12 m6">
											<i class="material-icons prefix">search</i> <input
												id="search_box" type="text" class="validate"> <label
												for="search_box">Busque por dni</label>
										</div>

									</div>
								
						</div>

					</div>
					<div id="table-datatables">
						<div id="cuerpo" class="container">


							<div id="table" class="row"></div>



						</div>

					</div>

					<div class="row muestra2" style="display: none; margin-top: 1em">
						<div class="col l6 s4 " style="margin-left: 1em">
							<a href="#"
								class="btn btn-large waves-effect waves-light #263238 blue-grey darken-4 final">Reporte
								final <i class="material-icons right" style="font-size: 20px">account_balance_wallet</i>
							</a>
						</div>
					</div>
					<div id="modalon" class="modal">
						<div class="modal-content ">
							<div class="row">
								<h2 class="center achon" style="font-family: 'Cinzel', serif;"></h2>
								<div id="table-datatables">
									<div class="container" style="width: 95%">
										<div id="cant"></div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>







			</section>
			<div class="row reporte"
				style="width: 90%; display: none; padding-top: 2em">

				<div class="col s12" style="margin-bottom: 1em">
					<span id="fecha"
						style="font-family: 'Lobster Two', cursive; font-size: 25px;"></span>
				</div>
				<div id="table-datatables">
					<div id="cuerpo" class="container" style="width: 95%;">


						<div id="table2" class="row"></div>



					</div>

				</div>

				<div class="row muestra2">
					<div class="col l6 s4 " style="margin-left: 1em">
						<a href=""
							class="btn btn-large waves-effect waves-light #263238 blue-grey darken-4 ">volver
							<i class="material-icons right" style="font-size: 20px">account_balance_wallet</i>
						</a>
					</div>
				</div>
			</div>
		</div>

	</div>
	<%@include file="../../../jspf/footer.jspf"%>
	<script type="text/javascript">
		$(window).on("load", function() {
			setTimeout(function() {
				$('body').addClass('loaded');
			}, 200);
		})

		$('.progress').fadeOut('fast');
		$('#loader-wrap').fadeOut('fast');
		$('#loader-wrap1').fadeOut('fast');

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
		src="<c:url value='https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js'></c:url>"
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
	<script
		src="<c:url value='/resources/js/businessCore/asistencia.js'></c:url>"
		type="text/javascript"></script>


</body>
</html>
<%
	}
%>