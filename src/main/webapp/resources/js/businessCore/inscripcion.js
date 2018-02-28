$(document).ready(function() {

	$('.dropify').dropify();
	$('select').material_select();

	$('.stepper').activateStepper();
	$(".button-collapse").sideNav();
	$("#personal").hide();
	$("#table-datatables").hide();

	autocomplete();
	$("#switcher").prop('checked', true);
	$("#mensaje_info").show();
	
	getPrecios();
});

var precio_delegacion=0;
var precio_alumno=0;
var precio_profesional=0;
function getPrecios(){
	$.get("admin/getPrecios", function(data) {

		con = JSON.parse(data);

		$.each(con, function(index, obj) {
			var estado = obj.estado;
			if (estado == 1) {
				
				precio_delegacion=obj.delegacion;
				precio_alumno=obj.alumno;
				precio_profesional=obj.profesional;
			} 


		});
		
		

	})
}

$(window).on('resize', function() {
	check()
});

// function to catch the dashboard´s width when it changes  - works on Chrome
function check() {
	if ($(window).width() < 600) {
		listarReporteMini();
	} else {
		if ($(window).width() < 990) {
			listarReporteMedium();
		} else {
			listarReporte();
		}

	}
}

$("#switcher").on("change", function() {
	var status = $(this).prop('checked');
	
	if (status == false) {
		
		$("#switcher").prop('checked', true);
	}
});

function autocomplete() {
	$('input.career').autocomplete({
		data : {
			"Ingenieria de Sistemas" : null,
			"Ingenieria Ambiental" : null,
			"Ingenieria de Alimentos" : null,
			"Administracion de Empresas" : null,
			"Ingenieria Industrial" : null
		},
		limit : 5, // The max amount of results that can be shown at once.
		// Default: Infinity.
		onAutocomplete : function(val) {

		},
		minLength : 0, // The minimum length of
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

						},
						minLength : 0, // The minimum length of
					// the input for the
					// autocomplete
					// to start. Default: 1.
					});
}

// Global variables

var costo_inscripcion = 0;
var opcion = 0;
var s = "";
var pos = 0
var change = 0;

// active dropify

var drEvent = $('.dropify-event').dropify();
drEvent.on('dropify.beforeClear', function(event, element) {
	return confirm("Do you really want to delete \"" + element.filename
			+ "\" ?");
});

drEvent.on('dropify.afterClear', function(event, element) {
	alert('File deleted');
});

// function to catch the change on select input (profesional - estudiante)
$("#select").change(function() {
	change = $("#select").val();
	
	if (change == 2) {
		$("#div_uni").addClass("hide");
		$("#div_bus").removeClass("hide");
		$("#importe_profesional").val('170')
//		costo_inscripcion = $("#importe_profesional").val(); // 170 soles
		costo_inscripcion = precio_profesional;
		
		$(".select-dropdown").attr("name", "nombrecillo");
	} else {
		$("#div_bus").addClass("hide");
		$("#div_uni").removeClass("hide");
		$("#importe_alumno").val('140');
//		costo_inscripcion = $("#importe_alumno").val(); // 140 soles
		costo_inscripcion = precio_alumno;
		$(".select-dropdown").attr("name", "nombrecillo");
	}

	$("#personal input").each(function() {
		$(this).removeAttr("disabled");
		$(this).not($("#personal input").first()).val("");
	})
	$("#first-step").click();
	var breaki = 1
	$("#personal label").not(".hide label").each(function() {

		if (breaki % 2 == 0) {

			$(this).remove();

			// return true;
		} else {
			$(this).removeClass("active");

		}
		breaki++;

	});
	$("#personal input.validate").each(function() {
		

		$(this).removeClass("validate invalid valid").addClass("validate");

	});
	$('.stepper').getStep($('.stepper').getActiveStep()).removeClass('wrong');
	$(".select-dropdown").attr("name", "nombrecillo");

});

$("input[name=group1]")
		.click(
				function() {
					opcion = $(this).val();
					

					if (opcion == 1) {
						$("#table-datatables").hide();
						$("#personal").show();
						Materialize.Toast.removeAll();
						// getIdEnrollment();
					} else {
						$("#personal").hide();
						$("#table-datatables").show();
						$("#ml_importe").val('130');
//						costo_inscripcion = $("#ml_importe").val(); // delegacion 130 soles
						
						costo_inscripcion=precio_delegacion;
						// --
						// delegacion
						var $toastContent = $('<span class="center">La delegación debe estar conformada por 10 alumnos como mínimo.</span>')

						Materialize.toast($toastContent, 4000);
						// getIdDetailEnrollment();
					}
				});

