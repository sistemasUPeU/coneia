$(document).ready(function() {

	$('select').material_select();

});

var change = 0;
var tipo = 0;
var tipodel = 0;
var idinscripcion = 0;
var arrayProperties = new Array();
var back = 0;
function confirmarModal(id) {

	idinscripcion = id;
	for (var i = 0; i < tipo.length; i++) {
		if (tipo[i].idinscripcion == idinscripcion) {

			var m = "";
			m += '	<p class="card-title grey-text text-darken-4">'

			m += '	<i class="small material-icons prefix small cyan-text text-darken-2"'
			m += '	style="margin-right: 6%; vertical-align: -8px;">person</i>'
					+ tipo[i].nombre
			m += '	</p>'
			m += '<p>'
			m += '	<i'
			m += '		class="small material-icons prefix small cyan-text text-darken-2"'
			m += '		style="margin-right: 6%;vertical-align: -8px;">person_outline</i>'
					+ tipo[i].apellidos
			m += '</p>'
			m += '<p>'
			m += '<i'
			m += '	class="small material-icons prefix small cyan-text text-darken-2"'
			m += '	style="margin-right: 6%;vertical-align: -8px;">perm_identity</i>'
					+ tipo[i].dni
			m += '</p>'
			m += '<p>'
			m += '	<i'
			m += '	class="small material-icons prefix small cyan-text text-darken-2"'
			m += 'style="margin-right: 6%;vertical-align: -8px;">attach_money</i>'
					+ tipo[i].importe

			m += '</p>'

			$("#column1").html(m);
			var n = "";
			n += '<p>'
			n += '<i class="small material-icons prefix small cyan-text text-darken-2"'
			n += 'style="margin-right: 6%;vertical-align: -8px;">phone_android</i>'
					+ tipo[i].celular
			n += '	</p>'
			n += '<p>'
			n += '<i class="small material-icons prefix small cyan-text text-darken-2"'
			n += '	style="margin-right: 6%;vertical-align: -8px;">business</i>'
					+ tipo[i].entidad
			n += '	</p>'
			n += '	<p>'
			n += '	<i'
			n += '	class="small material-icons prefix small cyan-text text-darken-2"'
			if (tipo[i].tipo == 1) {
				n += '	style="margin-right: 6%;vertical-align: -8px;">person_pin</i> Alumno'
			} else {
				if (tipo[i].tipo == 2) {
					n += '	style="margin-right: 6%;vertical-align: -8px;">person_pin</i> Profesional'
				}
			}

			n += '</p>'
			n += '<p>'
			n += '<i class="small material-icons prefix small cyan-text text-darken-2"'
			n += '	style="margin-right: 6%;vertical-align: -8px;">credit_card</i>'
					+ tipo[i].nro
			n += '	</p>'

			$("#column2").html(n);

			var u = "";
			// u += '<div id="img_open" class="material-placeholder">'
			u += '<div class="container" style="width:80%"><img class="materialboxed" '
			u += '	style=" height: 330px; "'
			u += 'src="' + coneia_context_path + '/resources/files/'
					+ tipo[i].url + '" '

			u += 'alt="sample"'
			u += 'data-caption="Esc para volver" ></div>'
				
				
				var b = "";
			b="<embed src='" + coneia_context_path + '/admin/viewdoc?nombre=' + tipo[i].url + "' style='width: 100%; height: 330px; ' type='application/pdf'>"
				

			var tipofile = tipo[i].url.split(".")[1];
			if (tipofile=="pdf"){
				$("#picture").html(b);
			}else{
				$("#picture").html(u);
			}
				

			
			$('.materialboxed').materialbox();
		}

	}
	$("#message").val("");
	$("#message").prop('disabled', true);
	$("#div_message label").addClass("active");
	$("#modal3").modal('open');
	$("#trueway").removeClass('hide');

}

