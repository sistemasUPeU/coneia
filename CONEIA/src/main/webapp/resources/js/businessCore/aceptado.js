$(document).ready(function() {

	$('select').material_select();
	showTable();

});

$('#modal8').modal({
	dismissible : true, // Modal can be dismissed by clicking outside of the
	// modal
	opacity : .5, // Opacity of modal background
	inDuration : 400, // Transition in duration
	outDuration : 200, // Transition out duration
	startingTop : '4%', // Starting top style attribute
	endingTop : '10%', // Ending top style attribute
	ready : function(modal, trigger) { // Callback for Modal open. Modal and
		// trigger parameters available.

		console.log(modal, trigger);

	},
	complete : function() {

	} // Callback for Modal close

});

var arrayProperties = new Array();
var cambio = 0;
var lista = 0;
$("#change").change(function() {
	cambio = $("#change").val();
	console.log($("#change").val());
	if (cambio == 1) {
		console.log("es personal");
		consultar(cambio);
		// listar();
	} else {
		console.log("es delegacion");
		// listarDelegacion();
		consultar(cambio);

	}

});

function consultar(point) {

	if (point == 1) {
		$.get(coneia_context_path + "/admin/responsew", {
			op : point
		}, function(data, status) {
			lista = JSON.parse(data);
			construirArray();
		});
	} else {
		$.get(coneia_context_path + "/admin/resdelegacion", {
			op : point
		}, function(data, status) {
			lista = JSON.parse(data);
			construirArray();
		});
	}

}

$("#clean").click(function() {
	console.log("limpiar");

	$("#change").val(0);
	$('select').material_select();
	arrayProperties = new Array();
	showTable();

});

function construirArray() {

	arrayProperties = new Array();

	if (lista != null) {
		for (var i = 0; i < lista.length; i++) {

			var properties = new Object();
			properties.nombre = lista[i].nombre;
			properties.apellidos = lista[i].apellidos;
			properties.carrera = lista[i].carrera;
			properties.entidad = lista[i].entidad;
			properties.dni = lista[i].dni;
			properties.correo = lista[i].correo;
			properties.celular = lista[i].celular;
			properties.tipo = lista[i].tipo;
			properties.fecha = lista[i].fecha;
			properties.url = lista[i].url;
			properties.idinscripcion = lista[i].idinscripcion;
			properties.operacion = lista[i].nro;
			properties.importe = lista[i].importe;

			arrayProperties.push(properties);

			console.log("recorrido " + i + " persona"
					+ JSON.stringify(arrayProperties));

		}
	}

	showTable();
}

