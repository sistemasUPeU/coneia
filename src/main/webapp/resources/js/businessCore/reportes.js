$(document).ready(function() {

	$('select').material_select();

	$('.datepicker').pickadate({
		selectMonths : true, // Creates a dropdown to control month
		selectYears : 5, // Creates a dropdown of 15 years to control year,
		closeOnSelect : false
	// Close upon selecting a date,
	});

	// var $input = $('.datepicker').pickadate()

	// Use the picker object directly.
	// var picker = $input.pickadate('picker');

	// Using arrays formatted as [YEAR, MONTH, DATE].
	// picker.set('select', [ 2015, 3, 20 ])

	// Using JavaScript Date objects.
	// picker.set('select', new Date(2015, 3, 30))

	// Using positive integers as UNIX timestamps.
	// picker.set('select', 1429970887654)

	// Using a string along with the parsing format (defaults to `format`
	// option).
	// picker.set('select', '', {
	// format : 'yyyy-mm-dd'
	// })
	showTable();

});

var cambio = 0;
var fecha;
var tipoins = 0;
var filtro = 0;
var lista = 0;
var arrayProperties = new Array();

jQuery.extend(jQuery.fn.pickadate.defaults, {
	monthsFull : [ 'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio',
			'julio', 'agosto', 'septiembre', 'octubre', 'noviembre',
			'diciembre' ],
	monthsShort : [ 'ene', 'feb', 'mar', 'abr', 'may', 'jun', 'jul', 'ago',
			'sep', 'oct', 'nov', 'dic' ],
	weekdaysFull : [ 'domingo', 'lunes', 'martes', 'miércoles', 'jueves',
			'viernes', 'sábado' ],
	weekdaysShort : [ 'dom', 'lun', 'mar', 'mié', 'jue', 'vie', 'sáb' ],
	today : 'hoy',
	clear : 'borrar',
	close : 'cerrar',
	firstDay : 1,
	format : 'yyyy-mm-dd',

});

jQuery.extend(jQuery.fn.pickatime.defaults, {
	clear : 'borrar'
});

$("#selected")
		.change(
				function() {
					cambio = $("#selected").val();

					if (cambio == 1) {

						var p = "";
						p += '<option value="" disabled selected>Seleccione una opción</option>'
						p += '<option value="1">UPeU</option>'
						p += '<option value="2">Alumnos Externos</option>'
						p += '<option value="3">Profesionales</option>'
						$("#set").html(p);
						$("#set").prop('disabled', false);
						$('select').material_select();
						// listar();
					} else {

						// listarDelegacion();

						var a = "";
						a += '<option value="" disabled selected>Seleccione una opción</option>'
						a += '<option value="1">UPeU</option>'
						a += '<option value="2">Alumnos Externos</option>'
						$("#set").html(a);
						$("#set").prop('disabled', false);
						$('select').material_select();

					}

				});

$("#clean").click(function() {

	$("#fecha").val("");
	$("#selected").val(0);
	$("#set").html("");
	$("#set").prop('disabled', true);
	$('select').material_select();
	arrayProperties = new Array();
	showTable();

});

function buscar(e) {
	// e.preventDefault();

	filtro = $("#set").val();

	fecha = $("#fecha").val();

	if (fecha != "" && cambio != "" && filtro != "" && filtro != null) {

		$.get(coneia_context_path + "/admin/tables", {
			op : cambio,
			fecha : fecha
		}, function(data, status) {
			lista = JSON.parse(data);
			construirArray(cambio, filtro);
		});

	} else {
		alertify.alert('Alerta', 'Por favor complete los filtros de búsqueda',
				function() {
					alertify.success('Ok');

				});
	}

}

function construirArray(change, point) {

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

		}
	}

	showTable(point);
}

var u = "";
function showTable(target) {

	var a = "";
	var cont = 1;

	if (target == 1) {

		for ( var i in arrayProperties) {
			if (arrayProperties[i].entidad == 'UNIVERSIDAD PERUANA UNION'
					|| arrayProperties[i].entidad == 'UNIVERSIDAD PERUANA UNIÓN') {

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
				a += arrayProperties[i].importe;
				// a += costo_inscripcion;
				a += "</td>";

				a += "</tr>";
				cont++;
			}
		}
	} else {
		if (target == 2) {
			for ( var i in arrayProperties) {
				if (arrayProperties[i].entidad != 'UNIVERSIDAD PERUANA UNION'
						&& arrayProperties[i].entidad != 'UNIVERSIDAD PERUANA UNIÓN' && arrayProperties[i].tipo != 2 ) {
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
					a += arrayProperties[i].importe;
					// a += costo_inscripcion;
					a += "</td>";

					a += "</tr>";
					cont++;
				}
			}
		} else {
			if (target == 3) {
				for ( var i in arrayProperties) {
					if (arrayProperties[i].tipo == 2) {
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
						a += arrayProperties[i].importe;
						// a += costo_inscripcion;
						a += "</td>";

						a += "</tr>";
						cont++;
					}
				}
			}
		}
	}

	$("#table").empty();

	$("#table").append(createTable2());
	$("#data1").empty();
	$("#data1").append(a);

	$("#data-table-row-grouping1")
			.dataTable(

					{
						dom : 'Bfrtip',
						// buttons : [ 'copy', 'csv', 'excel', 'pdf', 'print' ],
						buttons : [ 'excel' ],
						buttons : [ {
							extend : 'excel',
							text : 'Exportar a excel',
							exportOptions : {
								modifier : {
									page : 'all'
								}
							},
							messageTop : 'Reporte de inscripciones confirmadas CONEIA 2018 - '
									+ fecha
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

							$('tr:eq(0) td:eq(0)', api.table().footer()).html(
									"S/. " + total + ".00");

						}
					});

	// $('#data-table-row-grouping1').DataTable( );
	$("#data-table-row-grouping1_filter").after(
			"<div  id='hugme1' style='overflow-x:auto; clear: both;'></div>");
	$("#data-table-row-grouping1").appendTo('#hugme1');
};

function createTable2() {
	var d = "<table id='data-table-row-grouping1' class='bordered highlight centered' >";
	d += "<thead>";
	d += "<tr>";
	d += "<th>Nro</th>";
	// s += "<th class='hide' >N°</th>";
	d += "<th>Nombres y Apellidos</th>";
	d += "<th>DNI</th>";
	d += "<th>Perfil</th>";
	d += "<th>Celular</th>";
	d += "<th>Entidad</th>";
	d += "<th>Carrera</th>";
	d += "<th>Correo</th>";
	d += "<th>Nº Operación</th>";
	d += "<th>Inscripcion-ID</th>";
	d += "<th>Importe</th>";
	d += "</tr>";
	d += "</thead>";
	d += "<tfoot>";

	d += "<tr><th colspan='10' style='text-align:right' >Total:</th>";
	d += "<td style='text-align:center' id='dis'></td></tr></tfoot>";

	d += "<tbody id='data1'></tbody>";
	d += "</table>";
	return d;

};