$('#modal3').modal({
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
$('#modal4').modal({
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

$("#get_selected").change(function() {
	change = $("#get_selected").val();

	if (change == 1) {

		listar();
	} else {

		listarDelegacion();

	}

});

function listar() {
	$
			.get(
					coneia_context_path + "/admin/responsew",
					function(data) {

						tipo = JSON.parse(data);

						var h = "";
						var rounds = 0
						if (tipo.length > 12) {
							rounds = 12;
						} else {
							rounds = tipo.length;
						}

						for (var i = 0; i < rounds; i++) {

							h += '<div class="col s12 m6 l4">'
							h += '	<div id="profile-card" class="card">'
							h += '		<div class="card-image waves-effect waves-block waves-light"'
							h += '		style="height: 100px;">'
							h += '		<img class="activator"'
							h += '		src="' + coneia_context_path
									+ '/resources/images/user-profile-bg.jpg"'
							h += '		alt="user background">'
							h += '	</div>'
							h += '	<div class="card-content" style="    padding-bottom: 0px;">'
							h += '	<a class="btn-floating btn-large btn-move-up waves-effect waves-light red darken-4 left"'
							h += '		id="'
									+ tipo[i].idinscripcion
									+ '" onclick="deleteInscripcion(this.id,1)">'
							h += '		<i class="material-icons prefix">delete_forever</i>'

							h += '	</a>'
							// h += ' <img style="top: 60px;"'
							// h += ' src="' + coneia_context_path
							// + '/resources/images/avatar.jpg" alt=""'
							// h += ' class="circle responsive-img activator
							// card-profile-image">'
							h += '	<a class="btn-floating btn-large btn-move-up waves-effect waves-light darken-2 right modal-trigger"'
							h += '		id="'
									+ tipo[i].idinscripcion
									+ '" onclick="confirmarModal(this.id)" href="#modal3" style="right: 5px;">'
							h += '		<i class="material-icons prefix">mode_edit</i>'

							h += '	</a>'

							h += '<span class="card-title center" style="font-size:15px; padding-top:15px; margin: 0;"><b>'
									+ tipo[i].nombre + '</b></span>'
							h += '	<p  class="center"style="line-height: 30px; font-size: 15px; margin: 0;">'
							h += tipo[i].fecha + '<p>'

							// h += '<div class="row">'
							// h += ' <p class="left" style ="font-size: 15px;"'
							// h += ' class="card-title activator grey-text
							// text-darken-4 left"><b>'
							// + tipo[i].nombre
							// h += ' </b></p> <p class="right"
							// style="line-height: 30px; font-size: 15px;">'
							// h += tipo[i].fecha + '</p>'
							// h += ' </div>'
							h += '</div>'
							h += '</div>'
							h += '</div>'
						}

						$("#pizarra").html(h);

					});
}

function deleteInscripcion(id, opcion) {

	
	alertify
			.confirm(
					'Confirmación',
					'¿Está seguro(a) de eliminar esta inscripción?',
					function() {
						alertify.success('Ok');
						$
								.get(
										coneia_context_path
												+ "/admin/deleteins",
										{
											id : id
										},
										function(data) {
											

											if (data == 1) {
												alertify
														.alert(
																'Excelente',
																'La inscripción se eliminó',
																function() {
																	alertify
																			.success('Ok');

																});

												if (opcion == 1) {
													listar();
												} else {
													listarDelegacion();
												}
											} else {
												alertify
														.alert(
																'Error',
																'Ocurrió un problema al intentar eliminar la inscripción',
																function() {
																	alertify
																			.success('Ok');

																});
											}

										});
					}, function() {
						alertify.error('Cancel')
					});

}

function listarDelegacion() {

	$
			.get(
					coneia_context_path + "/admin/resdelegacion",
					function(data) {

						tipodel = JSON.parse(data);

						var idins = 0;

						var arrayid = [];

						var arrayfecha = [];

						for (var i = 0; i < tipodel.length; i++) {

							// array.push(i);
							if (i == 0) {
								idins = tipodel[i].idinscripcion;
								arrayid.push(tipodel[i].idinscripcion);

								arrayfecha.push(tipodel[i].fecha);
							} else {
								if (tipodel[i].idinscripcion != idins) {
									arrayid.push(tipodel[i].idinscripcion)

									arrayfecha.push(tipodel[i].fecha);
									idins = tipodel[i].idinscripcion;
								}
							}
						}

						var h = "";
						var rounds1 = 0
						if (arrayid.length > 12) {
							rounds1 = 12;
						} else {
							rounds1 = arrayid.length;
						}

						for (var i = 0; i < rounds1; i++) {

							h += '<div class="col s12 m6 l4">'
							h += '	<div id="profile-card" class="card">'
							h += '		<div class="card-image waves-effect waves-block waves-light"'
							h += '		style="height: 100px;">'
							h += '		<img class="activator"'
							h += '		src="' + coneia_context_path
									+ '/resources/images/user-bg.jpg"'
							h += '		alt="user background">'

							h += '	</div>'

							h += '	<div class="card-content" style="    padding-bottom: 0px;">'

							h += '	<a class="btn-floating btn-large btn-move-up waves-effect waves-light red darken-4 left"'
							h += '		id="'
									+ arrayid[i]
									+ '" onclick="deleteInscripcion(this.id,2)" >'
							h += '		<i class="material-icons prefix">delete_forever</i>'

							h += '	</a>'

							// h += ' <img style="top: 60px;"'
							// h += ' src="' + coneia_context_path
							// + '/resources/images/avatar.jpg" alt=""'
							// h += ' class="circle responsive-img activator
							// card-profile-image">'
							h += '	<a class="btn-floating btn-large btn-move-up waves-effect waves-light green accent-3 right modal-trigger"'
							h += '		id="'
									+ arrayid[i]
									+ '" onclick="confirmarModalDelegacion(this.id)" href="#modal4" style="right: 5px;">'
							h += '		<i class="material-icons prefix">mode_edit</i>'

							h += '	</a>'
							h += '<span class="card-title center" style="font-size:18px; padding-top:15px; margin: 0;"><b>Del. Nº '
									+ arrayid[i] + '</b></span>'
							h += '	<p  class="center"style="line-height: 30px; font-size: 15px; margin: 0;">'
							h += arrayfecha[i] + '<p>'
							// h += ' </div>'
							h += '</div>'
							h += '</div>'
							h += '</div>'
						}

						$("#pizarra").html(h);
						//
						//
						//
					});

}

function confirmarModalDelegacion(id) {

	idinscripcion = id;

	arrayProperties = new Array();

	for (var i = 0; i < tipodel.length; i++) {
		if (idinscripcion == tipodel[i].idinscripcion) {

			var properties = new Object();
			properties.nombre = tipodel[i].nombre;
			properties.apellidos = tipodel[i].apellidos;
			properties.carrera = tipodel[i].carrera;
			properties.entidad = tipodel[i].entidad;
			properties.dni = tipodel[i].dni;
			properties.correo = tipodel[i].correo;
			properties.celular = tipodel[i].celular;
			properties.tipo = tipodel[i].tipo;
			properties.fecha = tipodel[i].fecha;
			properties.url = tipodel[i].url;
			properties.idinscripcion = tipodel[i].idinscripcion;
			properties.importe = tipodel[i].importe;

			arrayProperties.push(properties);

		}
	}

	showTable();
}

$("#observar").click(function() {

	$("#message").prop('disabled', false);
	$("#div_message label").addClass("active");

	$("#trueway").addClass("hide");
	$("#falseway").removeClass("hide");

	// $("#message").focus();
})
$("#back").click(function() {
	$("#message").val("");
	// addClass("active");
	$("#message").prop('disabled', true);
	$("#falseway").addClass("hide");
	$("#trueway").removeClass("hide");

	// $("#message").focus();
})

$("#enviarConfirmacion").click(
		function() {
			$("#trueway").addClass("hide");
			back = 1;
			var mensaje = "";

			// mostrando loader
			$('#loader-wrap').fadeIn('fast');
			$('.progress').fadeIn('fast');

			$.get(coneia_context_path + "/admin/getemails", {
				op : 1,
				idinscripcion : idinscripcion,
				sms : mensaje,
				opcion : 1
			}, function(data, status) {

				if (data == '1') {
					$('.progress').delay(1000).fadeOut('fast');
					$('#loader-wrap').delay(1000).fadeOut('fast');
					alertify.alert('Alert Title',
							'Mensaje de confirmación enviado exitosamente',
							function() {
								alertify.success('Ok');
								$("#modal3").modal('close');
								$(".lean-overlay").css("opacity", "0");

								actualizarEstadoInscripcion(idinscripcion, 1);

							});
				} else {
					alertify.alert('Alert Title',
							'Ocurrio un problema en el envio del mensaje',
							function() {
								alertify.success('Ok');

							});
				}
			})

		});

$("#enviarObservacion").click(
		function() {
			back = 1;
			var mensaje = $("#message").val();
			$("#falseway").addClass("hide");

			$('#loader-wrap').fadeIn('fast');
			$('.progress').fadeIn('fast');

			$.get(coneia_context_path + "/admin/getemails", {
				op : 2,
				idinscripcion : idinscripcion,
				sms : mensaje,
				opcion : 1
			}, function(data, status) {

				if (data == '1') {
					$('.progress').delay(1000).fadeOut('fast');
					$('#loader-wrap').delay(1000).fadeOut('fast');
					alertify.alert('Alert Title',
							'Mensaje de observación enviado exitosamente',
							function() {
								alertify.success('Ok');
								$("#modal3").modal('close');
								$(".lean-overlay").css("opacity", "0");
								actualizarEstadoInscripcion(idinscripcion, 2);

							});

				}
			})

		});

function actualizarEstadoInscripcion(idinscripcion, estado) {

	$.get(coneia_context_path + "/admin/updatestate", {
		idinscripcion : idinscripcion,
		estado : estado
	}, function(data, status) {

		if (data == '1') {

			alertify.alert('Alert Title', 'Inscripcion aprobada', function() {
				alertify.success('Ok');
				if (back == 1) {
					listar();
				} else {
					if (back == 2) {
						listarDelegacion();
					}
				}
			});

		} else {
			if (data == '2') {

				alertify.alert('Alert Title', 'Inscripcion observada',
						function() {
							alertify.success('Ok');
							if (back == 1) {
								listar();
							} else {
								if (back == 2) {
									listarDelegacion();
								}
							}
						});
			} else {

				alertify.alert('Alert Title',
						'Error al actualizar la inscripcion', function() {
							alertify.success('Ok');

						});
			}
		}
	});

}
var u = "";
function showTable() {

	var a = "";
	var cont = 1;
	for ( var i in arrayProperties) {

		$("#title").html(
				"Evaluación de Inscripción: Delegación Nº "
						+ arrayProperties[i].idinscripcion);

		u = "";
		u += '<div class="container" style="width:80%"><img class="materialboxed" '
		u += '	style="height: 380px; "'
		u += 'src="' + coneia_context_path + '/resources/files/'
				+ arrayProperties[i].url + '" '
		u += 'alt="sample"'
		u += 'data-caption="Esc para volver" ></div>'

			
			var c = "";
		c="<embed src='" + coneia_context_path + '/admin/viewdoc?nombre=' + arrayProperties[i].url + "' style='width: 100%; height: 540px; ' type='application/pdf'>"
			

					
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
		a += arrayProperties[i].celular;
		a += "</td><td>";
		a += arrayProperties[i].entidad;
		a += "</td><td>";
		a += arrayProperties[i].carrera;
		a += "</td><td>";
		a += arrayProperties[i].correo;
		a += "</td><td>";
		a += arrayProperties[i].importe; // deberia ser 130 soles
		// a += costo_inscripcion;
		a += "</td>";

		a += "</tr>";
		cont++;
	}

	$("#tablegroup").empty();

	$("#tablegroup").append(createTable2());
	$("#data1").empty();
	$("#data1").append(a);

	$("#data-table-row-grouping1")
			.dataTable(

					{
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
							total = api.column(7).data().reduce(function(a, b) {
								return intVal(a) + intVal(b);
							}, 0);

							// Total over this page
							pageTotal = api.column(7, {
								page : 'current'
							}).data().reduce(function(a, b) {
								return intVal(a) + intVal(b);
							}, 0);

							$('tr:eq(0) td:eq(0)', api.table().footer()).html(
									"S/. " + total + ".00");

						}
					});

	
	var tipod = arrayProperties[i].url.split(".")[1];
	if (tipod=="pdf"){
		$("#picture_del").html(c);
	}else{
		$("#picture_del").html(u);
	}
	$('.materialboxed').materialbox();
	$("#message_del").val("");
	$("#message_del").prop('disabled', true);
	$("#div_message_del label").addClass("active");
	$("#modal4").modal('open');

	$("#trueway_del").removeClass('hide');

	$("#data-table-row-grouping1_filter").after(
			"<div  id='hugme' style='overflow-x:auto; clear: both;'></div>");
	$("#data-table-row-grouping1").appendTo('#hugme');
	// $('#data-table-row-grouping1').DataTable( );

};

function createTable2() {

	var d = "<table id='data-table-row-grouping1' class='bordered highlight centered' >";
	d += "<thead>";
	d += "<tr>";
	d += "<th>Nro</th>";
	// s += "<th class='hide' >N°</th>";
	d += "<th>Nombres y Apellidos</th>";
	d += "<th>Dni</th>";
	d += "<th>Celular</th>";
	d += "<th>Entidad</th>";
	d += "<th>Carrera</th>";
	d += "<th>Correo</th>";
	d += "<th>Costo</th>";
	d += "</tr>";
	d += "</thead>";
	d += "<tfoot>";

	d += "<tr><th colspan='7' style='text-align:right' >Total:</th>";
	d += "<td style='text-align:center' id='dis'></td></tr></tfoot>";

	d += "<tbody id='data1'></tbody>";
	d += "</table>";

	return d;

};

$("#observar_del").click(function() {

	$("#message_del").prop('disabled', false);
	$("#div_message_del label").addClass("active");

	$("#trueway_del").addClass("hide");
	$("#falseway_del").removeClass("hide");

	// $("#message").focus();
})
$("#back_del").click(function() {
	$("#message_del").val("");
	// addClass("active");
	$("#message_del").prop('disabled', true);
	$("#falseway_del").addClass("hide");
	$("#trueway_del").removeClass("hide");

	// $("#message").focus();
})

$("#enviarConfirmacion_del").click(
		function() {
			$("#trueway_del").addClass("hide");
			back = 2;
			var mensaje = "";

			$('#loader-wrap1').fadeIn('fast');
			$('.progress').fadeIn('fast');

			$.get(coneia_context_path + "/admin/getemails", {
				op : 1,
				idinscripcion : idinscripcion,
				sms : mensaje,
				opcion : 2
			}, function(data, status) {

				if (data == '1') {
					$('.progress').delay(1000).fadeOut('fast');
					$('#loader-wrap1').delay(1000).fadeOut('fast');
					alertify.alert('Alert Title',
							'Mensaje de confirmación enviado exitosamente',
							function() {
								alertify.success('Ok');
								$("#modal4").modal('close');

								actualizarEstadoInscripcion(idinscripcion, 1);

							});
				} else {
					alertify.alert('Alert Title',
							'Ocurrio un problema en el envio del mensaje',
							function() {
								alertify.success('Ok');

							});
				}
			})

		});

$("#enviarObservacion_del").click(
		function() {
			back = 2;
			var mensaje = $("#message_del").val();
			$("#falseway_del").addClass("hide");
			// $("#trueway_del").removeClass("hide");
			$('#loader-wrap1').fadeIn('fast');
			$('.progress').fadeIn('fast');
			$.get(coneia_context_path + "/admin/getemails", {
				op : 2,
				idinscripcion : idinscripcion,
				sms : mensaje,
				opcion : 2
			}, function(data, status) {

				if (data == '1') {
					$('.progress').delay(1000).fadeOut('fast');
					$('#loader-wrap1').delay(1000).fadeOut('fast');
					alertify.alert('Alert Title',
							'Mensaje de observación enviado exitosamente',
							function() {
								alertify.success('Ok');
								$("#modal4").modal('close');

								actualizarEstadoInscripcion(idinscripcion, 2);

							});
				}
			})

		});
