$(document).ready(function(){
	
	$("#otrosdiv").hide();
	
    $('#fecha').pickadate({
    	selectMonths: true, // Creates a dropdown to control month
    	selectYears: 15, // Creates a dropdown of 15 years to control
    	format: 'dd/mm/yyyy',
      });

	if(!alertify.errorAlert){
		  alertify.dialog('errorAlert',function factory(){
		    return{
		            build:function(){
		                var errorHeader = '<span class="fa fa-times-circle fa-2x" '
		                +    'style="vertical-align:middle;color:#e10000;">'
		                + '</span> Error al guardar los datos';
		                this.setHeader(errorHeader);
		            }
		        };
		    },true,'alert');
		}
	$("#RegistrarR").click(function (event) {
		event.preventDefault();
 

        // Get form
        var form = $('#RenunciaForm')[0];

		// Create an FormData object
        var data = new FormData(form);

		// If you want to add an extra field for the FormData
// data.append("CustomField", "This is some extra data, testing");
        var file=$("#pelon1").val();
        var fecha = $("#fecha").val();
        console.log(fecha);
        var array = $("#array_motivos").val();

        
        if (!$("#otrosdiv").hasClass("hide")) {
			//alert("visible");
		} else {
			//alert("invisible :'v");
		}
        
        
        alertify.confirm('Confirmar renuncia', 'Esta seguro(a) de confirmar el abandono de este trabajador?', function(){
        	if(file!=""&&fecha!=""&&array!=""){
            	$.ajax({
                    type: "POST",
                    enctype: 'multipart/form-data',
                    url: "form",
                    data: data,
                    processData: false,
                    contentType: false,
                    cache: false,
                    timeout: 600000,
                    success: function (data) {
                    	
                    	
                    	insertarMotivos();
// alert("BIEN JONÁS : ", data);
// $('#modal3').modal('close');
                        $("#RegistrarR").prop("disabled", false);
                    },
                    error: function (e) {
                        alert("NADA JONÁS : ", e);
                        $("#RegistrarR").prop("disabled", false);
                    }
                });
            }else{          	
            	alertify
                .errorAlert("Rellene todos los campos<br/>");
            }
        	
        	
        	
        	}
        , function(){ 
        	alertify
            .errorAlert("Error al intentar guardar los datos<br/>");     	
        });
    });
			
            $('.dropify').dropify(function(event, element){
                return confirm("¿Desea eliminar el archivo \"" + element.filename + "\" ?");
            });

            // Translated
            $('.dropify-fr').dropify({
                messages: {
                    default: 'Glissez-déposez un fichier ici ou cliquez',
                    replace: 'Glissez-déposez un fichier ou cliquez pour remplacer',
                    remove:  'Supprimer',
                    error:   'Désolé, le fichier trop volumineux'
                }
            });

            // Used events
            var drEvent = $('#pelon1').dropify();

            drEvent.on('dropify.beforeClear', function(event, element){
                return confirm("¿Desea eliminar el archivo \"" + element.filename + "\" ?");
            });

            drEvent.on('dropify.afterClear', function(event, element){
                alert('Archivo eliminado');
            });
            
            $("#detalleR").hide();
            
            $("#dni").keypress(function(e) {
    			if (e.which == 13) {
    				$("#buscarDetalle").click();
    			}
    		});
            
            $('#motivo').material_select();
            $("#motivo option:selected").prop("selected",false);
            $('#motivo').change(function(){
            	// CON EL SIGUIENTE SCRIPT EVITAMOS QUE EL SELECT MULTIPLE
				// MANTENGA VALORES DESELECCIONADOS
                var newValuesArr = [],
                    select = $(this),
                    ul = select.prev();
                ul.children('li').toArray().forEach(function (li, i) {
                    if ($(li).hasClass('active')) {
                    	var item = select.children('option').toArray()[i].value;                       
                        newValuesArr.push(item);                     
                        if(item=='MOT-000007'){
                        
                        	$("#otrosdiv").show();
                        }else{
// $("#otrosdiv").removeClass("show");
                      		$("#otrosdiv").hide();
                      	}                        
                    }
                    if(newValuesArr.length==0){
                    	$("#otrosdiv").hide();
                    	
                    }
                    $("#array_motivos").val(newValuesArr);
                });
                select.val(newValuesArr);
                // ---------------------------------
// alert($("#motivo").val());

            });
       
            $.get("detalleR",{opc:2},function(data,status){
            	var mot = JSON.parse(data);
            	$('#motivo').html("");
            	$('#motivo').append("<option value='' disabled selected>Elija una o varias opciones</option>");
            	$.each(mot,function(key,val){
 
            		
            		$('#motivo').append($("<option></option>")
                               .attr("value",val.ID_MOTIVO)
                               .text(val.NO_MOTIVO));  $('#motivo').material_select();
            	});
            	 
            });
        });

function buscarDetalle(){	
	dni = $("#dni").val();
	
	$.get("detalleR",{dni:dni,opc:1},function(data,status){
// alert(data);
		var detalle = JSON.parse(data);
		console.log(detalle);
	
			if(detalle.length==0){
				// location.reload();
							$("#detalleR").hide();
							$("#fo").show();
							$("#msj").text("El trabajador identificado con DNI: " +dni+ " no tiene un contrato activo o ha renunciado");
							$("#dni").val("");
						}else{
							$("#fo").hide();
							$("#detalleR").show();
							$("#nombres").text(detalle[0].NOMBRES);
							$("#paternos").text(detalle[0].PATERNO);    
							$("#maternos").text(detalle[0].MATERNO); 
							$("#fecha_nacs").text(detalle[0].FECHA_NAC);  
							$("#fecha_inicio").text(detalle[0].FECHA_CONTRATO);  
							$("#direccion").text(detalle[0].DOMICILIO);  
							$("#departamento").text(detalle[0].NOM_DEPA);
							$("#area").text(detalle[0].NOM_AREA);
							$("#seccion").text(detalle[0].NOM_SECCION);
							$("#puesto").text(detalle[0].NOM_PUESTO);
							$("#tipo_contrato").text(detalle[0].TIPO_CONTRATO);
							$("#idcontrato").val(detalle[0].ID_CONTRATO);
							$("#dni").val("");
							$("#dni").focus();
						}
		
		
		  
	});

}

function insertarMotivos(){
	// alert("Motivos: "+$("#array_motivos").val());
		var array = $("#array_motivos").val();
		$.ajax("detalleR",{
			data:{
				'opc' : 3,
				'array':array
			},
			type:'GET',
			success:function(data){
				otros = $("#otros").val();
				if (otros=="") {
					// alert("NO VAS A INSERTAR OTROS XD");
				} else {
					insertarOtros(otros);
				}
				window.location.href = "http://localhost:8081/gth/renuncias/";
				
	// alert(otros);
				
	// window.location.assign(data);
	// alert();
	// limpiar();
		
			}
		});
	}

function insertarOtros(otros){
	$.get("detalleR",{otros:otros,opc:5},function(data,status){
		// alert(data);
	});
}