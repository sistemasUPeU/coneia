
<%
	HttpSession sesion = request.getSession();
	if (sesion.getAttribute("dni") == null || sesion.getAttribute("rol") == null || Integer.parseInt(sesion.getAttribute("idrol").toString()) != 5) {
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
			<div class="row reporte"
				style="width: 90%;  padding-top: 2em">

				<div class="col s12" style="margin-bottom: 1em">
					<span id="fecha"
						style="font-family: 'Lobster Two', cursive; font-size: 25px;"></span>
				</div>
				<div class="col s12" style="margin-bottom: 1em">
					<span id="temon"
						style="font-family: 'Cinzel', cursive; font-size: 25px;"></span>
				</div>
				<div id="table-datatables">
					<div id="cuerpo" class="container" style="width: 95%;">


						<div id="table2" class="row"></div>



					</div>

				</div>

				<div class="row muestra2" style="margin-bottom:4em">
					<div class="col l6 s4 " style="margin-left: 1em">
						<a 
							class="btn btn-large waves-effect waves-light #263238 blue-grey darken-4 comeBack">volver
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
	<script>
		$(document).ready(function(){
			var fechin = new Date();var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
			$("#fecha").empty().append(fechin.toLocaleDateString("es-ES", options));
			
			var item = localStorage.getItem("idtaller");
			console.log("este es el taller: "+item);
			
			$.getJSON(
					coneia_context_path + "/admin/customTaller",
					{op:34,idt:item},
					function(objJson) {
						var s = "";
						var lista = objJson;
						console.log(lista);
						if(lista==0){
							console.log(lista);
						}else{
						if (lista.length > 0) {
							// alert("si hay datos amix");
							var temon = lista[0].tema;	
							$("#temon").empty().append(temon);
							for (var i = 0; i < lista.length; i++) {
								var a = parseInt(i) + 1;
								var asistencia = lista[i].asistencia;
								
								if(asistencia ==1){
									clase2="#00c853 green accent-4";
								}
								if(asistencia ==0){
									clase2="red";
								}
								var valor = lista[i].porcentaje;
								if(parseInt(valor)>=80){
									clase = "##33691e light-green darken-4";
									certi="Completo"
								}else{
									if(parseInt(valor)>=50){
										clase = "#006064 cyan darken-4";
										certi="Mitad";
									}else{
										clase = "#424242 grey darken-3";
										certi="Ausente"
										
									}
									
								}
								s += '<tr>';
								s += '<td style="width:3%">'
										+a
										+ '</td>';
								s += '<td style="width:25%">'
										+ lista[i].nombres + " " +lista[i].apellidos
										+ '</td>';
								s += '<td style="width:15%">' + lista[i].dni
										+ '</td>';
								s += '<td style="width:20%">' + lista[i].correo
								+ '</td>';
								s += '<td style="width:15%">' + lista[i].celular
								+ '</td>';
								s += '<td style="width:12%" ><b>'+valor+' %</b></td>';
								s += '<td style="width:10%;color:white" class="'+clase+'">' + certi
								+ '</td>';
								// s += '<td>' + p + '</td>';
								s += '</tr>';
								
							}

						} else {
							//alert("no hay datos");
							s += "";
						}
						$("#table2").empty();

						$("#table2").append(createTable());

						$("#data1").empty();
						$("#data1").append(s);
						console.log(lista[0].tema);

						$("#data-table-row-grouping5")
						.dataTable(
								{
									dom : 'Bfrtip',
									buttons : [ 'copy', 'csv', 'excel', 'pdf', 'print' ],
									buttons : [ 'excel' ],
									buttons : [ {
										extend : 'excel',
										text : 'EXCEL',
										messageTop: lista[0].tema
										
									}, {
										extend : 'pdf',
										text : 'pdf',
										messageTop: lista[0].tema
									}, {
										extend : 'print',
										text : 'Imprimir',
										messageTop: lista[0].tema
									}],
									
									"pageLength" : 10,
									"bPaginate" : true,
									"bLengthChange" : false,
									"ordering": false,
									"bFilter" : true,
									"bInfo" : false,
									"bAutoWidth" : true,
									"select":true,
									"language" : {
										// "lengthMenu": "Display _MENU_ records per page",
										"zeroRecords" : "Reporte vacío",
										"info" : "Mostrando página _pag_ de _pags_",
										"infoEmpty" : "Ningún alumno agregado"
									// "infoFiltered": "(filtered from _MAX_ total records)"
									}


									
								}
								
						
						);

					$(".buttons-pdf").addClass("btn waves-effect waves-light");
					$(".buttons-excel").addClass("btn waves-effect waves-light");
					$(".buttons-print").addClass("btn waves-effect waves-light");
						}
				});
					
		});
	
		function createTable() {
			var d = "<table id='data-table-row-grouping5' class='bordered highlight centered' >";
			d += "<thead>";
			d += "<tr>";
			d += "<th>Nro</th>";
			// s += "<th class='hide' >N°</th>";
			d += "<th>Nombres y Apellidos</th>";
			d += "<th>Dni</th>";
			d += "<th>Correo</th>";
			d += "<th> Celular </th>";
			d += "<th>Asistencia</th>";
			d += "<th>% de Asistencias</th>";
			d += "</tr>";
			d += "</thead>";

			d += "<tbody id='data1'></tbody>";
			d += "</table>";
			return d;

		};
		$(".comeBack").click(function(){
			link = coneia_context_path  + "/admin/programaAdmin";
			location.href=link;
		});
	</script>


</body>
</html>
<%
	}
%>