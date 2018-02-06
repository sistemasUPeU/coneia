$(document).ready(function() {

	$('.dropify').dropify();
	$('select').material_select();
	// // Translated
	// $('.dropify-fr').dropify({
	// messages: {
	// default: 'Glissez-déposez un fichier ici ou cliquez',
	// replace: 'Glissez-déposez un fichier ou cliquez pour
	// remplacer',
	// remove: 'Remover',
	// error: 'Désolé, le fichier trop volumineux'
	// }
	// });

	$('.stepper').activateStepper();
	$(".button-collapse").sideNav();
	$("#personal").hide();
	$("#table-datatables").hide();

	// listar();
	autocomplete();
	

});

$(window).on('resize', function() {
	check()
});
function check(){
	if ($(window).width() < 600) {
		listarReporteMini();
	}else{
		listarReporte();
	}
}
function autocomplete() {
	$('input.career').autocomplete({
		data : {
			"Ingenieria de Sistemas" : null,
			"Ingenieria Ambiental" : null,
			"Ingenieria de Alimentos" : null,
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
						limit : 5, // The max amount of results
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
}
var costo_inscripcion = 0;
var opcion = 0;
var s = "";
var pos = 0
var change = 0;
// Used events

var drEvent = $('.dropify-event').dropify();
drEvent.on('dropify.beforeClear', function(event, element) {
	return confirm("Do you really want to delete \"" + element.filename
			+ "\" ?");
});

drEvent.on('dropify.afterClear', function(event, element) {
	alert('File deleted');
});

$("#select").change(function() {
	change = $("#select").val();
	console.log($("#select").val());
	if (change == 2) {
		$("#div_uni").addClass("hide");
		$("#div_bus").removeClass("hide");
		$("#importe_profesional").val('170')
		costo_inscripcion = $("#importe_profesional").val(); // 170 soles
		console.log("costo profesional " + costo_inscripcion)
		$(".select-dropdown").attr("name", "nombrecillo");
	} else {
		$("#div_bus").addClass("hide");
		$("#div_uni").removeClass("hide");
		$("#importe_alumno").val('140');
		costo_inscripcion = $("#importe_alumno").val(); // 140 soles
		$(".select-dropdown").attr("name", "nombrecillo");
	}

	$("#personal input").each(function() {
		$(this).removeAttr("disabled");
		$(this).not($("#personal input").first()).val("");
	})
	$("#first-step").click();
	var breaki = 1
	$("#personal label").not(".hide label").each(function() {

		// $(this).removeClass("modal abierto");

		// console.log($(this));
		if (breaki % 2 == 0) {

			$(this).remove();

			// return true;
		} else {
			$(this).removeClass("active");

		}
		breaki++;

	});
	$("#personal input.validate").each(function() {
		console.log("cleaning");

		$(this).removeClass("validate invalid valid").addClass("validate");

	});
	$('.stepper').getStep($('.stepper').getActiveStep()).removeClass('wrong');
	$(".select-dropdown").attr("name", "nombrecillo");

});

$("input[name=group1]").click(function() {
	opcion = $(this).val();
	console.log("el campo seleccionado es: " + $(this).val());

	if (opcion == 1) {
		$("#table-datatables").hide();
		$("#personal").show();
		// getIdEnrollment();
	} else {
		$("#personal").hide();
		$("#table-datatables").show();
		$("#ml_importe").val('130');
		costo_inscripcion = $("#ml_importe").val(); // 130 soles -- delegacion
		// getIdDetailEnrollment();
	}
});

var arrayProperties = new Array();

$(".enrollment").click(function() {
	$.get(gth_context_path + "/inscripcion", null, function(data, status) {
		// $("#space").empty();
		$("#space").html(data);
	});

});
// ----Function to drive the max and min characters in a specific input
// $("#dni").keyup(function(e) {
//
// console.log($("#dni").val().length);
// if ($("#dni").val().length < 8) {
// console.log("falta")
// $("#dni").next("label").attr('data-error', 'Faltan caracteres');
// $("#dni").removeClass("valid");
// $("#dni").addClass("invalid");
// } else {
//
// console.log("complete")
// $("#dni").removeClass("invalid");
// $("#dni").addClass("valid");
//
// }
// });
// $("#ml_dni").keyup(function(e) {
//
// console.log($("#ml_dni").val().length);
// if ($("#ml_dni").val().length < 8) {
// console.log("falta")
// $("#ml_dni").next("label").attr('data-error', 'Faltan caracteres');
// $("#ml_dni").removeClass("valid");
// $("#ml_dni").addClass("invalid");
// } else {
//
// console.log("complete")
// $("#ml_dni").removeClass("invalid");
// $("#ml_dni").addClass("valid");
//
// }
// });

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
var contador = 1
function insertarPersona() {
	if (opcion == 1) {
		console.log("es opcion 1")
		if (contador == 1) {
			if (change == 2) {
				var nombre = $("#name").val().toUpperCase();
				var apellido = $("#last_name").val().toUpperCase();
				var carrera = $("#career").val();
				var universidad = $("#business").val().toUpperCase();
				var dni = $("#dni").val();
				var correo = $("#email").val();
				var celular = $("#phone").val();
				var importe = costo_inscripcion;
			} else {
				var nombre = $("#name").val().toUpperCase();
				var apellido = $("#last_name").val().toUpperCase();
				var carrera = $("#career").val();
				var universidad = $("#university").val().toUpperCase();
				var dni = $("#dni").val();
				var correo = $("#email").val();
				var celular = $("#phone").val();
				var importe = costo_inscripcion;
			}

			var properties = new Object();
			properties.nombre = nombre;
			properties.apellido = apellido;
			properties.carrera = carrera;
			properties.universidad = universidad;
			properties.dni = dni;
			properties.correo = correo;
			properties.celular = celular;
			properties.tipo = change;
			properties.importe = importe;

			arrayProperties.push(properties);

			console.log(JSON.stringify(arrayProperties));

			console.log("inserta");
			
			if ($(window).width() < 600) {
				listarReporteMini();
			}else{
				listarReporte();
			}
			
			contador++
		} else {
			console.log("no se insertara por segunda vez");
		}

	} else {
		console.log("no es la opcion 1, ver op modal");

	}
};

$("#second-step").click(function() {

});

chosen = 0;
function validateFirstStep() {
	var validation = true;
	if ($('.step').first().find('input[type="radio"]:checked').length === 0) {
		validation = false;
		console.log("no selecciono opcion");

	} else {
		console.log("si selecciono");

		if (arrayProperties.length === 0) {
			if (opcion == 1) {
				console.log("i do not need you");
				if ($("#select").val() == null) {
					console.log("nada select");
					validation = false;
				} else {
					validation = true;
				}
			} else {
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
			if (opcion == 1) {
				console.log("i do not need you")

			} else {
				console.log("again you");
				console.log(validation);

				if (arrayProperties.length >= 10) {
					alertify.confirm('Confirm Title',
							'¿Seguro(a) que no desea agregar a alguien mas?',
							function() {
								alertify.success('Ok');
								// $('#feedbacker').nextStep();
								console.log("confirmacion message");

								if ($(window).width() < 600) {
									listarReporteMini();
								}else{
									listarReporte();
								}

							}, function() {
								alertify.error('Cancel')
								console.log("cancelar message");
								$('.stepper').prevStep();

								// falta una funcion para retroceder
							});
					costo_inscripcion = 130;
					validation = true;
				} else {
					alertify
							.alert(
									'Alert Title',
									'Para formar una delegación, esta debe ser conformada por 10 alumnos como mínimo',
									function() {
										alertify.success('Ok');
										// $("#first").removeClass("step
										// active
										// feedbacking").addClass("step
										// active");
										// $(".wait-feedback").remove();
									})
					validation = false;
				}

			}
		}

	}
	return validation;

}
$("#backFirst").click(function() {
	if (opcion == 1) {
		arrayProperties = new Array();
		contador = 1;
	}

});

function nextStepFirstHandler() {
	console.log("response validateFirstStep>> " + validateFirstStep());

	if (validateFirstStep()) {
		insertarPersona();
		console.log("first handler")
		// if(opcion==1){
		// listarReporte();
		// }
		$('.stepper').nextStep();
	} else {
		// $('.stepper').getStep($('.stepper').getActiveStep()).destroyFeedback();
		console.log("first handler2")

		$('.stepper').destroyFeedback();
		// $('#first').removeClass('active').addClass('wrong');
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
var open_modal = 0;

function acceptHandlerModal() {
	if (open_modal == 0) {

		console.log("entro");

		var nombre = $("#ml_name").val().toUpperCase();
		var apellido = $("#ml_last_name").val().toUpperCase();
		var carrera = $("#ml_career").val();
		var universidad = $("#ml_university").val().toUpperCase();
		var dni = $("#ml_dni").val();
		var celular = $("#ml_phone").val();
		var correo = $("#ml_email").val();

		var properties = new Object();
		properties.nombre = nombre;
		properties.apellido = apellido;
		properties.carrera = carrera;
		properties.universidad = universidad;
		properties.dni = dni;
		properties.correo = correo;
		properties.celular = celular;
		properties.tipo = 1;
		properties.importe = costo_inscripcion;

		arrayProperties.push(properties);
		var data = JSON.stringify(arrayProperties)
		console.log(JSON.stringify(arrayProperties));
	} else {

		var nombremod = $("#ml1_name").val().toUpperCase();
		var apellidomod = $("#ml1_last_name").val().toUpperCase();
		var carreramod = $("#ml1_career").val();
		var universidadmod = $("#ml1_university").val().toUpperCase();
		var dnimod = $("#ml1_dni").val();
		var celularmod = $("#ml1_phone").val();
		var correomod = $("#ml1_email").val();

		arrayProperties[pos].nombre = nombremod;
		arrayProperties[pos].apellido = apellidomod;

		arrayProperties[pos].dni = dnimod;

		arrayProperties[pos].celular = celularmod;

		arrayProperties[pos].universidad = universidadmod;

		arrayProperties[pos].carrera = carreramod;

		arrayProperties[pos].correo = correomod;

		// arrayProperties.push(properties);
		// var data = JSON.stringify(arrayProperties)
		console.log(JSON.stringify(arrayProperties));

		$("#modal2").modal("close");
		// listar();
		listarCard();

	}

	// limpiarModal();

	// $('.stepper').getStep($('.stepper').getActiveStep()).destroyFeedback();
	// $('.stepper').destroyFeedback();
	// $('.stepper').getStep($('.stepper').getActiveStep()).addClass('wrong');

	if (open_modal == 0) {
		// $('.stepper').nextStep();
		$("#modal1").modal('close');
		$('.stepper').destroyFeedback();
		$('.stepper').getStep($('.stepper').getActiveStep()).removeClass(
				'wrong');
		console.log("a punto de listar");
		// listar();
		crearCard();

	} else {
		// //
		// $('.stepper').getStep($('.stepper').getActiveStep()).destroyFeedback();
		open_modal = 0;
		$('.stepper').destroyFeedback();
		$('.stepper').getStep($('.stepper').getActiveStep()).removeClass(
				'wrong');
		console.log("herror handler");
	}
}

function someOtherFunction() {
	return true;
};

function validateThirdStep() {
	// $("#accept").click(function() {
	// console.log("validarTercerPaso");
	// subirVoucher();

	// console.log(arrayProperties);
	// var data = JSON.stringify(arrayProperties);
	// // var da = JSON.parse(arrayProperties);
	// $.get("subscribe/createEnrollment", {
	// op : data
	// }, function(response, status) {
	// console.log(response);
	// if (response == 1) {
	// alertify.alert('Success', 'Registrado correctamente', function() {
	// alertify.success('Ok');
	// // $("#first").removeClass("step active
	// // feedbacking").addClass("step active");
	// // $(".wait-feedback").remove();
	// var link = context_path
	//
	// location.href = link;
	// })
	// } else {
	// alertify.alert('Error', 'Registro fallido', function() {
	// alertify.success('Ok');
	// // $("#first").removeClass("step active
	// // feedbacking").addClass("step active");
	// // $(".wait-feedback").remove();
	// })
	// }
	// })
	//		

	// });

}

$("#accept")
		.click(
				function(e) {
					e.preventDefault();
					console.log("function upload");

					var file = $("#file-input").val();

					var form = $('#lastStepForm')[0];

					// Create an FormData object
					var datosUploadFile = new FormData(form);

					console.log(file + "  " + form + "  " + datosUploadFile);
					console.log(file);
					// data.append("idinscripcion", "56");

					if (file != "") {

						alertify
								.confirm(
										'Confirmar vacaciones',
										'Esta seguro(a) de subir este archivo?',
										function() {
											alertify.success('Ok');
											console.log(arrayProperties);
											var data = JSON
													.stringify(arrayProperties);
											// var da =
											// JSON.parse(arrayProperties);
											$
													.get(
															"subscribe/createEnrollment",
															{
																op : data
															},
															function(response,
																	status) {
																console
																		.log(response);
																if (response != 0) {
																	datosUploadFile
																			.append(
																					"idinscripcion",
																					response);
																	$
																			.ajax({
																				type : "POST",
																				enctype : 'multipart/form-data',
																				url : gth_context_path
																						+ "/subscribe/uploadfile",
																				data : datosUploadFile,
																				processData : false,
																				contentType : false,
																				cache : false,
																				timeout : 600000,
																				// beforeSend
																				// :
																				// function(
																				// xhr)
																				// {
																				// xhr
																				// .setRequestHeader(
																				// csrfHeader,
																				// csrfToken);
																				// },
																				success : function(
																						data) {
																					console
																							.log("success>"
																									+ data);

																					if (data == 1) {
																						alertify
																								.alert(
																										'Success',
																										'Excelente!. Por favor, esté atento a su correo, pronto confirmaremos su inscripción. Gracias!',
																										function() {
																											alertify
																													.success('Ok');

																											var link = gth_context_path

																											location.href = link;
																										})
																					} else {

																						alertify
																								.alert(
																										'Error',
																										'Algo inesperado ocurrió, por favor, vuelva a intentarlo más tarde.',
																										function() {
																											alertify
																													.success('Ok');
																											var link = gth_context_path

																											location.href = link;

																										})
																					}

																				},
																				error : function(
																						e) {
																					console
																							.log(
																									"No sube ",
																									e);
																					alertify
																							.alert(
																									'Error',
																									'Algo inesperado ocurrió, por favor, vuelva a intentarlo más tarde.',
																									function() {
																										alertify
																												.success('Ok');
																										// $("#first").removeClass("step
																										// active
																										// feedbacking").addClass("step
																										// active");
																										// $(".wait-feedback").remove();
																										var link = gth_context_path

																										location.href = link;
																									})

																				}
																			});

																} else {
																	alertify
																			.alert(
																					'Error',
																					'Algo inesperado ocurrió, por favor, vuelva a intentarlo más tarde.',
																					function() {
																						alertify
																								.success('Ok');
																						var link = gth_context_path

																						location.href = link;
																						// $("#first").removeClass("step
																						// active
																						// feedbacking").addClass("step
																						// active");
																						// $(".wait-feedback").remove();
																					})
																}
															})

											// ------------------------------

										}, function() {
											alertify.error('Cancel')
										});

					} else {
						alertify.alert('Error', 'Suba un documento por favor',
								function() {
									alertify.success('Ok');

								})
					}

				})

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
		s += arrayProperties[i].celular;
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

	$("#data").append(s);
	$("#data-table-row-grouping").dataTable({
		responsive : {
			details : false
		},
		// responsive: true,
		"pageLength" : 3,
		"bPaginate" : true,
		"bLengthChange" : false,
		"bFilter" : true,
		"bInfo" : false,
		"bAutoWidth" : true,
		"language" : {
			// "lengthMenu": "Display _MENU_ records per page",
			"zeroRecords" : "Nada para mostrar - disculpe",
			"info" : "Mostrando página _pag_ de _pags_",
			"infoEmpty" : "Ningún alumno agregado"
		// "infoFiltered": "(filtered from _MAX_ total records)"
		}
	// "displayLength": 2,
	// "lengthMenu": [ 2, 3, 6, 7, 8 ]
	});
	$("input[type='search']").attr("name", "search");

};

var cont = 1;
var contadiv = 1;
var move = 1;
var run = 0;
function crearCard() {

	if (cont == move) {
		console.log("se crea un nuevo div  " + move);
		console.log("numero div  " + contadiv);
		var h = "";
		h += '<div class="row" id="dash_' + contadiv + '">'
		h += '</div>'

		$("#ui-alert").append(h)
		var esconder = contadiv - 1;
		// $("#dash_" + esconder).hide();

		var m = move - 1;
		console.log("inicio" + m);
		var b = "";

		for (m; m < arrayProperties.length; m++) {
			console.log("nro" + m);
			console.log(arrayProperties[m].nombre)

			b += '<div class="col s12 m6 l3">'

			b += '		<div id="card-alert" class="card cyan darken-1">'
			b += '		<div class="card-content white-text"  style="height: 66px;">'
			b += '			<span class="card-title white-text" style="font-size: 17px; font-weight: bold;  line-height: 21px;">'
			b += arrayProperties[m].apellido + ', ' + arrayProperties[m].nombre
					+ '</span>'
			// b += ' <p>'+cont+'</p>'
			b += '		</div>'
			b += '		<div class="card-action cyan lighten-5">'
			b += '			<div class="row">'
			b += '			<div class="col s6 m6 l6 center">'
			b += '	<a'
				var run= m+1;
			b += '		class="black-text btn waves-effect carta "onclick="eliminar('
					+ run + ')"'
			b += '		style="background-color: transparent;">'
			b += '		<i class="large material-icons right "'
			b += '		style="">delete_sweep</i>'
			b += '	</a>'
			b += '	</div>'
			b += '	<div class="col s6 m6 l6 center">'
			b += '	<a'
			b += '		class="black-text btn waves-effect carta" onclick="modificar('
					+ run + ')"'
			b += '	style="background-color: transparent;"> <i'
			b += '		class="large material-icons right "'
			b += '		style="">mode_edit</i></a>'
			b += '	</div>'

			b += '	</div>'

			b += '</div>'

			b += '	</div>'

			b += '</div>'

			run++;
		}

		// $("#dash_" + contadiv).show();
		$("#dash_" + contadiv).html(b);

		move = cont + 8;
		contadiv++;
		cont++;
		console.log("cont + " + cont + ", move " + move)
		$('#pagination-long').html('');
		var last = contadiv - 1;
		$('#pagination-long').materializePagination(
				{
					align : 'center',
					lastPage : last,
					firstPage : 1,
					useUrlParameter : false,
					onClickCallback : function(requestedPage) {
						console.log('Requested page from #pagination-long: '
								+ requestedPage);
						var back = requestedPage - 1
						var forward = requestedPage + 1
						$("#dash_" + back).hide();
						$("#dash_" + forward).hide();
						$("#dash_" + requestedPage).show();
					}
				});
	

	} else {

		console.log("no es igual a los multilples de 8 " + cont);
		var c = "";
		var p = move - 9;
		// var run = 1;
		for (p; p < arrayProperties.length; p++) {
			console.log("nro" + p);
			console.log(arrayProperties[p].nombre)

			c += '<div class="col s12 m3 l3">'

			c += '		<div id="card-alert" class="card cyan darken-1">'
			c += '		<div class="card-content white-text"  style="height: 66px;">'
			c += '			<span class="card-title white-text" style="font-size: 17px; font-weight: bold;  line-height: 21px;">'
			c += arrayProperties[p].apellido + ', ' + arrayProperties[p].nombre
					+ '</span>'
			// b += ' <p>'+cont+'</p>'
			c += '		</div>'
			c += '		<div class="card-action cyan lighten-5">'
			c += '			<div class="row">'
			c += '			<div class="col s6 m6 l6 center">'
			c += '	<a'
				var run= p+1;
			c += '		class="black-text btn waves-effect carta "onclick="eliminar('
					+ run + ')"'
			c += '		style="background-color: transparent;">'
			c += '		<i class="large material-icons right "'
			c += '		style="">delete_sweep</i>'
			c += '	</a>'
			c += '	</div>'
			c += '	<div class="col s6 m6 l6 center">'
			c += '	<a'
			c += '		class="black-text btn waves-effect carta" onclick="modificar('
					+ run + ')"'
			c += '	style="background-color: transparent;"> <i'
			c += '		class="large material-icons right "'
			c += '		style="">mode_edit</i></a>'
			c += '	</div>'

			c += '	</div>'

			c += '</div>'

			c += '	</div>'

			c += '</div>'

			run++;
		}
		var mostrar = contadiv - 1;
		$("#dash_" + mostrar).html(c);
		// $("#dash_" + mostrar).show();
		cont++;
	}
	
	if (contadiv == 2) {

	} else {
		for (var j = 0; j < contadiv - 2; j++) {
			console.log(j + " click")
			$(".pagination.center-align li:last-child").click()
		}
	}

	// $("#ui-alert").html(b);
}

function listarCard() {
	var size = arrayProperties.length
	var exitdiv = contadiv - 1;
	var run = 1;
	var limite = 1;
	var p = 0;
	var c = "";
	for (var k = 0; k < exitdiv; k++) {
		console.log("vamos por el div numero " + k);
		c="";
		if (k == 0) {
			limite = p + 8;
		} else {
//			p = p + 2;
			limite = p + 8;
		}
		console.log("justo a comenzar el recorrido " + p + " - " +limite+ " - " +size);
		for (p; p < size; p++) {

			console.log("mi bucle empieza en la pos " + p)

			if (p == limite) {
				console.log("este es el limite para comenzar un nuevo div"
						+ limite);
				var mos = k + 1;
				console.log("numero del div listar " + mos)
//				c="";
//
//				$("#dash_" + mos).html('');
//				$("#dash_" + mos).html(c);
				break;
			} else {
				console.log("no estamos en el limite");
				
				
				c += '<div class="col s12 m3 l3">'

				c += '		<div id="card-alert" class="card cyan darken-1">'
				c += '		<div class="card-content white-text" style="height: 66px;">'
				c += '			<span class="card-title white-text" style="font-size: 17px; font-weight: bold;  line-height: 21px;">'
				c += arrayProperties[p].apellido + ', '
						+ arrayProperties[p].nombre + '</span>'
				// b += ' <p>'+cont+'</p>'
				c += '		</div>'
				c += '		<div class="card-action cyan lighten-5">'
				c += '			<div class="row">'
				c += '			<div class="col s6 m6 l6 center">'
				c += '	<a'

				c += '		class="black-text btn waves-effect carta "onclick="eliminar('
						+ run + ')"'
				c += '		style="background-color: transparent;">'
				c += '		<i class="large material-icons right "'
				c += '		style="">delete_sweep</i>'
				c += '	</a>'
				c += '	</div>'
				c += '	<div class="col s6 m6 l6 center">'
				c += '	<a'
				c += '		class="black-text btn waves-effect carta" onclick="modificar('
						+ run + ')"'
				c += '	style="background-color: transparent;"> <i'
				c += '		class="large material-icons right "'
				c += '		style="">mode_edit</i></a>'
				c += '	</div>'

				c += '	</div>'

				c += '</div>'

				c += '	</div>'

				c += '</div>'
			}

			run++;
		}
		var mos = k + 1;
		console.log("insertando en el div " + mos);
		$("#dash_" + mos).html('');
		$("#dash_" + mos).html(c);

	}
}

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
		a += arrayProperties[i].celular;
		a += "</td><td>";
		a += arrayProperties[i].universidad;
		a += "</td><td>";
		a += arrayProperties[i].carrera;
		a += "</td><td>";
		a += arrayProperties[i].correo;
		a += "</td><td>";
		a += "$";
		a += arrayProperties[i].importe;
		a += "</td>";

		a += "</tr>";
		cont++;
	}

	$("#reportTable").empty();

	$("#reportTable").append(createTable2());
	$("#data1").empty();
	$("#data1").append(a);

	$("#data-table-row-grouping1")
			.dataTable(

					{
						// responsive: true,
						responsive : {
							details : false
						},
						"pageLength" : 8,
						"bPaginate" : true,
						"bLengthChange" : false,
						"bFilter" : true,
						"bInfo" : false,
						"bAutoWidth" : true,
						"language" : {
							// "lengthMenu": "Display _MENU_ records per page",
							"zeroRecords" : "Nada para mostrar - disculpe",
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
							total = api.column(7).data().reduce(function(a, b) {
								return intVal(a) + intVal(b);
							}, 0);

							// Total over this page
							pageTotal = api.column(7, {
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
function listarReporteMini() {

	var a = "";
	var cont = 1;
	for ( var i in arrayProperties) {
		console.log(arrayProperties[i].nombre)
		a += "<tr><td  >";

		a += arrayProperties[i].nombre;
		a += ", ";
		a += arrayProperties[i].apellido;
		a += "</td><td>";
		a += "$";
		a += arrayProperties[i].importe;
		a += "</td>";

		a += "</tr>";
		cont++;
	}

	$("#reportTable").empty();

	$("#reportTable").append(createTable3());
	$("#data2").empty();
	$("#data2").append(a);

	$("#data-table-row-grouping2")
			.dataTable(

					{
						// responsive: true,
						responsive : {
							details : false
						},
						"pageLength" : 4,
						"bPaginate" : true,
						"bLengthChange" : false,
						"bFilter" : true,
						"bInfo" : false,
						"bAutoWidth" : true,
						"language" : {
							// "lengthMenu": "Display _MENU_ records per page",
							"zeroRecords" : "Nada para mostrar - disculpe",
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
							total = api.column(1).data().reduce(function(a, b) {
								return intVal(a) + intVal(b);
							}, 0);

							// Total over this page
							pageTotal = api.column(1, {
								page : 'current'
							}).data().reduce(function(a, b) {
								return intVal(a) + intVal(b);
							}, 0);

			
							$('tr:eq(0) td:eq(0)', api.table().footer()).html(
									"S/. " + total + ".00");
			

						}
					});

};

function createTable1() {
	// class='bordered highlight centered'
	var s = "<table id='data-table-row-grouping' class='display nowrap' cellspacing='0' width='100%'>";
	s += "<thead>";
	s += "<tr>";
	s += "<th>Nro</th>";
	// s += "<th class='hide' >N°</th>";
	s += "<th>Nombres y Apellidos</th>";
	s += "<th>Dni</th>";
	s += "<th>Celular</th>";
	s += "<th>Entidad</th>";
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
	var d = "<table id='data-table-row-grouping1' class='bordered highlight centered' cellspacing='0' width='100%'>";
	d += "<thead>";
	d += "<tr>";
	d += "<th>Nro</th>";
	d += "<th data-priority='1'>Nombres y Apellidos</th>";
	d += "<th>Dni</th>";
	d += "<th>Celular</th>";
	d += "<th>Entidad</th>";
	d += "<th>Carrera</th>";
	d += "<th>Correo</th>";
	d += "<th data-priority='2'>Costo</th>";
	d += "</tr>";
	d += "</thead>";
	d += "<tfoot>";
	// d += "<tr><th colspan='6' style='text-align:right'>Subtotal:</th>";
	// d += "<td style='text-align:center' id='total'></td></tr>";
	//
	// d += "<tr>";
	// d += "<th colspan='6' style='text-align:right' >Descuento:</th>";
	// d += "<td style='text-align:center' id='dis'></td></tr>";
	d += "<tr><th colspan='7' style='text-align:right' >Total:</th>";
	d += "<td style='text-align:center' id='dis'></td></tr></tfoot>";

	d += "<tbody id='data1'></tbody>";
	d += "</table>";
	return d;

};
function createTable3() {
	var d = "<table id='data-table-row-grouping2' class='bordered highlight centered' cellspacing='0' width='100%'>";
	d += "<thead>";
	d += "<tr>";
	d += "<th data-priority='1'>Nombres y Apellidos</th>";
	d += "<th data-priority='2'>Costo</th>";
	d += "</tr>";
	d += "</thead>";
	d += "<tfoot>";

	d += "<tr><th colspan='1' style='text-align:right' >Total:</th>";
	d += "<td style='text-align:center' id='dis'></td></tr></tfoot>";

	d += "<tbody id='data2'></tbody>";
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

$("#lastStepForm").validate({
	rules : {
		field : {
			required : true
		}
	}
});
var select_modal = 0;
$('#modal1').modal(
		{
			dismissible : false, // Modal can be dismissed by clicking
			// outside of the
			// modal
			opacity : .5, // Opacity of modal background
			inDuration : 400, // Transition in duration
			outDuration : 200, // Transition out duration
			startingTop : '4%', // Starting top style attribute
			endingTop : '10%', // Ending top style attribute
			ready : function(modal, trigger) { // Callback for Modal open.
				// Modal and
				// trigger parameters available.

				console.log(modal, trigger);

			},
			complete : function() {

				if (select_modal == 1) {
					var breaking = 1;

					var size = $(".modal-form label").length;

					$("#modal1 label").each(function() {

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

					$(".modal-form input.validate").each(
							function() {
								console.log("cleaning");

								$(this).removeClass("validate invalid valid")
										.addClass("validate");

							});

					$("#ml_name").val("");
					$("#ml_last_name").val("");
					$("#ml_career").val("");
					$("#ml_university").val("");
					$("#ml_dni").val("");
					$("#ml_email").val("");
					$("#ml_phone").val("");
				} else {
					var breaking = 1;

					var size = $(".modal-form label").length;

					$("#modal1 label").each(function() {
						// //
						// // // $(this).removeClass("modal abierto");
						// // console.log("modal abierto")
						// // console.log($(this));
						// //
						// // if (breaking % 2 == 0) {
						//
						$(this).removeClass("active");
						//
						// // return true;
						// // } else {
						// //
						// // $(this).remove();
						// // }
						// // breaking++;
					});

					$(".modal-form input.validate").each(
							function() {
								console.log("cleaning");

								$(this).removeClass("validate invalid valid")
										.addClass("validate");

							});

					$("#ml_name").val("");
					$("#ml_last_name").val("");
					$("#ml_career").val("");
					$("#ml_university").val("");
					$("#ml_dni").val("");
					$("#ml_email").val("");
					$("#ml_phone").val("");
				}

			} // Callback for Modal close

		});

$("#modal_cancel").click(function() {
	select_modal = 0
});
$("#modal_confirm").click(function() {
	select_modal = 1
});

// function getIdEnrollment() {
// $.get("subscribe/InscripcionMax", function(data, status) {
// console.log(JSON.parse(data));
// $("#enrollment").val('');
// $("#enrollment").val(data);
// });
// }

// function getIdDetailEnrollment() {
// $.get("subscribe/InscripcionDetalleMax", function(data, status) {
// console.log(JSON.parse(data));
// $("#sub_enrollment").val('');
// $("#sub_enrollment").val(data);
// });
// }

//
$("#second-header").click(function(e) {
	console.log("second step");
	// e.preventDefault();
	e.stopPropagation();
	// e.stopInmediatePropagation();
	// chosen = 1;
	// if(validateFirstStep()){
	//		
	// }else{
	// $('#first').removeClass('active').addClass('wrong');
	// }
	// me sale el anuncio si deseo agregar a alguien mas ---corregir
	// validar input universidad
	// crear form pago
});

$("#third-header").click(function(e) {
	console.log("third step");
	// e.preventDefault();
	e.stopPropagation();

});
$("#first-header").click(function(e) {
	console.log("first step");
	// e.preventDefault();
	e.stopPropagation();

});

$("#voucher").keyup(function() {
	var nro = $("#voucher").val().toUpperCase();
	$("#voucher").val(nro);
});

$("#cancel").click(function(e) {
	e.preventDefault();
	var link = gth_context_path

	location.href = link;

});

function eliminar(id) {
	console.log("eliminar");
	console.log(id);
	console.log(arrayProperties[id - 1].nombre);
	arrayProperties.splice(id - 1, 1)
	console.log(arrayProperties);
	// listar();
	listarCard();
//	move=move-1;
	cont = cont-1;

}
function modificar(id) {
	console.log("modificar");
	console.log(id);
	$("#modal2").modal('open');
	pos = id - 1;
	var name = arrayProperties[pos].nombre;
	var last_name = arrayProperties[pos].apellido;

	var id = arrayProperties[pos].dni;

	var phone = arrayProperties[pos].celular;

	var univer = arrayProperties[pos].universidad;

	var career = arrayProperties[pos].carrera;

	var email = arrayProperties[pos].correo;
	$("#ml1_name").val(name);
	$("#ml1_last_name").val(last_name);
	$("#ml1_career").val(career);
	$("#ml1_university").val(univer);
	$("#ml1_dni").val(id);
	$("#ml1_email").val(email);
	$("#ml1_phone").val(phone);
	Materialize.updateTextFields();
	open_modal = 1;
	$("#modal2 label").each(function() {

		// $(this).removeClass("modal abierto");
		console.log("modal abierto")
		console.log($(this));
		$(this).addClass("active");

		// if (breaking % 2 == 0) {
		//
		// $(this).addClass("active");
		//
		// // return true;
		// } else {
		//
		// $(this).remove();
		// }
		// breaking++;
	});
}

var select_modal = 0;
$('#modal2').modal({
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

$("#modal_edit_cancel").click(function() {
	console.log("cancelar");
	$("#modal2").modal("close");
});
$("#modal_edit_change").click(function() {
	var breaking = 1;

	var size = $(".modal-form label").length;

	$("#modal2 label").each(function() {

		// $(this).removeClass("modal abierto");
		console.log("modal abierto")
		console.log($(this));
		$(this).addClass("active");

		// if (breaking % 2 == 0) {
		//
		// $(this).addClass("active");
		//
		// // return true;
		// } else {
		//
		// $(this).remove();
		// }
		// breaking++;
	});

	$("#modal2 input.validate").each(function() {
		console.log("cleaning");

		$(this).removeClass("validate invalid valid").addClass("validate");

	});

});

$("#cleaner").click(
		function() {
			alertify.confirm('Eliminar todo',
					'¿Seguro(a) que desea eliminar todo?', function() {
						alertify.success('Ok');
						// $('#feedbacker').nextStep();
						console.log("confirmacion message");
						arrayProperties = new Array();
						$("#pagination-long").html("");
						$("#ui-alert").html("");
//						crearCard();
						cont = 1;
						move=1;
						contadiv = 1;
					}, function() {
						alertify.error('Cancel')

						// falta una funcion para retroceder
					});
		})