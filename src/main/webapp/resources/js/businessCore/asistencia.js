$(document).ready(function() {

	$('select').material_select();

	// $(".datepicker").pickadate({
	// selectMonths : !0,
	// selectYears : 15
	// })

	$('.datepicker').pickadate({
		selectMonths : true, // Creates a dropdown to control month
		selectYears : 5, // Creates a dropdown of 15 years to control year,
		closeOnSelect : false
	// Close upon selecting a date,
	});

	

});

var cambio="";var tam=0;
$("#selected")
.change(
		function() {
			cambio = $("#selected").val();
			if ($(window).width() < 600) {
				$("#table").css("margin-bottom","4em");
				$(".muestra2").hide();
			}else{
				$(".muestra2").show();
			}
			
			$(".muestra").hide(); 
			  
			
//			console.log($("#selected").val());
			if (cambio == "2018-06-04") {
				tam=7;
				
				listarTalleres(cambio);	
				
				// listar();
			} 
			if (cambio == "2018-06-05") {
				tam=4;
				listarTalleres(cambio);	
			} 
			if (cambio == "2018-06-06") {
				tam=9;
				listarTalleres(cambio);	
			} 
			if (cambio == "2018-06-07") {
				tam=4;
				listarTalleres(cambio);	
			} 
			if (cambio == "2018-06-08") {
				tam=5;
				listarTalleres(cambio);	
			} 
			

		});

