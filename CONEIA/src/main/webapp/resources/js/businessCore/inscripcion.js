$(document)
		.ready(
				function() {

					$('.stepper').activateStepper();
					$(".button-collapse").sideNav();
					$("#personal").hide();
					$("#table-datatables").hide();

					listar();

					$('input.career')
							.autocomplete(
									{
										data : {
											"Ingenieria de Sistemas" : null,
											"Ingenieria Ambiental" : null,
											"Ingenieria de Alimentos" : 'https://placehold.it/250x250',
											"Contabilidad" : null,
											"Administracion de Empresas" : null,
											"Ingenieria Industrial" : null
										},
										limit : 4, // The max amount of results
										// that can be shown at
										// once.
										// Default: Infinity.
										onAutocomplete : function(val) {
											// Callback function when value is
											// autcompleted.
										},
										minLength : 1, // The minimum length of
									// the input for the
									// autocomplete
									// to start. Default: 1.
									});
					$('input.univ')
							.autocomplete(
									{
										data : {
											"Universidad Peruana Union" : null,
											"Universidad Nacional de Piura" : null,
											"Universidad Nacional de Ingenieria" : 'https://placehold.it/250x250',
											"USIL" : null,
											"Cayetano Heredia" : null,
											"UNMSM" : null
										},
										limit : 4, // The max amount of results
										// that can be shown at
										// once.
										// Default: Infinity.
										onAutocomplete : function(val) {
											// Callback function when value is
											// autcompleted.
										},
										minLength : 1, // The minimum length of
									// the input for the
									// autocomplete
									// to start. Default: 1.
									});

				});

var costo_inscripcion = 100;
var opcion = 0;
var s = "";
$("input[name=group1]").click(function() {
	opcion = $(this).val();
	console.log("el campo seleccionado es: " + $(this).val());

	if (opcion == 1) {
		$("#table-datatables").hide();
		$("#personal").show();
		getIdEnrollment();
	} else {
		$("#personal").hide();
		$("#table-datatables").show();
		getIdDetailEnrollment();
	}
});

var arrayProperties = new Array();

$(".enrollment").click(function() {
	$.get(context_path + "/inscripcion", null, function(data, status) {
		// $("#space").empty();
		$("#space").html(data);
	});

});


$("#dni").keyup(function(e) {
	
	console.log($("#dni").val().length);
	if ($("#dni").val().length <8) {
		console.log("falta")
		$("#dni").next("label").attr('data-error','Faltan caracteres');
    	$("#dni").removeClass("valid");
    	$("#dni").addClass("invalid");
	}else{
		
		console.log("complete")
		$("#dni").removeClass("invalid");
    	$("#dni").addClass("valid");

		
	}
});
$("#ml_dni").keyup(function(e) {
	
	console.log($("#ml_dni").val().length);
	if ($("#ml_dni").val().length <8) {
		console.log("falta")
		$("#ml_dni").next("label").attr('data-error','Faltan caracteres');
    	$("#ml_dni").removeClass("valid");
    	$("#ml_dni").addClass("invalid");
	}else{
		
		console.log("complete")
		$("#ml_dni").removeClass("invalid");
    	$("#ml_dni").addClass("valid");

		
	}
});

// $(".register").click(function() {
//
// $.get("inscripcion", function(data, status) {
//
// // $("#dashboard").empty();
//
// $("#dashboard").html(data);
// });
// })

// $("#first-step").click(function(){
function insertarPersona() {
	if (opcion == 1) {
		console.log("es opcion 1")

		var nombre = $("#name").val();
		var apellido = $("#last_name").val();
		var carrera = $("#career").val();
		var universidad = $("#university").val();
		var dni = $("#dni").val();
		var correo = $("#email").val();

		var properties = new Object();
		properties.nombre = nombre;
		properties.apellido = apellido;
		properties.carrera = carrera;
		properties.universidad = universidad;
		properties.dni = dni;
		properties.correo = correo;

		arrayProperties.push(properties);

		console.log(JSON.stringify(arrayProperties));

		console.log("inserta");
		validation = true;
	} else {
		console.log("no es la opcion 1, ver op modal");

	}
};

$("#second-step").click(function() {

});

