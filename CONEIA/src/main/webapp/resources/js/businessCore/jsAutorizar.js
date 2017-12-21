		$(document)
				.ready(
						function() {
							$
									.getJSON(
											gth_context_path
													+ "/autorizacion/listas",
											"opc=con_autorizar",
											function(objJson) {
												var lista = objJson.datos.List_id_Autorizacion;
												if (lista.length > 0) {
													var s = "";
													for (var i = 0; i < lista.length; i++) {
														var a = parseInt(i) + 1;
														var MFL = parseInt(lista[i].ES_MFL);
														var Motivo = parseInt(lista[i].LI_MOTIVO);
														var plazo = parseInt(lista[i].VAL_PLAZO);
														var fe_creacion = new Date(
																lista[i].FE_CREACION);
														var p = "";
														var f = "";
														var t = "";
														var ct = "";
														(Motivo === 1) ? p = "Trabajador Nuevo"
																: ((Motivo === 2) ? p = "Renovación"
																		: p = "No Registrado");
														(MFL === 1) ? f = "Si"
																: f = "No";
														(plazo === 1) ? t = "Cumplió Plazo"
																: t = "No Cumplió";
														(plazo === 1) ? ct = "green accent-3"
																: ct = "red darken-1";
														s += '<tr>';
														s += '<td>' + a
																+ '</td>';
														s += '<td><button class="btn dropdown-button green accent-3" data-activates="dropdown1">';
														s += '<i class="mdi-action-settings"></i>';
														s += '</button>';

														s += '<ul id="dropdown1" class="dropdown-content">';
														s += '<li><a href="#!" class="-text">Proceso</a>';
														s += '</li>';
														s += '<li><a href="#!" class="-text">Horario</a>';
														s += '</li>';
														s += '<li><a href="#!" class="-text">Documentos</a>';
														s += '</li>';
														s += '<li><a href="#!" class="-text">Comentario</a>';
														s += '</li>';
														s += '<li><a href="#!" class="-text">Contrato</a>';
														s += '</li>';
														s += '<li class="divider"></li>';
														s += '<li><a href="#!" class="-text">Autorizar</a>';
														s += '</li>';
														s += '</ul></td>';

														s += '<td>'
																+ lista[i].MES_PLAZO
																+ '</td>';
														s += '<td class=""><img width="30"  height="30" src="'+gth_context_path+'/resources/img/user.png" alt="Usuario"></td>';
														s += '<td>'
																+ lista[i].AP_MATERNO
																+ ' '
																+ lista[i].AP_MATERNO
																+ ' '
																+ lista[i].NO_TRABAJADOR
																+ '</td>';
														s += '<td>'
																+ lista[i].NO_PUESTO
																+ '</td>';
														s += '<td>'
																+ lista[i].NO_AREA
																+ '</td>';
														s += '<td>'
																+ lista[i].NO_DEP
																+ '</td>';
														s += '<td>'
																+ lista[i].NO_REQ
																+ '</td>';
														s += '<td><a class="green-text accent-3" href="#">'
																+ lista[i].DE_PASOS
																+ '</a></td>';
														s += '<td>'
																+ new Date(
																		lista[i].FE_CREACION)
																+ '</td>';
														s += '<td>' + p
																+ '</td>';
														s += '<td>' + f
																+ '</td>';
														// plazo
														if (objJson.datos.usuario.ID_DEPARTAMENTO === "DPT-0019") {
															s += '<td><span class="task-cat '+ct+'">'
															+ t
															+ '</span></td>';
														}
														if(objJson.datos.usuario.ID_DEPARTAMENTO === "DPT-0006") {
															
														}

														s += '<td><input placeholder="Código" id="first_name" type="text" class="validate"></td>';
														s += '</tr>';
													}
													var r = createTable(
															objJson.datos.usuario.ID_DEPARTAMENTO,
															objJson.datos.usuario.ID_ROL);
													$(".contT").empty();
													$(".contT").append(r);
													$("#dataReq").empty();
													$("#dataReq").append(s);
													$("#data-table-simple")
															.DataTable();
													$('.dropdown-button')
															.dropdown(
																	{
																		inDuration : 300,
																		outDuration : 225,
																		constrainWidth : false, 
																		hover : true, 
																		gutter : 0, 
																		belowOrigin : false, 
																		alignment : 'left', 
																		stopPropagation : false
																	});

												} else {
													console.log("no hay datos");
												}
											});
						});

		function createTable(idDepartamento, idRol) {
			var Rol = idRol.toString();
			var Departamento = idDepartamento.toString();
			var s = '<table id="data-table-simple" class="responsive-table display light italic"';
				s+='cellspacing="0">';
			s += '<thead>';
			s += '<tr>';
			s += '<th>N°</th>';
			s += '<th>Acción</th>';
			s += '<th>Mes</th>';
			s += '<th>Foto</th>';
			s += '<th>Apellidos y Nombres</th>';
			s += '<th>Puesto</th>';
			s += '<th>Area</th>';
			s += '<th>Departamento</th>';
			s += '<th>Requerimiento</th>';
			s += '<th>Descripción</th>';
			s += '<th>Fecha de Creación</th>';
			s += '<th>Motivo</th>';
			s += '<th>MFL</th>';
			if (Departamento === "DPT-0019") {
				s += '<th>¿Cumplió Plazos?</th>';
				if (Rol === "ROL-0006") {
					s += '<th>¿Contrato Elaborado?</th>';
					s += '<th>¿Firmo Contrato?</th>';
					s += '<th>Enviar a Rem.</th>';
					s += '<th>¿Contrato Subido?<</th>';
				}
			}
			if (Rol === "ROL-0009") {
				s += '<th>Código APS</th>';
			}
			if (Rol === "ROL-0007" || Rol === "ROL-0001") {
				s += '<th>Código Huella</th>';
			}
			s += '</tr>';
			s += '</thead>';
			s += '<tbody id="dataReq">';
			s += '</tbody>';
			s += '</table>';
			return s;
		}