function listarTalleres(cambio,tam){
	var fake = cambio.split("-");var clase="";var clase2="";
	var anio = fake[0];var mes = fake[1]-1;var dia = fake[2];
	var fechin = new Date(anio, mes, dia);
	var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };

		if ($(window).width() < 600) {
			$.getJSON(
					coneia_context_path + "/admin/customTaller",
					{op:25,fecha:cambio},
					function(objJson) {
						var s = "";
						var lista = objJson;
						console.log(objJson);
						if (lista.length > 0) {
							// alert("si hay datos amix");
							var temon = lista[0].tema;	
							$(".temon").empty().append('<div class="chip"><span>'+temon+'<span></div>')
							for (var i = 0; i < lista.length; i++) {
								var idd = lista[i].idd;
								var idit = lista[i].idit;
								var asistencia = lista[i].asistencia;
								if(asistencia ==1){
									clase2="#00b0ff light-blue accent-3";
								}
								if(asistencia ==2){
									clase2="#00c853 green accent-4";
								}
								if(asistencia ==0){
									clase2="red";
								}
								crearModal(idd,cambio);
								var a = parseInt(i) + 1;
								var porcentaje = lista[i].porcentaje;
								if(parseInt(porcentaje)>80){
									clase = "##33691e light-green darken-4";
								}else{
									clase = "#616161 grey darken-2";
								}
								s += '<tr>';
								s += '<td style="width:30%">'
										+ lista[i].nombre + " " +lista[i].apellidos
										+ '</td>';
								s += '<td style="width:20%">' + lista[i].dni
										+ '</td>';
								s += '<td style="width:40%">'
								s += '	<div class ="row"><div class="col s6"><a onclick="actualizar(\''+idd+'\',\''+cambio+'\',\''+idit+'\')"'
								s += '	class="btn btn-floating waves-effect waves-light '+clase2+' accent-3" '
								s += '	>'
								s += '	<i class="material-icons right md-18">done_all</i>'
								s+= '</a></div><div class="col s6"><a class="btn-floating waves-effect waves-light #ff9100 orange accent-3 modal-trigger" href="#modalon" onclick="crearModal(\''+idd+'\',\''+cambio+'\')"><i class="material-icons">border_color</i></a></div></div>'
								s+= 	'</td>';
								s += '<td style="width:10%;color:white" class="'+clase+'"><b>'+porcentaje+' %</b></td>';
								// s += '<td>' + p + '</td>';
								s += '</tr>';
								
							}

						} else {
							//alert("no hay datos");
							s += "";
						}
						$("#table").empty();

						$("#table").append(createTable3());

						$("#data1").empty();
						$("#data1").append(s);
						

						$("#data-table-row-grouping1")
						.dataTable(

								);

					

					});
		}else{
			$.getJSON(
					coneia_context_path + "/admin/customTaller",
					{op:25,fecha:cambio},
					function(objJson) {
						var s = "";
						var lista = objJson;
						console.log(objJson);
						if (lista.length > 0) {
							// alert("si hay datos amix");
							var temon = lista[0].tema;	
							$(".temon").empty().append('<div class="chip"><span>'+temon+'<span></div>')
							for (var i = 0; i < lista.length; i++) {
								var a = parseInt(i) + 1;
								var idd = lista[i].idd;
								crearModal(idd,cambio);
								var idit = lista[i].idit;
								var asistencia = lista[i].asistencia;
								
								if(asistencia ==1){
									clase2="#00b0ff light-blue accent-3";
								}
								if(asistencia ==2){
									clase2="#00c853 green accent-4";
								}
								if(asistencia ==0){
									clase2="red";
								}
								var valor = lista[i].porcentaje;
								if(parseInt(valor)>80){
									clase = "##33691e light-green darken-4";
								}else{
									clase = "#424242 grey darken-3";
								}
								s += '<tr>';
								s += '<td style="width:3%">'
										+a
										+ '</td>';
								s += '<td style="width:30%">'
										+ lista[i].nombre + " " +lista[i].apellidos
										+ '</td>';
								s += '<td style="width:15%">' + lista[i].dni
										+ '</td>';
								s += '<td style="width:20%">' + fechin.toLocaleDateString("es-ES", options)
								+ '</td>';
								s += '<td style="width:22%">'
								s += '	<div class ="row"><div class="col s6"><a onclick="actualizar(\''+idd+'\',\''+cambio+'\',\''+idit+'\')"'
								s += '	class="cola btn-floating btn waves-effect waves-light '+clase2+' accent-3 "'
								s += '	>'
								s += '	<i class="material-icons right">done_all</i>'
								s+= '</a></div><div class="col s6"><a class="btn-floating waves-effect waves-light #ff9100 orange accent-3 modal-trigger " href="#modalon" " onclick="crearModal(\''+idd+'\',\''+cambio+'\')">'
								s+= 	'<i class="material-icons md-18">border_color</i></a></div></div></td>';
								s += '<td style="width:10%;color:white" class="'+clase+'"><b>'+valor+' %</b></td>';
								// s += '<td>' + p + '</td>';
								s += '</tr>';
								
							}

						} else {
							//alert("no hay datos");
							s += "";
						}
						$("#table").empty();

						$("#table").append(createTable2());

						$("#data1").empty();
						$("#data1").append(s);
						

						$("#data-table-row-grouping1")
						.dataTable(
								{
									"pageLength" : 5,
									"bPaginate" : true,
									"bLengthChange" : false,
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

					var table = $('#data-table-row-grouping1').DataTable();
					table.rows( {selected:true} ).data();
					});
		}

	

	

}

function createTable2() {
	var d = "<table id='data-table-row-grouping1' class='bordered highlight centered' >";
	d += "<thead>";
	d += "<tr>";
	d += "<th>Nro</th>";
	// s += "<th class='hide' >N°</th>";
	d += "<th>Nombres y Apellidos</th>";
	d += "<th>Dni</th>";
	d += "<th > Fecha </th>";
	d += "<th >Asistencia</th>";
	d += "<th >% de Asistencias</th>";
	d += "</tr>";
	d += "</thead>";

	d += "<tbody id='data1'></tbody>";
	d += "</table>";
	return d;

};
function createTable3() {
	var d = "<table id='data-table-row-grouping1' class='bordered highlight centered' >";
	d += "<thead>";
	d += "<tr>";
	// s += "<th class='hide' >N°</th>";
	d += "<th>Nombres y Apellidos</th>";
	d += "<th>Dni</th>";
	d += "<th >Asistencia</th>";
	d += "<th >% </th>";
	d += "</tr>";
	d += "</thead>";

	d += "<tbody id='data1'></tbody>";
	d += "</table>";
	return d;

};
function createTable4() {
	var d = "<table id='data-table-row-grouping1' class='bordered highlight centered' >";
	d += "<thead>";
	d += "<tr>";
	d += "<th>Tema</th>";
	d += "<th>Acción</th>";
	d += "</tr>";
	d += "</thead>";

	d += "<tbody id='data2'></tbody>";
	d += "</table>";
	return d;

};
function createTable5() {
	var d = "<table id='data-table-row-grouping2' class='bordered highlight centered' >";
	d += "<thead>";
	d += "<tr>";
	d += "<th>Nro</th>";
	// s += "<th class='hide' >N°</th>";
	d += "<th>Nombres y Apellidos</th>";
	d += "<th>Dni</th>";
	d += "<th > Correo </th>";
	d += "<th >Celular</th>";
	d += "<th >% de Asistencias</th>";
	d += "<th >Certificado</th>";
	d += "</tr>";
	d += "</thead>";

	d += "<tbody id='data3'></tbody>";
	d += "</table>";
	return d;

};

var countin=0;
function crearModal(idd,cambio) {
	var achon="";
	if(cambio=="2018-06-04"){achon="DÍA LUNES"};
	if(cambio=="2018-06-05"){achon="DÍA MARTES"};
	if(cambio=="2018-06-06"){achon="DÍA MIÉRCOLES"};
	if(cambio=="2018-06-07"){achon="DÍA JUEVES"};
	if(cambio=="2018-06-08"){achon="DÍA VIERNES"};
	$(".achon").text(achon);
	var clase="";var clase3="";
	$("#cant").empty().append(createTable4());

	var id= idd; var cabio=cambio;
	console.log(id);console.log(cabio);
	var idit = 0; var tema="";var idd=0;var s ="";
	var cant =id+countin;
//	$("#modales").append('<div id="modal'+cant+'" class="modal" >'
//			 +'<div class="modal-content modal-form">'+
//			 	'<div class="row">'+
//			 		'<h2 class="center" style="font-family:' +"'"+'Cinzel'+"'"+', serif;">Control de asistencia</h2>'+
//			 		'<div id="table-datatables"><div class="container" style="width: 95%"><div class="cant"></div></div></div>'+
//			 	+'</div>'+
//			  '</div>'+
//			 '</div>');
//	
	
	$('.modal').modal({
		opacity : .5, // Opacity of modal background
		inDuration : 400, // Transition in duration
		outDuration : 200, // Transition out duration
		startingTop : '4%', // Starting top style attribute
		endingTop : '10%', // Ending top style attribute
		
		ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
			$.getJSON(coneia_context_path + "/admin/customTaller",
					{op:26,idd:id,fecha:cabio},
					function(objJson){
						var r = "";
						var liston = objJson;
						console.log(objJson);
						for (var j = 0; j < liston.length; j++) {
//							console.log(liston[j].idit+" / "+ liston[j].idd+" / "+liston[j].tema);
							var asistencia2 = liston[j].asistencias;
							console.log(asistencia2);
							if(asistencia2 ==1){
								clase3="#00b0ff light-blue accent-3";
							}
							if(asistencia2 ==2){
								clase3="#00c853 green accent-4";
							}
							if(asistencia2 ==0){
								clase3="red";
							}
							 s+='<tr class="terraza"><td style="padding:5px 5px">';
							 s+=liston[j].tema;
							 s+='</td><td style="padding:5px 5px"><a class="btn chama btn-floating waves-effect waves-light '+clase3+'" onclick="actualizar(\''+id+'\',\''+cabio+'\',\''+liston[j].idit+'\')"><i class="material-icons right">done_all</i></a></td></tr>';
						} 
						$("#data2").empty().append(s);
					});
//			console.log("Aquí van las tablas chamo"+s);
			modal.css("z-index","600"+cant);
//	        console.log(modal, trigger);
	      },
	      complete: function() { } // Callback for Modal close
	});
}
function actualizar(idd,cambio,idit){
//	alert(idd+"/"+cambio+"/"+idit);
	if(idit==0){
		alertify.notify('Esta función no está habilitada por no estar dentro del horario del evento', 'custom', 4, function(){console.log('dismissed');});
	}else{
		$.getJSON(coneia_context_path + "/admin/customTaller",
				{op:27,idit:idit},
				function(data){
					if(data==1){
						listarTalleres(cambio);	
					}else{
						console.log("Error al actualizar");
					}
				});
	}
	
}