function validateFirstStep() {
	var validation = true;
	if ($('.step').first().find('input[type="radio"]:checked').length === 0) {
		validation = false;
		console.log("no selecciono opcion");
		$('#first').removeClass('active').addClass('wrong');

		return validation;
	} else {
		
		if (arrayProperties.length === 0) {
			if(opcion==1){
				console.log("i do not need you")
			}else{
			alertify.alert('Alert Title',
					'Usted no ha agregado a ninguna persona', function() {
						alertify.success('Ok');
						// $("#first").removeClass("step active
						// feedbacking").addClass("step active");
						// $(".wait-feedback").remove();
					})
			validation = false;
			}
		} else {
			if(opcion==1){
				console.log("i do not need you")
				validation = true;
			}else{
				console.log("again you")
			alertify.confirm('Confirm Title',
					'Segura que no desea agregar a alguien mas?', function() {
						alertify.success('Ok');
						// $('#feedbacker').nextStep();

						validation = true;
					}, function() {
						alertify.error('Cancel')
						validation = false;
						// falta una funcion para retroceder
					});
			}
		}

	}
	return validation;
}

function nextStepFirstHandler() {
	if (validateFirstStep()) {
		insertarPersona();
		console.log("first handler")
		listarReporte();
		$('.stepper').nextStep();
	} else {
		// $('.stepper').getStep($('.stepper').getActiveStep()).destroyFeedback();
		console.log("first handler2")
		$('.stepper').destroyFeedback();
		$('.stepper').getStep($('.stepper').getActiveStep()).addClass('wrong');
	}
}

//
// function validateModal() {
//
// if (true) {
//		
// } else {
// console.log("error");
// }
// return true;
// }

function acceptHandlerModal() {
	console.log("entro");

	var nombre = $("#ml_name").val();
	var apellido = $("#ml_last_name").val();
	var carrera = $("#ml_career").val();
	var universidad = $("#ml_university").val();
	var dni = $("#ml_dni").val();
	var correo = $("#ml_email").val();

	var properties = new Object();
	properties.nombre = nombre;
	properties.apellido = apellido;
	properties.carrera = carrera;
	properties.universidad = universidad;
	properties.dni = dni;
	properties.correo = correo;

	arrayProperties.push(properties);
	var data = JSON.stringify(arrayProperties)
	console.log(JSON.stringify(arrayProperties));

	// limpiarModal();

	// $('.stepper').getStep($('.stepper').getActiveStep()).destroyFeedback();
	// $('.stepper').destroyFeedback();
	// $('.stepper').getStep($('.stepper').getActiveStep()).addClass('wrong');

	if (true) {
		// $('.stepper').nextStep();
		$("#modal1").modal('close');
		$('.stepper').destroyFeedback();
		$('.stepper').getStep($('.stepper').getActiveStep()).removeClass(
				'wrong');
		listar();

	} else {
		// //
		// $('.stepper').getStep($('.stepper').getActiveStep()).destroyFeedback();

		console.log("herror handler");
	}
}

function someOtherFunction() {
	return true;
};

