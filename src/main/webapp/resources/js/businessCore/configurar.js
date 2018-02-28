$(document).ready(function() {

	listarPrecios();
});
var con;


$('#modal_change_cost').modal({
	dismissible : false, // Modal can be dismissed by clicking outside of the
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

function listarPrecios() {
	$.get("getPrecios", function(data) {

		con = JSON.parse(data);

		$.each(con, function(index, obj) {
			var estado = obj.estado;
			
			if(obj.active == 1){
				$("#4").prop('checked', true);
			}
			
			if (estado == 1) {
				$("#" + obj.idc).prop('checked', true);
				$("#idactivo").val(obj.idc);
			} else {
				$("#" + obj.idc).prop('checked', false);
			}
			$("#p_dele" + obj.idc).val("")
			$("#p_alu" + obj.idc).val("")
			$("#p_pro" + obj.idc).val("")
			$("#p_dele" + obj.idc).val(obj.delegacion);
			$("#p_alu" + obj.idc).val(obj.alumno);
			$("#p_pro" + obj.idc).val(obj.profesional);

		});
		Materialize.updateTextFields();

	})
}
var nro_temp=0;
function cambiarPrecios(val){
	
	nro_temp = val;
	
	$.each(con, function(index, obj) {
		if(obj.idc == nro_temp){
			$("#m_del").val(obj.delegacion);
			$("#m_alu").val(obj.alumno);
			$("#m_pro").val(obj.profesional);
		}
		

	});
	
	Materialize.updateTextFields();
	$("#modal_change_cost").modal("open");
	
}


$("#cancel").click(function(){
	$("#modal_change_cost").modal("close");
	limpiar();
});



$("#saveCost").click(function(){
	
	var n_dele = $("#m_del").val();
	var n_alu = $("#m_alu").val();
	var n_pro = $("#m_pro").val();

	$.get("updateCost", {idc : nro_temp, dele : n_dele, alu:n_alu, pro : n_pro }, function(data){
		
		
		if(data==1){
			alertify.alert('Mensaje',
					'Los cambios se guardaron correctamente',
					function() {
						alertify.success('Ok');
						listarPrecios();
					});
		}else{
			alertify.alert('Mensaje de alerta',
					'Hubo un error al guardar las actualizaciones',
					function() {
						alertify.success('Ok');
						listarPrecios();

					});
		}
		
	});
	$("#modal_change_cost").modal("close");
	limpiar();
});


function limpiar(){
	$("#m_del").val("");
	$("#m_alu").val("");
	$("#m_pro").val("");
	Materialize.updateTextFields();
	
}
