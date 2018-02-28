$(document).ready(function(){
	mostrar();
});

function createTable(){
	var d = "<table id='data-table-row-grouping1' class='bordered highlight centered' >";
	d += "<thead>";
	d += "<tr>";
	d += "<th>Nro</th>";
	// s += "<th class='hide' >N°</th>";
	d += "<th>Nombres y Apellidos</th>";
	d += "<th>Dni</th>";
	d += "<th >Clave</th>";
	d += "<th >Celular</th>";
	d += "<th >Operaciones</th>";
	d += "</tr>";
	d += "</thead>";

	d += "<tbody id='data'></tbody>";
	d += "</table>";
	return d;
	
}

function mostrar(){
	$.get("customPersonal",{op:1},function(data){
//		alert(data);
		var s = "";
		var lista = JSON.parse(data);
	
		if (lista.length > 0) {
			// alert("si hay datos amix");
			for (var i = 0; i < lista.length; i++) {
				var a = parseInt(i) + 1;
				var idd = lista[i].idd;
				s += '<tr>';
				s += '<td style="width:2%">'
						+a
						+ '</td>';
				s += '<td style="width:26%">'
						+ lista[i].nombre + " " +lista[i].apellidos
						+ '</td>';
				s += '<td style="width:15%">' + lista[i].dni
						+ '</td>';
				s += '<td style="width:15%">' + lista[i].clave
				+ '</td>';
				s += '<td style="width:20%">' + lista[i].celular
				+ '</td>';
				s += '<td style="width:22%">'
				s += '	<div class ="row"><div class="col s6"><a onclick="crearModal('+lista[i].idpersona+')"  href="#modalon"' 
				s += '	class="btn-floating btn waves-effect waves-light accent-3 orange modal-trigger"'
				s += '	>'
				s += '	<i class="material-icons right">border_color</i>'
				s+= '</a></div><div class="col s6"><a class="btn-floating waves-effect waves-light #ff9100 red accent-3" onclick="eliminar('+lista[i].idpersona+')">'
				s+= 	'<i class="material-icons md-18">delete_forever</i></a></div></div></td>';
				// s += '<td>' + p + '</td>';
				s += '</tr>';
				
			}

		} else {
			//alert("no hay datos");
			s += "";
		}
		$("#table").empty();

		$("#table").append(createTable());

		$("#data").empty();
		$("#data").append(s);
		

		$("#data-table-row-grouping1")
		.dataTable(
				{
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


					
				});
		$("#data-table-row-grouping1_filter").after(
		"<div  id='hugme1' style='overflow-x:auto; clear: both;'></div>");
		$("#data-table-row-grouping1").appendTo('#hugme1');
	});
	
	
}
function crearModal(id) {

	var id= id;

	
	$('.modal').modal({
		opacity : .5, // Opacity of modal background
		inDuration : 400, // Transition in duration
		outDuration : 200, // Transition out duration
		startingTop : '4%', // Starting top style attribute
		endingTop : '10%', // Ending top style attribute
		
		ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
			$.getJSON(coneia_context_path + "/admin/customPersonal",
					{op:4,id:id},
					function(objJson){
						var r = "";
						var liston = objJson;
					
//						var arr = $.map(objJson, function(el) { return el });
//						var found = arr.find(function(element) {
//							   element==undefined;
//							});
 
						r+='<h4 class="center" style="font-family:' +"'"+'Cinzel'+"'"+', serif;">Actualizar STAFF</h4>'
						r+='<div class="col s12">'
						r+='<div class="input-field inline col s12">';
						r+='<i class="material-icons prefix">person_outline</i><input type="text" placeholder="Escriba los nombres" id="nombres" value="'+( (liston.nombres==undefined) ? "": liston.nombres)+'">';
						r+='<label for="nombres" class="active">Nombres: </label></div></div>';
						r+='<div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">person</i>';
						r+='<input type="text" placeholder="Escriba los apellidos" id="apellidos" value="'+( (liston.apellidos==undefined) ? "": liston.apellidos)+'"/>';
						r+='<label for="apellidos" class="active">Apellidos: </label></div></div>';
						r+='<div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">payment</i>';
						r+='<input type="text" maxlength="8" placeholder="Escriba el dni" onkeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" id="dni" value="'+( (liston.dni==undefined) ? "": liston.dni)+'"/>';
						r+='<label for="dni" class="active">DNI: </label></div></div>';
						r+='<div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">lock_outline</i>';
						r+='<input type="text" placeholder="Escriba la clave" id="clave" value="'+( (liston.clave==undefined) ? "": liston.clave)+'"/>';
						r+='<label for="clave" class="active">Clave: </label></div></div>';
						r+='<div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">local_phone</i>';
						r+='<input type="text" placeholder="Escriba el celular" onkeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" id="celular" value="'+( (liston.celular==undefined) ? "": liston.celular)+'" maxlength="9"/>';
						r+='<label for="celular" class="active">Celular: </label></div></div>';
						r+='<input type="hidden" id="idpersona" value="'+liston.idpersona+'"/>';
						r+='</div><div class="modal-footer inline"><a class=" waves-effect waves-light btn #0277bd light-blue darken-3" onclick="update('+liston.idpersona+')" style="width:30%"><i class="material-icons">sync</i></a> <a href="#!" class="modal-action modal-close waves-effect waves-light btn-flat">Cerrar</a></div></div></div></div></br></div>';
						
						$("#cant").empty().append(r);
					});

			modal.css("z-index","600"+cant);

	      },
	      complete: function() { } // Callback for Modal close
	});
}