function listar() {

	s = "";
	var cont = 1;
	for ( var i in arrayProperties) {
		console.log(arrayProperties[i].nombre)
		s += "<tr><td  >";
		s += cont;
		s += "</td>";
		s += "<td>";
		s += arrayProperties[i].nombre;
		s += ", ";
		s += arrayProperties[i].apellido;
		s += "</td><td>";
		s += arrayProperties[i].dni;
		s += "</td><td>";
		s += arrayProperties[i].universidad;
		s += "</td><td>";
		s += arrayProperties[i].carrera;
		s += "</td><td>";
		s += arrayProperties[i].correo;
		s += "</td><td>";
		s += "<button "
				+ " class='btn-floating waves-effect waves-light btn modal-trigger waves-light orange' value='this.id'"
				+ "  onclick='modificar("
				+ cont
				+ ")' style='margin-right: 14%;'><i class='material-icons'>mode_edit</i></button>";
		s += "<button"

				+ " class=' btn-floating waves-effect waves-light btn modal-trigger waves-light red' value='this.id'"
				+ "  onclick='eliminar(" + cont
				+ ")'><i class='material-icons'>delete</i></button>";
		s += "</td>";

		s += "</tr>";
		cont++;
	}

	$("#contTable").empty();

	$("#contTable").append(createTable1());

	$("#data").empty();
	console.log(s);
	$("#data").append(s);
	$("#data-table-row-grouping").dataTable();
	$("input[type='search']").attr("name", "search");

};
function listarReporte() {

	var a = "";
	var cont = 1;
	for ( var i in arrayProperties) {
		console.log(arrayProperties[i].nombre)
		a += "<tr><td  >";
		a += cont;
		a += "</td>";
		a += "<td>";
		a += arrayProperties[i].nombre;
		a += ", ";
		a += arrayProperties[i].apellido;
		a += "</td><td>";
		a += arrayProperties[i].dni;
		a += "</td><td>";
		a += arrayProperties[i].universidad;
		a += "</td><td>";
		a += arrayProperties[i].carrera;
		a += "</td><td>";
		a += arrayProperties[i].correo;
		a += "</td><td>";
		a += "$";
		a += costo_inscripcion;
		a += "</td>";

		a += "</tr>";
		cont++;
	}

	$("#reportTable").empty();

	$("#reportTable").append(createTable2());
	$("#data1").empty();
	$("#data1").append(a);
	// $("#data-table-row-grouping1").dataTable();
	// $('#data-table-row-grouping1').dataTable( {
	// "footerCallback": function( row, data, start, end, display ) {
	// var api = this.api();
	// $( api.column( 6 ).footer() ).html(
	// api.column( 6 ).data().reduce( function ( a, b ) {
	// return a + b;
	// }, "S/. " )
	// );
	// }
	// } );
	$("#data-table-row-grouping1")
			.dataTable(
					{
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
							total = api.column(6).data().reduce(function(a, b) {
								return intVal(a) + intVal(b);
							}, 0);

							// Total over this page
							pageTotal = api.column(6, {
								page : 'current'
							}).data().reduce(function(a, b) {
								return intVal(a) + intVal(b);
							}, 0);

							// Update footer
							// $( api.column( 6 ).footer() ).html(
							// '$'+pageTotal +' ( $'+ total +' total)'
							// );
							var descuento = 0;
							if (size >= 10) {
								console.log("tiene descuento");
								descuento = costo_inscripcion * size;
								descuento = descuento * 0.1;

							} else {
								alertify
										.alert(
												'Alert Title',
												'Para obtener un descuento debe formar una delegacion con 10 integrantes a mas',
												function() {
													alertify.success('Ok');
												});
							}

							$('tr:eq(1) td:eq(0)', api.table().footer()).html(
									descuento);
							$('tr:eq(0) td:eq(0)', api.table().footer()).html(
									total);
							$('tr:eq(2) td:eq(0)', api.table().footer()).html(
									total - descuento);

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

function createTable1() {
	var s = "<table id='data-table-row-grouping' class='bordered highlight centered' >";
	s += "<thead>";
	s += "<tr>";
	s += "<th>Nro</th>";
	// s += "<th class='hide' >N°</th>";
	s += "<th>Nombres y Apellidos</th>";
	s += "<th>Dni</th>";
	s += "<th>Universidad</th>";
	s += "<th>Carrera</th>";
	s += "<th>Correo</th>";
	s += "<th>Operaciones</th>";
	s += "</tr>";
	s += "</thead>"
	s += "<tbody id='data'></tbody>";
	s += "</table>";
	return s;

};

function createTable2() {
	var d = "<table id='data-table-row-grouping1' class='bordered highlight centered' >";
	d += "<thead>";
	d += "<tr>";
	d += "<th>Nro</th>";
	// s += "<th class='hide' >N°</th>";
	d += "<th>Nombres y Apellidos</th>";
	d += "<th>Dni</th>";
	d += "<th>Universidad</th>";
	d += "<th>Carrera</th>";
	d += "<th>Correo</th>";
	d += "<th>Costo</th>";
	d += "</tr>";
	d += "</thead>";
	d += "<tfoot><tr>";
	d += "<th colspan='6' style='text-align:right'>Subtotal:</th>";
	d += "<td style='text-align:center'  id='total'></td></tr>";

	d += "<tr>";
	d += "<th colspan='6' style='text-align:right' >Descuento:</th>";
	d += "<td style='text-align:center' id='dis'></td></tr>";
	d += "<tr><th colspan='6' style='text-align:right' >Total:</th>";
	d += "<td style='text-align:center' id='dis'></td></tr></tfoot>";

	d += "<tbody id='data1'></tbody>";
	d += "</table>";
	return d;

};

function preba(nombre, id) {
	var idt = $('#' + id).parents("tr").find("td").eq(0).text();
	$("#cuerpo").append(createModal(idt, nombre));
	$("#modal" + id).openModal();
};

function createModal(id, nombre) {
	var s = "<td><div id='modal" + id + "' class='modal'>\r\n";
	s += "<div class='modal-content'>\r\n";
	s += "						<center>\r\n";
	s += "	<h4>Observacion</h4>\r\n";
	s += "						</center>\r\n";
	s += "	<div class='row'>\r\n";
	s += "	<form class='col s12'>\r\n";
	s += "	<div class='row'>\r\n";
	s += "	<div class='input-field col s12'>\r\n";
	s += "<textarea id='textarea1' class='materialize-textarea'></textarea>\r\n";
	s += "	<label for='textarea1'>Escriba Observacion para: ";
	s += nombre;
	s += "</label>\r\n";
	s += "	</div>\r\n";
	s += "								</div>\r\n";
	s += "</form>\r\n";
	s += "						</div>\r\n";
	s += "</div>\r\n";
	s += "					<div class='modal-footer'>\r\n";
	s += "	<a href='#!'";
	s += "	class='modal-action modal-close waves-effect waves-green btn-flat' id='observarbtn' onclick='observar();' >OK!</a>\r\n";
	s += "</div>\r\n" + "</div></td>";
	return s;

};

// $("#guardarInscripcion").on("click", function(e) {

jQuery.validator.setDefaults({
	debug : true,
	success : "valid"
});

$("#formValidate").validate({
	rules : {
		field : {
			required : true
		}
	}
});

$('.modal').modal({
	dismissible : false, // Modal can be dismissed by clicking outside of the
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

		var breaking = 1;

		var size = $(".modal-form label").length;

		$(".modal-form label").each(function() {

			// $(this).removeClass("modal abierto");
			console.log("modal abierto")
			console.log($(this));

			if (breaking % 2 == 0) {

				$(this).removeClass("active");

				// return true;
			} else {

				$(this).remove();
			}
			breaking++;

		});

		$(".modal-form input.validate").each(function() {
			console.log("cleaning");

			$(this).removeClass("validate invalid valid").addClass("validate");

		});

		$("#ml_name").val("");
		$("#ml_last_name").val("");
		$("#ml_career").val("");
		$("#ml_university").val("");
		$("#ml_dni").val("");
		$("#ml_email").val("");

	} // Callback for Modal close

});

function getIdEnrollment() {
	$.get("subscribe/InscripcionMax", function(data, status) {
		console.log(JSON.parse(data));
		$("#enrollment").val('');
		$("#enrollment").val(data);
	});
}

function getIdDetailEnrollment() {
	$.get("subscribe/InscripcionDetalleMax", function(data, status) {
		console.log(JSON.parse(data));
		$("#sub_enrollment").val('');
		$("#sub_enrollment").val(data);
	});
}

//
$("#accept").click(function() {
	console.log(arrayProperties);
	var data = JSON.stringify(arrayProperties);
	// var da = JSON.parse(arrayProperties);
	$.get("subscribe/createEnrollment", {
		op : data
	}, function(response, status) {
		console.log(response);
		if (response == 1) {
			alertify.alert('Success', 'Registrado correctamente', function() {
				alertify.success('Ok');
				// $("#first").removeClass("step active
				// feedbacking").addClass("step active");
				// $(".wait-feedback").remove();
				var link = context_path

				location.href = link;
			})
		} else {
			alertify.alert('Error', 'Registro fallido', function() {
				alertify.success('Ok');
				// $("#first").removeClass("step active
				// feedbacking").addClass("step active");
				// $(".wait-feedback").remove();
			})
		}
	})

});

$("#second").click(function(e) {
	console.log("second step");
	e.preventDefault();
	validateFirstStep()
//me sale el anuncio si deseo agregar a alguien mas ---corregir
	//validar input universidad
	//crear form pago
});