var arrayProperties = new Array();

// show the window-steps-enrollment
$(".enrollment").click(function() {
	$.get(gth_context_path + "/inscripcion", null, function(data, status) {
		// $("#space").empty();
		$("#space").html(data);
	});

});

var contador = 1
function insertarPersona() {
	if (opcion == 1) {
		
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

		

			if ($(window).width() < 600) {
				listarReporteMini();
			} else {
				if ($(window).width() < 990) {
					listarReporteMedium();
				} else {
					listarReporte();
				}

			}

			contador++
		} else {
			
		}

	} else {
		

	}
};

chosen = 0;
function validateFirstStep() {
	var validation = true;
	if ($('.step').first().find('input[type="radio"]:checked').length === 0) {
		validation = false;
	

	} else {
		

		if (arrayProperties.length === 0) {
			if (opcion == 1) {
				
				if ($("#select").val() == null) {
					
					validation = false;
				} else {
					validation = true;
				}
			} else {
				alertify.alert('Alerta',
						'Usted no ha agregado a ninguna persona', function() {
							alertify.success('Ok');

						})
				validation = false;

			}
		} else {
			if (opcion == 1) {
				

			} else {
		

				if (arrayProperties.length >= 10) {
					alertify.confirm('Confirmación',
							'¿Seguro(a) que no desea agregar a alguien mas?',
							function() {
								alertify.success('Ok');

							

								if ($(window).width() < 600) {
									listarReporteMini();
								} else {
									if ($(window).width() < 990) {
										listarReporteMedium();
									} else {
										listarReporte();
									}

								}

							}, function() {
								alertify.error('Cancel')
								
								$('.stepper').prevStep();

							});
					costo_inscripcion = 130;
					validation = true;
				} else {
					alertify
							.alert(
									'Alerta',
									'Para formar una delegación, esta debe ser conformada por 10 alumnos como mínimo',
									function() {
										alertify.success('Ok');

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


	if (validateFirstStep()) {
		insertarPersona();
		

		$('.stepper').nextStep();
	} else {
		// $('.stepper').getStep($('.stepper').getActiveStep()).destroyFeedback();
		

		$('.stepper').destroyFeedback();
		// $('#first').removeClass('active').addClass('wrong');
		$('.stepper').getStep($('.stepper').getActiveStep()).addClass('wrong');
	}
}

var open_modal = 0;
var contador_dele = 1;
function acceptHandlerModal() {
	
	if (open_modal == 0) {


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
		if (contador_dele == 1) {
			properties.tipo = 3; // tipo delegado
			$("#mensaje_info").hide();
		} else {
			properties.tipo = 1;
		}

		properties.importe = costo_inscripcion;

		arrayProperties.push(properties);
		var data = JSON.stringify(arrayProperties)
	

		contador_dele++;

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

	

		$("#modal2").modal("close");

		listarCard();

	}

	if (open_modal == 0) {

		$("#modal1").modal('close');
		$('.stepper').destroyFeedback();
		$('.stepper').getStep($('.stepper').getActiveStep()).removeClass(
				'wrong');
		

		crearCard();

	} else {

		open_modal = 0;
		$('.stepper').destroyFeedback();
		$('.stepper').getStep($('.stepper').getActiveStep()).removeClass(
				'wrong');
	
	}
}

function someOtherFunction() {
	return true;
};

function validateThirdStep() {

}

$("#accept")
		.click(
				function(e) {
					e.preventDefault();
					

					var file = $("#file-input").val();

					var form = $('#lastStepForm')[0];

					// Create an FormData object
					var datosUploadFile = new FormData(form);

			

					if (file != "") {

						alertify
								.confirm(
										'Confirmación',
										'Esta seguro(a) de subir este archivo?',
										function() {
											alertify.success('Ok');
											
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

																				success : function(
																						data) {
																					

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

	});
	$("input[type='search']").attr("name", "search");

};

var cont = 1;
var contadiv = 1;
var move = 1;
var run = 0;
function crearCard() {

	if (cont == move) {
	
		var h = "";
		h += '<div class="row" id="dash_' + contadiv + '">'
		h += '</div>'

		$("#ui-alert").append(h)
		var esconder = contadiv - 1;

		var m = move - 1;
		
		var b = "";

		for (m; m < arrayProperties.length; m++) {
	

			b += '<div class="col s12 m6 l3">'

			b += '		<div id="card-alert" class="card cyan darken-1">'
			b += '		<div class="card-content white-text"  style="height: 66px; padding: 0px;">'
			b += '			<span class="card-title white-text" style="font-size: 17px; font-weight: bold;  line-height: 60px;   text-align: center;">'
			b += arrayProperties[m].apellido + ', ' + arrayProperties[m].nombre
					+ '</span>'

			b += '		</div>'
			b += '		<div class="card-action cyan lighten-5">'
			b += '			<div class="row">'
			b += '			<div class="col s6 m6 l6 center">'
			b += '	<a'
			var run = m + 1;
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

		$("#dash_" + contadiv).html(b);

		move = cont + 8;
		contadiv++;
		cont++;
	
		$('#pagination-long').html('');
		var last = contadiv - 1;
		$('#pagination-long').materializePagination(
				{
					align : 'center',
					lastPage : last,
					firstPage : 1,
					useUrlParameter : false,
					onClickCallback : function(requestedPage) {
						
						var back = requestedPage - 1
						var forward = requestedPage + 1
						$("#dash_" + back).hide();
						$("#dash_" + forward).hide();
						$("#dash_" + requestedPage).show();
					}
				});

	} else {

		var c = "";
		var p = move - 9;
		// var run = 1;
		for (p; p < arrayProperties.length; p++) {
			

			c += '<div class="col s12 m3 l3">'

			c += '		<div id="card-alert" class="card cyan darken-1">'
			c += '		<div class="card-content white-text" style="height: 66px; padding: 0px;">'
			c += '			<span class="card-title white-text" style="font-size: 17px; font-weight: bold;  line-height: 60px;   text-align: center;">'
			c += arrayProperties[p].apellido + ', ' + arrayProperties[p].nombre
					+ '</span>'

			c += '		</div>'
			c += '		<div class="card-action cyan lighten-5">'
			c += '			<div class="row">'
			c += '			<div class="col s6 m6 l6 center">'
			c += '	<a'
			var run = p + 1;
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
		
			$(".pagination.center-align li:last-child").click()
		}
	}

	// $("#ui-alert").html(b);
}
//function to list the card-group
function listarCard() {
	var size = arrayProperties.length
	var exitdiv = contadiv - 1;
	var run = 1;
	var limite = 1;
	var p = 0;
	var c = "";
	for (var k = 0; k < exitdiv; k++) {
	
		c = "";
		if (k == 0) {
			limite = p + 8;
		} else {
			// p = p + 2;
			limite = p + 8;
		}

		for (p; p < size; p++) {


			if (p == limite) {
			
				var mos = k + 1;
			

				break;
			} else {
			

				c += '<div class="col s12 m3 l3">'

				c += '		<div id="card-alert" class="card cyan darken-1">'
				c += '		<div class="card-content white-text" style="height: 66px;">'
				c += '			<span class="card-title white-text" style="font-size: 17px; font-weight: bold;  line-height: 21px;">'
				c += arrayProperties[p].apellido + ', '
						+ arrayProperties[p].nombre + '</span>'
				
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
	
		$("#dash_" + mos).html('');
		$("#dash_" + mos).html(c);

	}
}

function listarReporte() {

	var a = "";
	var cont = 1;
	for ( var i in arrayProperties) {

		a += "<tr><td  >";
		a += cont;
		a += "</td>";
		a += "<td>";
		a += arrayProperties[i].nombre;
		a += ", ";
		a += arrayProperties[i].apellido;
		a += "</td><td>";
		if (arrayProperties[i].tipo == 1) {
			a += "Alumno"
		} else {
			if (arrayProperties[i].tipo == 3) {
				a += "Delegado"
			} else {
				a += "Profesional"
			}
		}

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

							
							var size = arrayProperties.length;
							

							// Remove the formatting to get integer data for
							// summation
							var intVal = function(i) {
								return typeof i === 'string' ? i.replace(
										/[\$,]/g, '') * 1
										: typeof i === 'number' ? i : 0;
							};

							// Total over all pages
							total = api.column(8).data().reduce(function(a, b) {
								return intVal(a) + intVal(b);
							}, 0);

							// Total over this page
							pageTotal = api.column(8, {
								page : 'current'
							}).data().reduce(function(a, b) {
								return intVal(a) + intVal(b);
							}, 0);

							$('tr:eq(0) td:eq(0)', api.table().footer()).html(
									"S/. " + total + ".00");

						}
					});

};
function listarReporteMini() {

	var a = "";
	var cont = 1;
	for ( var i in arrayProperties) {
		
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

function listarReporteMedium() {

	var a = "";
	var cont = 1;
	for ( var i in arrayProperties) {
		
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
		a += arrayProperties[i].correo;
		a += "</td><td>";
		a += "$";
		a += arrayProperties[i].importe;
		a += "</td>";

		a += "</tr>";
		cont++;
	}

	$("#reportTable").empty();

	$("#reportTable").append(createTable4());
	$("#data3").empty();
	$("#data3").append(a);

	$("#data-table-row-grouping3")
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
							

							// Remove the formatting to get integer data for
							// summation
							var intVal = function(i) {
								return typeof i === 'string' ? i.replace(
										/[\$,]/g, '') * 1
										: typeof i === 'number' ? i : 0;
							};

							// Total over all pages
							total = api.column(4).data().reduce(function(a, b) {
								return intVal(a) + intVal(b);
							}, 0);

							// Total over this page
							pageTotal = api.column(4, {
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
	d += "<th>Tipo</th>";
	d += "<th>Dni</th>";
	d += "<th>Celular</th>";
	d += "<th>Entidad</th>";
	d += "<th>Carrera</th>";
	d += "<th>Correo</th>";
	d += "<th data-priority='2'>Costo</th>";
	d += "</tr>";
	d += "</thead>";
	d += "<tfoot>";

	d += "<tr><th colspan='8' style='text-align:right' >Total:</th>";
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

function createTable4() {
	var d = "<table id='data-table-row-grouping3' class='bordered highlight centered' cellspacing='0' width='100%'>";
	d += "<thead>";
	d += "<tr>";
	d += "<th>Nro</th>";
	d += "<th data-priority='1'>Nombres y Apellidos</th>";
	d += "<th>Dni</th>";
	d += "<th>Correo</th>";
	d += "<th data-priority='2'>Costo</th>";
	d += "</tr>";
	d += "</thead>";
	d += "<tfoot>";

	d += "<tr><th colspan='4' style='text-align:right' >Total:</th>";
	d += "<td style='text-align:center' id='dis'></td></tr></tfoot>";

	d += "<tbody id='data3'></tbody>";
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


			},
			complete : function() {

				if (select_modal == 1) {
					var breaking = 1;

					var size = $(".modal-form label").length;

					$("#modal1 label").each(function() {

						// $(this).removeClass("modal abierto");
					

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
					
						$(this).removeClass("active");
						
					});

					$(".modal-form input.validate").each(
							function() {
							

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

$("#second-header").click(function(e) {
	
	e.stopPropagation();

});

$("#third-header").click(function(e) {
	// e.preventDefault();
	e.stopPropagation();

});
$("#first-header").click(function(e) {
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

	arrayProperties.splice(id - 1, 1)

	// listar();
	listarCard();
	// move=move-1;
	cont = cont - 1;

}
function modificar(id) {

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

		$(this).addClass("active");

		
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


	},
	complete : function() {

	} // Callback for Modal close

});

$("#modal_edit_cancel").click(function() {

	$("#modal2").modal("close");
});
$("#modal_edit_change").click(function() {
	var breaking = 1;

	var size = $(".modal-form label").length;

	$("#modal2 label").each(function() {

		$(this).addClass("active");

		
	});

	$("#modal2 input.validate").each(function() {

		$(this).removeClass("validate invalid valid").addClass("validate");

	});

});

$("#cleaner").click(
		function() {
			alertify.confirm('Eliminar todo',
					'¿Seguro(a) que desea eliminar todo?', function() {
						alertify.success('Ok');

						arrayProperties = new Array();
						$("#pagination-long").html("");
						$("#ui-alert").html("");
						// crearCard();
						cont = 1;
						move = 1;
						contadiv = 1;
					}, function() {
						alertify.error('Cancel')

						
					});
		})