var u = "";
function showTable() {

	var a = "";
	var cont = 1;

	for ( var i in arrayProperties) {

		a += "<tr><td  >";
		a += cont;
		a += "</td>";
		a += "<td>";
		a += arrayProperties[i].nombre;
		a += ", ";
		a += arrayProperties[i].apellidos;
		a += "</td><td>";
		a += arrayProperties[i].dni;
		a += "</td><td>";

		if (arrayProperties[i].tipo == 1) {
			a += 'Alumno';
		} else {
			a += 'Profesional';
		}

		a += "</td><td>";
		a += arrayProperties[i].celular;
		a += "</td><td>";
		a += arrayProperties[i].entidad;
		a += "</td><td>";
		a += arrayProperties[i].carrera;
		a += "</td><td>";
		a += arrayProperties[i].correo;
		a += "</td><td>";
		a += arrayProperties[i].operacion;
		a += "</td><td> DELE-";
		a += arrayProperties[i].idinscripcion;
		a += "</td><td>";
		a += arrayProperties[i].importe;
		// a += costo_inscripcion;
		a += "</td><td>";
		a += "<button "
				+ " class='btn-floating waves-effect waves-light btn modal-trigger waves-light orange' id='"+arrayProperties[i].url
				+ "'  onclick='verVoucher(this.id)' style='margin-right: 14%;' data-target='modal8'><i class='medium material-icons'>attach_file</i></button>";
		a += "</td>";

		a += "</tr>";
		cont++;
	}

	$("#tableaceptados").empty();

	$("#tableaceptados").append(createTable2());
	$("#data1").empty();
	$("#data1").append(a);

	$("#data-table-row-grouping1")
			.dataTable(

					{
						dom : 'Bfrtip',
						buttons : [ 'copy', 'csv', 'excel', 'pdf', 'print' ],
						buttons : [ 'excel' ],
						buttons : [ {
							extend : 'excel',
							text : 'Exportar a excel',
							exportOptions : {
								modifier : {
									page : 'current'
								}
							}
						} ],
						"pageLength" : 10,
						"bPaginate" : true,
						"bLengthChange" : false,
						"bFilter" : true,
						"bInfo" : false,
						"bAutoWidth" : true,
						"language" : {
							// "lengthMenu": "Display _MENU_ records per page",
							"zeroRecords" : "Reporte vacío",
							"info" : "Mostrando página _pag_ de _pags_",
							"infoEmpty" : "Ningún alumno agregado"
						// "infoFiltered": "(filtered from _MAX_ total records)"
						},
						// "displayLength": 2,
						// "lengthMenu": [ 2, 3, 6, 7, 8 ],
						"footerCallback" : function(row, data, start, end,
								display) {
							var api = this.api(), data;

							//            
							// //discount
							var size = arrayProperties.length;
							console.log(arrayProperties.length);

							// Remove the formatting to get integer data for
							// summation
							var intVal = function(i) {
								return typeof i === 'string' ? i.replace(
										/[\$,]/g, '') * 1
										: typeof i === 'number' ? i : 0;
							};

							// Total over all pages
							total = api.column(10).data().reduce(
									function(a, b) {
										return intVal(a) + intVal(b);
									}, 0);

							// Total over this page
							pageTotal = api.column(10, {
								page : 'current'
							}).data().reduce(function(a, b) {
								return intVal(a) + intVal(b);
							}, 0);

							// Update footer
							// $( api.column( 6 ).footer() ).html(
							// '$'+pageTotal +' ( $'+ total +' total)'
							// );
							// var descuento = 0;
							// if (size >= 10) {
							// console
							// .log("tiene descuento, ejecutando desde tabla");
							// descuento = costo_inscripcion * size;
							// descuento = descuento * 0.1;
							//
							// } else {
							// alertify
							// .alert(
							// 'Alert Title',
							// 'Para obtener un descuento debe formar una
							// delegacion con 10 integrantes a
							// mas',
							// function() {
							// alertify.success('Ok');
							// });
							// }

							// $('tr:eq(1) td:eq(0)',
							// api.table().footer()).html(
							// descuento);
							$('tr:eq(0) td:eq(0)', api.table().footer()).html(
									"S/. " + total + ".00");
							// $('tr:eq(2) td:eq(0)',
							// api.table().footer()).html(
							// total - descuento);

							// $("#dis").html("des");
							//
							// $("#total").html(pageTotal);

							// // Not working
							// $('tr:eq(1) td:eq(2)', api.table().footer())
							// .html(format(pageTotal, ''));

						}
					});

	// $('#data-table-row-grouping1').DataTable( );

};

function createTable2() {
	var d = "<table id='data-table-row-grouping1' class='bordered highlight centered' >";
	d += "<thead>";
	d += "<tr>";
	d += "<th>Nro</th>";
	// s += "<th class='hide' >N°</th>";
	d += "<th>Nombres y Apellidos</th>";
	d += "<th>Perfil</th>";
	d += "<th>Dni</th>";
	d += "<th>Celular</th>";
	d += "<th>Entidad</th>";
	d += "<th>Carrera</th>";
	d += "<th>Correo</th>";
	d += "<th>Nº Operación</th>";
	d += "<th>Inscripcion-ID</th>";
	d += "<th>Importe</th>";
	d += "<th>Voucher</th>";
	d += "</tr>";
	d += "</thead>";
	d += "<tfoot>";

	d += "<tr><th colspan='10' style='text-align:right' >Total:</th>";
	d += "<td style='text-align:center' id='dis'></td></tr></tfoot>";

	d += "<tbody id='data1'></tbody>";
	d += "</table>";
	return d;

};

function verVoucher(url) {
	console.log(url);
	var nombre_file=url;

//
//	var p = "";
//	p += '<object id="request" data="' + coneia_context_path
//			+ '/admin/viewdoc?nombre=' + nombre_file + '"';
////	+ '/admin/viewdoc?nombre=voucher60.pdf"';
//	p += 'type="application/pdf" width="100%" height="400px" style=""> </object>'

		var u = "";

	u += '<img class="materialboxed" '
	u += '	style="width: 100%; height: 380px; "'
	u += 'src="' + coneia_context_path + '/resources/files/'
			+ url + '" '

	u += 'alt="sample"'
	u += 'data-caption="Esc para volver" >'



		
		
		
	$("#vervoucher").html(u);
	$('.materialboxed').materialbox();
	$("#modal8").openModal();
	$(".lean-overlay").css("opacity", "0.5");
}