function update(id){
	var nombres = $("#nombres").val();
	var apellidos = $("#apellidos").val();
	var dni = $("#dni").val();
	var clave = $("#clave").val();
	var celular = $("#celular").val();
	
	$.get(coneia_context_path + "/admin/customPersonal",{op:2,id:id,nombres:nombres,apellidos:apellidos,dni:dni,clave:clave,celular:celular},function(data){
		if(data==1){
		
			$('#modalon').modal('close');
			alertify.notify('Actualizando...', 'custom', 1, function(){mostrar();});
		}else{
			
			alertify.error('Error al intentar eliminar los datos');
		}
	});
}
function open(){
	$(".ajs-header").addClass("#82b1ff  blue accent-1");
	var isOpen = alertify.confirm().isOpen(); 
	 if(isOpen=true){
		 $(".ajs-ok").attr("id","alertyboton");
		 $(".ajs-cancel").attr("id","alertyboton2");
		 $(".alertify .ajs-modal").css("z-index","999999");
	 }
	 $("#alertyboton").addClass("btn waves-effect waves-light #2962ff blue accent-4");
		$("#alertyboton2").addClass("btn waves-effect waves-light #bdbdbd grey lighten-1");
}

function eliminar(id){open();
	alertify.confirm('Confirmación de acción', '¿Está seguro(a) que desea eliminar este registro?', function(){
		$.get("customPersonal",{op:3,id:id},function(data){
			if(data==1){
				
				alertify.notify('Eliminando...', 'custom', 1, function(){mostrar();});
			}else{
				
				alertify.error('Error al intentar eliminar los datos');
			}
		});
	}
   , function(){ });

}

function nuevo(){
	$('.modal').modal({
		opacity : .5, // Opacity of modal background
		inDuration : 400, // Transition in duration
		outDuration : 200, // Transition out duration
		startingTop : '4%', // Starting top style attribute
		endingTop : '10%', // Ending top style attribute
		
		ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
						var r = "";

//						
						r+='<h4 class="center" style="font-family:' +"'"+'Cinzel'+"'"+', serif;">Nuevo personal</h4>'
						r+='<div class="col s12">'
						r+='<div class="input-field inline col s12">';
						r+='<i class="material-icons prefix">person_outline</i><input type="text" placeholder="Escriba los nombres" id="nnombres">';
						r+='<label for="nnombres" class="active">Nombres: </label></div></div>';
						r+='<div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">person</i>';
						r+='<input type="text" placeholder="Escriba los apellidos" id="napellidos"/>';
						r+='<label for="napellidos" class="active">Apellidos: </label></div></div>';
						r+='<div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">payment</i>';
						r+='<input type="text" placeholder="Escriba el dni" id="ndni" maxlength="8" onkeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"/>';
						r+='<label for="ndni" class="active">DNI: </label></div></div>';
						r+='<div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">lock_outline</i>';
						r+='<input type="text" placeholder="Escriba la clave" id="nclave"/>';
						r+='<label for="nclave" class="active">Clave: </label></div></div>';
						r+='<div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">local_phone</i>';
						r+='<input type="text" onkeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" placeholder="Escriba el celular" id="ncelular" maxlength="9"/>';
						r+='<label for="ncelular" class="active">Celular: </label></div></div>';
						r+='<input type="hidden" id="idpersona" />';
						r+='</div><div class="modal-footer inline"><a class=" waves-effect waves-light btn #0277bd light-blue darken-3" onclick="guardar()" style="width:30%"><i class="material-icons">save</i></a> <a href="#!" class="modal-action modal-close waves-effect waves-light btn-flat">Cerrar</a></div></div></div></div></br></div>';
						
						$("#cant2").empty().append(r);
				

			modal.css("z-index","600"+cant);

	      },
	      complete: function() { } // Callback for Modal close
	});
}

function guardar(){
	var nombres = $("#nnombres").val();
	var apellidos = $("#napellidos").val();
	var dni = $("#ndni").val();
	var clave = $("#nclave").val();
	var celular = $("#ncelular").val();

	$.get(coneia_context_path + "/admin/customPersonal",{op:5,nnombres:nombres,napellidos:apellidos,ndni:dni,nclave:clave,ncelular:celular},function(data){
		if(data==1){
		
			$('#modalon2').modal('close');
			mostrar();
		}else{
		
			alertify.error('Error al intentar agregar los datos');
		}
	});
}