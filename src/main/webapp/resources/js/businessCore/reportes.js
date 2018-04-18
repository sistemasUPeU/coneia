$(document).ready(function() {

	$('select').material_select();

	$('.datepicker').pickadate({
		selectMonths : true, // Creates a dropdown to control month
		selectYears : 5, // Creates a dropdown of 15 years to control year,
		closeOnSelect : false
	// Close upon selecting a date,
	});


	showTable();
	
	$('input.univ').autocomplete({
		data : {
			"Universidad Nacional Mayor de San Marcos" : null,
			"Universidad Nacional de Ingeniería" : null,
			"Universidad Nacional Agraria La Molina" : null,
			"Universidad Nacional Federico Villarreal" : null,
			"Universidad Nacional del Callao" : null,
			"Universidad Nacional de Educación Enrique Guzmán y Valle" : null,
			"Universidad Nacional José Faustino Sánchez Carrión" : null,
			"Pontificia Universidad Católica del Perú" : null,
			"Universidad del Pacífico" : null,
			"Universidad de Lima" : null,
			"Universidad de San Martín de Porres" : null,
			"Universidad Femenina del Sagrado Corazón" : null,
			"Universidad Inca Garcilaso de la Vega" : null,
			"Universidad Ricardo Palma" : null,
			"Universidad Peruana Unión" : null,
			"Universidad Marcelino Champagnat" : null,
			"Universidad Peruana de Ciencias Aplicadas" : null,
			"Universidad San Ignacio de Loyola" : null,
			"Universidad Alas Peruanas" : null,
			"Universidad Norbert Wiener" : null,
			"Asociación Universidad Privada San Juan Bautista" : null,
			"Universidad Tecnológica del Perú" : null,
			"Universidad Católica Sedes Sapientiae" : null,
			"Universidad Científica del Sur" : null,
			"Universidad Peruana de Ciencia e Informática" : null,
			"Universidad Antonio Ruiz de Montoya" : null,
			"Universidad ESAN" : null,
			"Universidad Las Américas" : null,
			"Universidad Privada Telesup" : null,
			"Facultad de Teología Pontificia y Civil de Lima" : null,
			"Universidad Nacional Tecnológica del Cono Sur de Lima" : null,
			"Universidad Nacional de Cañete" : null,
			"Universidad Nacional de Barranca" : null,
			"Universidad Privada Sergio Bernales" : null,
			"Universidad Peruana Simón Bolívar" : null,
			"Universidad de Ciencias y Humanidades" : null,
			"Universidad Peruana de Integración Global" : null,
			"Universidad Autónoma del Perú" : null,
			"Universidad Privada Arzobispo Loayza" : null,
			"Universidad Le Cordon Bleu" : null,
			"Universidad Jaime Bausate y Meza" : null,
			"Universidad de Ciencias y Artes de América Latina" : null,
			"Universidad Peruana de Arte Orval" : null,
			"Universidad Peruana de Investigación y Negocios" : null,
			"Universidad San Andrés" : null,
			"Universidad Interamericana para el Desarrollo" : null,
			"Universidad Juan Pablo II" : null,
			"Universidad de Ingeniería y Tecnología" : null,
			"Universidad María Auxiliadora" : null,
			"Universidad Santo Domingo de Guzmán" : null,
			"Universidad Privada Peruano Alemana" : null,
			"Universidad Nacional Santiago Antúnez de Mayolo" : null,
			"Universidad Nacional del Santa" : null,
			"Universidad Católica Los Ángeles de Chimbote" : null,
			"Universidad San Pedro" : null,
			"Universidad Nacional de Cajamarca" : null,
			"Universidad Privada Antonio Guillermo Urrelo" : null,
			"Universidad Nacional de Jaén" : null,
			"Universidad Nacional Autónoma de Chota" : null,
			"Universidad Nacional de Trujillo" : null,
			"Universidad Privada Antenor Orrego" : null,
			"Universidad César Vallejo" : null,
			"Universidad Privada del Norte" : null,
			"Universidad Católica de Trujillo Benedicto XVI" : null,
			"Universidad Privada de Trujillo" : null,
			"Universidad Privada Leonardo Da Vinci" : null,
			"Universidad Nacional Pedro Ruiz Gallo" : null,
			"Universidad Particular de Chiclayo" : null,
			"Universidad Católica Santo Toribio de Mogrovejo" : null,
			"Universidad Señor de Sipán" : null,
			"Universidad Privada Juan Mejía Baca" : null,
			"Universidad de Lambayeque" : null,
			"Universidad Nacional de Piura" : null,
			"Universidad de Piura" : null,
			"Universidad Nacional de Frontera" : null,
			"Universidad Nacional de Tumbes" : null,
			"Universidad Nacional Micaela Bastidas de Apurímac" : null,
			"Universidad Tecnológica de los Andes" : null,
			"Universidad Nacional José María Arguedas" : null,
			"Universidad Nacional de San Agustín" : null,
			"Universidad Católica de Santa María" : null,
			"Universidad Católica San Pablo" : null,
			"Universidad Ciencias de la Salud" : null,
			"Universidad Autónoma San Francisco" : null,
			"Universidad La Salle" : null,
			"Universidad Privada Autónoma del Sur" : null,
			"Universidad Nacional de San Cristóbal de Huamanga" : null,
			"Universidad de Ayacucho Federico Froebel" : null,
			"Universidad Nacional de San Antonio Abad del Cusco" : null,
			"Universidad Andina del Cusco" : null,
			"Universidad Peruana Austral del Cusco" : null,
			"Universidad Privada Líder Peruana" : null,
			"Universidad Global del Cusco" : null,
			"Universidad José Carlos Mariátegui" : null,
			"Universidad Nacional de Moquegua" : null,
			"Universidad Nacional del Altiplano" : null,
			"Universidad Andina Néstor Cáceres Velásquez" : null,
			"Universidad Nacional de Juliaca" : null,
			"Universidad Privada San Carlos" : null,
			"Universidad Nacional Jorge Basadre Grohmann" : null,
			"Universidad Privada de Tacna" : null,
			"Universidad Latinoamericana CIMA" : null,
			"Universidad Nacional de Huancavelica" : null,
			"Universidad para el Desarrollo Andino" : null,
			"Universidad Nacional Hermilio Valdizán" : null,
			"Universidad de Huánuco" : null,
			"Universidad Nacional San Luis Gonzaga de Ica" : null,
			"Universidad Privada de Ica" : null,
			"Universidad Privada Ada A. Byron" : null,
			"Universidad Nacional del Centro del Perú" : null,
			"Universidad Peruana Los Andes" : null,
			"Universidad Continental" : null,
			"Universidad Peruana del Centro" : null,
			"Universidad Privada de Huancayo Franklin Roosevelt" : null,
			"Universidad Santo Tomás de Aquino de Ciencia e Integración" : null,
			"Universidad Nacional Daniel Alcides Carrión" : null,
			"Universidad Nacional Toribio Rodríguez de Mendoza de Amazonas" : null,
			"Universidad de la Amazonia Mario Peláez Bazán" : null,
			"Universidad Nacional de la Amazonia Peruana" : null,
			"Universidad Científica del Perú" : null,
			"Universidad Peruana del Oriente" : null,
			"Universidad Privada de la Selva Peruana" : null,
			"Universidad Nacional Amazónica de Madre de Dios" : null,
			"Universidad Nacional Agraria de la Selva" : null,
			"Universidad Nacional de San Martín" : null,
			"Universidad Nacional de Ucayali" : null,
			"Universidad Nacional Intercultural de la Amazonia" : null,
			"Universidad Privada de Pucallpa" : null

		},
		limit : 3, // The max amount of results that can be shown at once.
		// Default: Infinity.
		onAutocomplete : function(val) {

		},
		minLength : 0, // The minimum length of
	// the input for the
	// autocomplete
	// to start. Default: 1.
	});
	

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
	uni = $("#uni").val();

	
	if (cambio != "" && filtro != "" && filtro != null) {

		
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
	var d = new Date();

	var month = d.getMonth()+1;
	var day = d.getDate();

	var current_date = ((''+day).length<2 ? '0' : '') + day + ' / ' +
	    ((''+month).length<2 ? '0' : '') + month + ' / ' + d.getFullYear();

	var tipo_n= $( "#selected option:selected" ).text();
	var personalizar_n = $( "#set option:selected" ).text();
	$("#data-table-row-grouping1")
			.dataTable(

					{
						dom : 'Bfrtip',
						// buttons : [ 'copy', 'csv', 'excel', 'pdf', 'print' ],
//						buttons : [ 'excel' ],
						buttons : [ {
							extend : 'excelHtml5',
							text : 'Exportar a excel',
							exportOptions : {
								modifier : {
									page : 'all'
								}
							},
							messageTop : 'Reporte de inscripciones confirmadas CONEIA 2018',
								
								    header:false,
								    customize: function ( xlsx ) {
								        var sheet = xlsx.xl.worksheets['sheet1.xml'];
								       
								   
								        //Bold Header Row
								        $('row[r=3] c', sheet).attr( 's', '2' );
								        $('row[r=4] c', sheet).attr( 's', '2' );
								        $('row[r=5] c', sheet).attr( 's', '2' );
								        $('row[r=7] c', sheet).attr( 's', '2' );
								        //Make You Input Cells Bold Too
								        $('c[r=A1]', sheet).attr( 's', '51' );
								        $('c[r=A2]', sheet).attr( 's', '51' );
								    },
								    customizeData: function(data){
								        //We want the first line so we disabled the header above. Let's add in our descriptions. Then we're going to add them to the top of the body and do the bolding ourselves with the customize function.
								        var desc = [
								        	['',''],
								        	['Especificación',personalizar_n],
								            ['Tipo de inscripcion',tipo_n],
								            ['Fecha de descarga',current_date]
								        	
								        ];
								        data.body.unshift(data.header);
								        for (var i = 0; i < desc.length; i++) {
								            data.body.unshift(desc[i]);
								        };
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
	var d = "<table id='data-table-row-grouping1' class='bordered highlight centered'>";
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

