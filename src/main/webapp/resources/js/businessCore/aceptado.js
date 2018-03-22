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

		

	},
	complete : function() {

	} // Callback for Modal close

});

var arrayProperties = new Array();
var cambio = 0;
var lista = 0;
$("#change").change(function() {
	cambio = $("#change").val();
	
	if (cambio == 1) {
		
		consultar(cambio);
		
	} else {
		
	
		consultar(cambio);

	}

});

function consultar(point) {

	if (point == 1) {
		$.get(coneia_context_path + "/admin/aceptados", {
			op : point,
		}, function(data, status) {
			lista = JSON.parse(data);
			construirArray(lista);
		});
	} else {
		$.get(coneia_context_path + "/admin/aceptados", {
			op : point,
		}, function(data, status) {
			var lista = JSON.parse(data);
			
			construirArray(lista);
		});
	}

}

$("#clean").click(function() {


	$("#change").val(0);
	$('select').material_select();
	arrayProperties = new Array();
	showTable();

});

function construirArray(array) {

	arrayProperties = new Array();

	if (array != null) {
		for (var i = 0; i < array.length; i++) {

			var properties = new Object();
			properties.nombre = array[i].nombre;
			properties.apellidos = array[i].apellidos;
			properties.carrera = array[i].carrera;
			properties.entidad = array[i].entidad;
			properties.dni = array[i].dni;
			properties.correo = array[i].correo;
			properties.celular = array[i].celular;
			properties.tipo = array[i].tipo;
			properties.fecha = array[i].fecha;
			properties.url = array[i].url;
			properties.idinscripcion = array[i].idinscripcion;
			properties.operacion = array[i].nro;
			properties.importe = array[i].importe;
			properties.fechaupdate = array[i].fechaupdate;
			
			arrayProperties.push(properties);

	

		}
	}

	showTable();
}

var u = "";
function showTable() {

	var a = "";
	var cont = 1;

	for ( var i in arrayProperties) {

		if (arrayProperties[i].tipo == 3) {
			a += "<tr style='background-color: lightgray;'><td  >";
		} else {
			a += "<tr><td  >";
		}

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
			if (arrayProperties[i].tipo == 3) {

				a += 'Delegado';
			} else {
				a += 'Profesional';
			}

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
		a += "</td><td>";
		
		if(cambio==1){
			if (arrayProperties[i].tipo == 1) {
				a += 'ALUM-';
			} else {
				if (arrayProperties[i].tipo == 3) {

					a += 'DELE-';
				} else {
					a += 'PROF-';
				}

			}
		}else{
			a += 'DELE-';
		}

		a += arrayProperties[i].idinscripcion;
		a += "</td><td>";
		a += arrayProperties[i].fechaupdate;
		a += "</td><td>";
		a += arrayProperties[i].importe;
		// a += costo_inscripcion;
		a += "</td><td>";
		a += "<button "
				+ " class='btn-floating waves-effect waves-light btn modal-trigger waves-light orange' id='"
				+ arrayProperties[i].url
				+ "'  onclick='verVoucher(this.id)' style='margin-right: 14%;' data-target='modal8'><i class='medium material-icons'>attach_file</i></button>";
		a += "</td>";

		a += "</tr>";
		cont++;
	}

	$("#tableaceptados").empty();

	$("#tableaceptados").append(createTable2());
	$("#data5").empty();
	$("#data5").append(a);

	$("#data-table-row-grouping5")
			.dataTable(

					{
						
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

							var size = arrayProperties.length;
							

							// Remove the formatting to get integer data for
							// summation
							var intVal = function(i) {
								return typeof i === 'string' ? i.replace(
										/[\$,]/g, '') * 1
										: typeof i === 'number' ? i : 0;
							};

							// Total over all pages
							total = api.column(11).data().reduce(
									function(a, b) {
										return intVal(a) + intVal(b);
									}, 0);

							// Total over this page
							pageTotal = api.column(11, {
								page : 'current'
							}).data().reduce(function(a, b) {
								return intVal(a) + intVal(b);
							}, 0);

						
							$('tr:eq(0) td:eq(0)', api.table().footer()).html(
									"S/. " + total + ".00");
						

						}
					});
	
	$( "#data-table-row-grouping5_filter" ).after( "<div  id='hugme' style='overflow-x:auto; clear: both;'></div>" );
	$( "#data-table-row-grouping5" ).appendTo('#hugme');



};

function createTable2() {
	var d = "<table id='data-table-row-grouping5' class='bordered highlight centered' >";
	d += "<thead>";
	d += "<tr>";
	d += "<th>Nº</th>";
	d += "<th>Nombres y Apellidos</th>";
	d += "<th>DNI</th>";
	d += "<th>Perfil</th>";
	d += "<th>Celular</th>";
	d += "<th>Entidad</th>";
	d += "<th>Carrera</th>";
	d += "<th>Correo</th>";
	d += "<th>Nº Operación</th>";
	d += "<th>Inscripcion-ID</th>";
	d += "<th>Aprobación</th>";
	d += "<th>Importe</th>";
	d += "<th>Voucher</th>";
	d += "</tr>";
	d += "</thead>";
	d += "<tfoot>";

	d += "<tr><th colspan='11' style='text-align:right' >Total:</th>";
	d += "<td style='text-align:center' id='dis'></td></tr></tfoot>";

	d += "<tbody id='data5'></tbody>";
	d += "</table>";
	return d;

};

function verVoucher(url) {
	
	var nombre_file = url;


	var u = "";

	u += '<img class="materialboxed" '
	u += '	style="width: 100%; height: 380px; "'
//	u += 'src="' + coneia_context_path + '/resources/files/' + url + '" '
		u += 'src="' + coneia_context_path + '/admin/viewdoc?nombre=' + url + '"'
	
	u += 'alt="sample"'
	u += 'data-caption="Esc para volver" >'

		var b = "";
	b="<embed src='" + coneia_context_path + '/admin/viewdoc?nombre=' + url + "' width='500' height='375' type='application/pdf'>"
		

	var tipo = url.split(".")[1];
	if (tipo=="pdf"){
		$("#vervoucher").html(b);
	}else{
		$("#vervoucher").html(u);
	}
	
	$('.materialboxed').materialbox();
	$("#modal8").modal('open');
	
	var ruta_img = coneia_context_path + '/resources/files/' + url;

	$("#download").attr("href",ruta_img).attr("download", url);

}