$(".final").click(function(){

	$("#content").hide();
	$(".reporte").show();
	var fechin = new Date();var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
	var clase="";var clase2="";var certi="";
	$("#fecha").empty().append(fechin.toLocaleDateString("es-ES", options));
	$.getJSON(
			coneia_context_path + "/admin/customTaller",
			{op:28},
			function(objJson) {
				var s = "";
				var lista = objJson;
				console.log(objJson);
				if (lista.length > 0) {
					// alert("si hay datos amix");
					var temon = lista[0].tema;	
					$(".temon").empty().append('<div class="chip"><span>'+temon+'<span></div>')
					for (var i = 0; i < lista.length; i++) {
						var a = parseInt(i) + 1;
						var idd = lista[i].idd;
						crearModal(idd,cambio);
						var idit = lista[i].idit;
						var asistencia = lista[i].asistencia;
						
						if(asistencia ==1){
							clase2="#00b0ff light-blue accent-3";
						}
						if(asistencia ==2){
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
								+ lista[i].nombre + " " +lista[i].apellidos
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

				$("#table2").append(createTable5());

				$("#data3").empty();
				$("#data3").append(s);
				

				$("#data-table-row-grouping2")
				.dataTable(
						{
							dom : 'Bfrtip',
							buttons : [ 'copy', 'csv', 'excel', 'pdf', 'print' ],
							buttons : [ 'excel' ],
							buttons : [ {
								extend : 'excel',
								text : 'EXCEL',
								
							}, {
								extend : 'pdf',
								text : 'pdf',
								
							}, {
								extend : 'print',
								text : 'Imprimir',
								
							}],
							
							"pageLength" : 10,
							"bPaginate" : true,
							"bLengthChange" : false,
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

			});

});