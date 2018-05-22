var mediaquery = window.matchMedia("(max-width: 600px)");
var counter = 0; 
var progreso = 0;
var l1 = false,l2 = false,m1 = false,m2=false,mi1=false,mi2=false,mi3=false,mi4=false,j1=false,j2=false,v1 =false,v2 =false;
var lun1="",lun2="",mar="",mier1="",mier2="",mier3="",mier4="",jue="",vie1="",vie2="",array="";
var a = "";var b =  "";var c =  "";var d = "";var e =  "";
var f =  "";var g =  "";var h =  "";var i =  "";var j =  "";
var k =  "";var l = "";var m =  "";var n =  "";var o =  "";
var p =  "";var q =  "";var r =  "";var s =  "";
function comprobar(){
	if(counter==10){
		$(".confirmar").css("display","block");
	}else{
		$(".confirmar").css("display","none");
	}
}

$(document).ready(function() {
	$(".ajs-ok").attr("id","alertyboton");
	$.get("inscrito",null,function(data){
		if(data==10){
			var link = coneia_context_path + "/principal";
			location.href = link;
		}
	});
	
//	$("ajs-button.ajs-cancel").addClass("btn waves-effect waves-light ");
	if(counter==10){
		alert("Senpaiiiii");
	}
//	if(!$("input[name='lu1']").is(':checked')){
//		
//	}else{
//		alert('JONAAAAAS');
//	}
	$('input[type=radio][name=lu1]').change(function(){
		 console.logg("it's checked"); 
	});
//	
	
	$('input[type=radio][name=grupo1]').change(function() {
		$("#two").removeClass("#00e676 green accent-3");
		$("#two").addClass("#ccff90");
		if(this.value=="vt1"){
			//visitas martes
			$('input[type=radio][name=group1]').prop("disabled",false);
			$('input[type=radio][name=group2]').prop("disabled",true);
			$('input[type=radio][name=group2]').prop("checked",false);
			$('#tm2').prop("checked",true);
			$('input[type=radio][name=group3]').prop("disabled",true);
			$('input[type=radio][name=group4]').prop("disabled",false);
			$('input[type=radio][name=group3]').prop("checked",false);
			if(m2==true){
				if(j1==true){
					counter=counter-2;
					j1=false;
					m2=false;
					$("#four").removeClass("#00e676 green accent-3");
					$("#four").addClass("#ccff90");
					$("#two").removeClass("#00e676 green accent-3");
					$("#two").addClass("#ccff90");
				}else{
					counter--;
					m2=false; 
					$("#two").removeClass("#00e676 green accent-3");
					$("#two").addClass("#ccff90");
				}
				aumentarProgreso();
			}else{
				if(j1==true){
					counter--;
					j1=false;
					console.log("jejee "+m2+j1);
					$("#four").removeClass("#00e676 green accent-3");
					$("#four").addClass("#ccff90");
					aumentarProgreso();
				}
			}
			comprobar();
		}else{
			//tm1 (talleres martes)
			$('input[type=radio][name=group1]').prop("disabled",true);
			$('input[type=radio][name=group2]').prop("disabled",false);
			$('input[type=radio][name=group1]').prop("checked",false);
			$('#vt2').prop("checked",true);
			$('input[type=radio][name=group3]').prop("disabled",false);
			$('input[type=radio][name=group4]').prop("disabled",true);
			$('input[type=radio][name=group4]').prop("checked",false);
			if(m1==true){
				if(j2==true){
					counter=counter-2;
					j2=false;
					m1=false; 
					$("#four").removeClass("#00e676 green accent-3");
					$("#four").addClass("#ccff90");
					$("#two").removeClass("#00e676 green accent-3");
					$("#two").addClass("#ccff90");
				}else{
					counter--;
					m1=false; 
					$("#two").removeClass("#00e676 green accent-3");
					$("#two").addClass("#ccff90");
				}
				aumentarProgreso();
			}else{
				if(j2==true){
					counter--;
					j2=false;
					console.log("jejee "+m1+j2);
					$("#four").removeClass("#00e676 green accent-3");
					$("#four").addClass("#ccff90");
					aumentarProgreso();
				}
			}	
			comprobar();
		}
	});
	$('input[type=radio][name=grupo2]').change(function() {
		if(this.value=="vt2"){
			//visitas jueves
			$('input[type=radio][name=group3]').prop("disabled",false);
			$('input[type=radio][name=group4]').prop("disabled",true);
			$('input[type=radio][name=group4]').prop("checked",false);
			$('#tm1').prop("checked",true);
			$('input[type=radio][name=group1]').prop("disabled",true);
			$('input[type=radio][name=group2]').prop("disabled",false);
			$('input[type=radio][name=group1]').prop("checked",false);
			//tm2 (talleres jueves)
			if(j2==true){
				if(m1==true){
					counter=counter-2;
					m1=false;
					j2=false; 
					console.log(m1,j2);
					$("#four").removeClass("#00e676 green accent-3");
					$("#four").addClass("#ccff90");
					$("#two").removeClass("#00e676 green accent-3");
					$("#two").addClass("#ccff90");
				}else{
					counter--;
					j2=false; 
					console.log(m1,j2);
					$("#four").removeClass("#00e676 green accent-3");
					$("#four").addClass("#ccff90");
				}
				aumentarProgreso();
			}else{
				if(m1==true){
					counter--;
					m1=false;
					console.log("jejee"+m1,j2);
					$("#two").removeClass("#00e676 green accent-3");
					$("#two").addClass("#ccff90");
					aumentarProgreso();
				}
			}
			comprobar();
		}else{
			$('input[type=radio][name=group3]').prop("disabled",true);
			$('input[type=radio][name=group4]').prop("disabled",false);
			$('input[type=radio][name=group3]').prop("checked",false);
			$('#vt1').prop("checked",true);
			$('input[type=radio][name=group1]').prop("disabled",false);
			$('input[type=radio][name=group2]').prop("disabled",true);
			$('input[type=radio][name=group2]').prop("checked",false);
			if(j1==true){
				if(m2==true){
					counter=counter-2;
					m2=false;
					j1=false; 
					console.log(m2,j1);
					$("#four").removeClass("#00e676 green accent-3");
					$("#four").addClass("#ccff90");
					$("#two").removeClass("#00e676 green accent-3");
					$("#two").addClass("#ccff90");
				}else{
					counter--;
					j1=false; 
					console.log(m2,j1);
					$("#four").removeClass("#00e676 green accent-3");
					$("#four").addClass("#ccff90");
				}
				aumentarProgreso();
			}else{
				if(m2==true){
					counter--;
					m2=false;
					console.log("jejee"+m1,j2);
					$("#two").removeClass("#00e676 green accent-3");
					$("#two").addClass("#ccff90");
					aumentarProgreso();
				}
			}
			comprobar();
		}
	});
	aumentarProgreso();
	$('ul.tabs').tabs({
		swipeable : false,
		responsiveThreshold : 1920,
		onShow : function(tab) {
		
			var t = tab[0].id.split('-')[1];
			$("#" + t).addClass("#ccff90 light-green accent-1")
		}
	});
	$.get("customTaller", {
		op : 1
	}, function(data) {
		var obj = JSON.parse(data);
//		alert(obj[0].idtaller)
		$(".visitaMartes").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ '7:30 AM' +' a '+ '1:00 PM' +'</label></div>');
		$.each(obj,function(i,value){
//			alert(obj[i].idtaller)
			$(".visitaMartes").append('<div class="col s12"><div class="row">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row">Responsable: '+obj[i].ponente+'</div><div class="row">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><input class="with-gap" name="group1" type="radio" id="'+obj[i].idtaller+'" onclick="martes1('+obj[i].idtaller+')"><label for="'+obj[i].idtaller+
					'" style="font-weight:bold">Asistiré</label></div></br></div>');
		});
	});

	$.get("customTaller", {
		op : 2
	}, function(data) {
		var obj = JSON.parse(data);
		var place="";
//		alert(obj[0].idtaller)
		$(".talleresMartes").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ '6:30 AM' +' a '+ '1:00 PM' +'</label></div>');
		$.each(obj,function(i,value){
//			alert(obj[i].idtaller)
			if(typeof obj[i].lugar==="undefined" ||obj[i].lugar===""){
				place="";
			}else{
				place=obj[i].lugar;
			}
			$(".talleresMartes").append('<div class="col s12"><div class="row">'+(i+1)+'. Lugar: <b>'+obj[i].tema
					+'</b></div><div class="row">Requisitos: '+place+'</div><div class="row">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><input class="with-gap" name="group2" type="radio" id="'+obj[i].idtaller+'" onclick="martes2('+obj[i].idtaller+')" disabled><label for="'+obj[i].idtaller+'" style="font-weight:bold">Asistiré</label></div></br></div>');
		});		
	});
	$.get("customTaller", {
		op : 3
	}, function(data) {
		var obj = JSON.parse(data);
		var place="";
//		alert(obj[0].idtaller)
		$(".visitasJueves").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ '7:30 AM' +' a '+ '1:00 PM' +'</label></div>');
		$.each(obj,function(i,value){
//			alert(obj[i].idtaller)
			if(typeof obj[i].lugar==="undefined" ||obj[i].lugar===""){
				place="";
			}else{
				place=obj[i].lugar;
			}
			$(".visitasJueves").append('<div class="col s12"><div class="row">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row">Responsable: '+obj[i].ponente+'</div><div class="row">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><input class="with-gap" name="group3" type="radio" id="'+obj[i].idtaller+'" onclick="jueves1('+obj[i].idtaller+')" value="'+obj[i].idtaller+'" disabled><label for="'+obj[i].idtaller+'" style="font-weight:bold">Asistiré</label></div></br></div>');
		});		
	});
	$.get("customTaller", {
		op : 4
	}, function(data) {
		var obj = JSON.parse(data);
		var place="";
//		alert(obj[0].idtaller)
		$(".talleresJueves").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ '6:30 AM' +' a '+ '1:00 PM' +'</label></div>');
		$.each(obj,function(i,value){
//			alert(obj[i].idtaller)
			if(typeof obj[i].lugar==="undefined" ||obj[i].lugar===""){
				place="";
			}else{
				place=obj[i].lugar;
			}
			$(".talleresJueves").append('<div class="col s12"><div class="row">'+(i+1)+'. Lugar: <b>'+obj[i].tema
					+'</b></div><div class="row">Requisitos: '+place+'</div><div class="row">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><input class="with-gap" name="group4" type="radio" id="'+obj[i].idtaller+'" onclick="jueves2('+obj[i].idtaller+')" value="'+obj[i].idtaller+'"><label for="'+obj[i].idtaller+'" style="font-weight:bold">Asistiré</label></div></br></div>');
		});		
	});
	$.get("customTaller", {
		op : 5
	}, function(data) {
		var obj = JSON.parse(data);
		$(".ponenciasLunes").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ obj[0].horaI +' a '+ obj[0].horaF +
				'<div class="row center choose1">Elija una de las tres ponencias a las que asistirá</div></label></div>');
		$.each(obj,function(i,value){
			$(".ponenciasLunes").append('<div class="col s4"><div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row center">Responsable: '+obj[i].ponente+'</div><div class="row center">'+obj[i].lugar+'</div><div class="row">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><input class="with-gap" name="lu1" type="radio" id="'+obj[i].idtaller+'" onclick="lunes1('+obj[i].idtaller+')" value="'+obj[i].idtaller+'"><label for="'+obj[i].idtaller+'" style="font-weight:bold">Asistiré</label></div></br></div>');
		});
	});
	$.get("customTaller", {
		op : 6
	}, function(data) {
		var obj = JSON.parse(data);
		$(".ponenciasLunes2").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ obj[0].horaI +' a '+ obj[0].horaF +
				'<div class="row center choose1">Elija una de las tres ponencias a las que asistirá</div></label></div>');
		$.each(obj,function(i,value){
			$(".ponenciasLunes2").append('<div class="col s4"><div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row center">Responsable: '+obj[i].ponente+'</div><div class="row center">'+obj[i].lugar+'</div><div class="row">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><input class="with-gap" name="lu2" type="radio" id="'+obj[i].idtaller+'" onclick="lunes2('+obj[i].idtaller+')" value="'+obj[i].idtaller+'"><label for="'+obj[i].idtaller+'" style="font-weight:bold">Asistiré</label></div></br></div>');
		});
	});
	$.get("customTaller", {
		op : 7
	}, function(data) {
		var obj = JSON.parse(data);
		$(".ponenciasMiercoles1").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label >'+ obj[0].horaI +' a '+ obj[0].horaF +
				'<div class="row center choose1">Elija una de las tres ponencias a las que asistirá</div></label></div>');
		$.each(obj,function(i,value){
			$(".ponenciasMiercoles1").append('<div class="col s4"><div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row center">Responsable: '+obj[i].ponente+'</div><div class="row center">'+obj[i].lugar+'</div><div class="row">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><input class="with-gap" name="mi1" type="radio" id="'+obj[i].idtaller+'" onclick="miercoles1('+obj[i].idtaller+')" value="'+obj[i].idtaller+'"><label for="'+obj[i].idtaller+'" style="font-weight:bold">Asistiré</label></div></br></div>');
		});
	});
	$.get("customTaller", {
		op : 8
	}, function(data) {
		var obj = JSON.parse(data);
		$(".ponenciasMiercoles2").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ obj[0].horaI +' a '+ obj[0].horaF +
				'<div class="row center choose1">Elija una de las tres ponencias a las que asistirá</div></label></div>');
		$.each(obj,function(i,value){
			$(".ponenciasMiercoles2").append('<div class="col s4"><div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row center">Responsable: '+obj[i].ponente+'</div><div class="row center">'+obj[i].lugar+'</div><div class="row">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><input class="with-gap" name="mi2" type="radio" id="'+obj[i].idtaller+'" onclick="miercoles2('+obj[i].idtaller+')" value="'+obj[i].idtaller+'" value="'+obj[i].idtaller+'"><label for="'+obj[i].idtaller+'" style="font-weight:bold">Asistiré</label></div></br></div>');
		});
	});
	$.get("customTaller", {
		op : 9
	}, function(data) {
		var obj = JSON.parse(data);
		$(".ponenciasMiercoles3").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ obj[0].horaI +' a '+ obj[0].horaF +
				'<div class="row center choose1">Elija una de las tres ponencias a las que asistirá</div></label></div>');
		$.each(obj,function(i,value){
			$(".ponenciasMiercoles3").append('<div class="col s4"><div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row center">Responsable: '+obj[i].ponente+'</div><div class="row center">'+obj[i].lugar+'</div><div class="row">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><input class="with-gap" name="mi3" type="radio" id="'+obj[i].idtaller+'" onclick="miercoles3('+obj[i].idtaller+')" value="'+obj[i].idtaller+'" value="'+obj[i].idtaller+'"><label for="'+obj[i].idtaller+'" style="font-weight:bold">Asistiré</label></div></br></div>');
		});
	});
	$.get("customTaller", {
		op : 10
	}, function(data) {
		var obj = JSON.parse(data);
		$(".ponenciasMiercoles4").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ obj[0].horaI +' a '+ obj[0].horaF +
				'<div class="row center choose1">Elija una de las tres ponencias a las que asistirá</div></label></div>');
		$.each(obj,function(i,value){
			$(".ponenciasMiercoles4").append('<div class="col s4"><div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row center">Responsable: '+obj[i].ponente+'</div><div class="row center">'+obj[i].lugar+'</div><div class="row">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><input class="with-gap" name="mi4" type="radio" id="'+obj[i].idtaller+'" onclick="miercoles4('+obj[i].idtaller+')" value="'+obj[i].idtaller+'" value="'+obj[i].idtaller+'"><label for="'+obj[i].idtaller+'" style="font-weight:bold">Asistiré</label></div></br></div>');
		});
	});
	$.get("customTaller", {
		op : 11
	}, function(data) {
		var obj = JSON.parse(data);
		$(".ponenciasViernes1").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ obj[0].horaI +' a '+ obj[0].horaF +
				'<div class="row center choose1">Elija una de las tres ponencias a las que asistirá</div></label></div>');
		$.each(obj,function(i,value){
			$(".ponenciasViernes1").append('<div class="col s4"><div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row center">Responsable: '+obj[i].ponente+'</div><div class="row center">'+obj[i].lugar+'</div><div class="row">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><input class="with-gap" name="vi1" type="radio" id="'+obj[i].idtaller+'" onclick="viernes1('+obj[i].idtaller+')" value="'+obj[i].idtaller+'"><label for="'+obj[i].idtaller+'" style="font-weight:bold">Asistiré</label></div></br></div>');
		});
	});
	$.get("customTaller", {
		op : 12
	}, function(data) {
		var obj = JSON.parse(data);
		$(".ponenciasViernes2").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ obj[0].horaI +' a '+ obj[0].horaF +
				'<div class="row center choose1">Elija una de las tres ponencias a las que asistirá</div></label></div>');
		$.each(obj,function(i,value){
			$(".ponenciasViernes2").append('<div class="col s4"><div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row center">Responsable: '+obj[i].ponente+'</div><div class="row center">'+obj[i].lugar+'</div><div class="row">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><input class="with-gap" name="vi2" type="radio" id="'+obj[i].idtaller+'"  onclick="viernes2('+obj[i].idtaller+')" value="'+obj[i].idtaller+'"><label for="'+obj[i].idtaller+'" style="font-weight:bold">Asistiré</label></div></br></div>');
		});
	});
	(function() {
		setInterval(function() {
			var el = document.getElementById('blink');
			var el2 = document.getElementById('blink2');
			var el3 = document.getElementById('blink3');
			var el4 = document.getElementById('blink4');
			var el5 = document.getElementById('blink5');
			var el6 = document.getElementById('blink6');
			if (el.className == 'luz'||el2.className == 'luz'||el3.className == 'luz'||
					el4.className == 'luz'||el5.className == 'luz'||el6.className == 'luz') {
				el.className = 'luz on';
				el2.className = 'luz on';
				el3.className = 'luz on';
				el4.className = 'luz on';
				el5.className = 'luz on';
				el6.className = 'luz on';
			} else {
				el.className = 'luz';
				el2.className = 'luz';
				el3.className = 'luz';
				el4.className = 'luz';
				el5.className = 'luz';
				el6.className = 'luz';
			}
		}, 500);

	})();


	var options = [ {
		selector : '#staggered-test',
		offset : 400,
		callback : function(el) {
			Materialize.showStaggeredList($(el));
		}

	} ];

	Materialize.scrollFire(options);

	function handleOrientationChange(mediaquery) {
		if (mediaquery.matches) {
	
			$('b1').val("");
		} else {
			
		}
	}
	mediaquery.addListener(handleOrientationChange);

	$('#my-collapsible').bind('expand', function() {
		alert('Expanded');
	}).bind('collapse', function() {
		alert('Collapsed');
	});
});

function aumentarProgreso() {
		progreso = (counter/ 10) * 100;
		$(".determinate").css("width", progreso + "%");
		$("#progreso").html("");
		$("#progreso").append(
				"<span style='color:grey'><b>"
						+ [ counter]
						+ " de 10</b></span>");
}

function lunes1(valor) {
	if(l1==false){
		l1=true;
		counter++;
		aumentarProgreso();
	}comprobar();lun1=valor;
	if(l1==true&&l2==true){
		$("#one").removeClass("#ccff90");
		$("#one").addClass("#00e676 green accent-3");
	}
}

function lunes2(valor) {
	if(l2==false){
		l2=true;
		counter++;
		aumentarProgreso();
	}comprobar();lun2=valor;
	if(l1==true&&l2==true){
		$("#one").removeClass("#ccff90");
		$("#one").addClass("#00e676 green accent-3");

	}
}
function martes1(valor) {
	if(m1==false){
		m1=true;
		counter++;
		aumentarProgreso();
	}comprobar();mar=valor;
	if(m1==true){
		$("#two").removeClass("#ccff90");
		$("#two").addClass("#00e676 green accent-3");
	}
}
function martes2(valor) {
	if(m2==false){
		m2=true;
		counter++;
		aumentarProgreso();
	}comprobar();mar=valor;
	if(m2==true){
		$("#two").removeClass("#ccff90");
		$("#two").addClass("#00e676 green accent-3");
	}
}
function miercoles1(valor) {
	if(mi1==false){
		mi1=true;
		counter++;
		aumentarProgreso();
	}comprobar();mier1=valor;
	if(mi1==true&&mi2==true&&mi3==true&&mi4==true){
		$("#three").removeClass("#ccff90");
		$("#three").addClass("#00e676 green accent-3");
	}
}
function miercoles2(valor) {
	if(mi2==false){
		mi2=true;
		counter++;
		aumentarProgreso();
	}comprobar();mier2=valor;
	if(mi1==true&&mi2==true&&mi3==true&&mi4==true){
		$("#three").removeClass("#ccff90");
		$("#three").addClass("#00e676 green accent-3");
	}
}
function miercoles3(valor) {
	if(mi3==false){
		mi3=true;
		counter++;
		aumentarProgreso();
	}comprobar();mier3=valor;
	if(mi1==true&&mi2==true&&mi3==true&&mi4==true){
		$("#three").removeClass("#ccff90");
		$("#three").addClass("#00e676 green accent-3");
	}
}
function miercoles4(valor) {
	if(mi4==false){
		mi4=true;
		counter++;
		aumentarProgreso();
	}comprobar();mier4=valor;
	if(mi1==true&&mi2==true&&mi3==true&&mi4==true){
		$("#three").removeClass("#ccff90");
		$("#three").addClass("#00e676 green accent-3");
	}
}
function jueves1(valor) {
	if(j1==false){
		j1=true;
		counter++;
		aumentarProgreso();
	}comprobar();jue=valor;
	if(j1==true){
		$("#four").removeClass("#ccff90");
		$("#four").addClass("#00e676 green accent-3");
	}
}
function jueves2(valor) {
	if(j2==false){
		j2=true;
		counter++;
		aumentarProgreso();
	}comprobar();jue=valor;
	if(j2==true){
		$("#four").removeClass("#ccff90");
		$("#four").addClass("#00e676 green accent-3");
	}
}
function viernes1(valor) {
	if(v1==false){
		v1=true;
		counter++;
		aumentarProgreso();
	}comprobar();vie1=valor;
	if(v1==true&&v2==true){
		$("#five").removeClass("#ccff90");
		$("#five").addClass("#00e676 green accent-3");
	}
}
function viernes2(valor) {
	if(v2==false){
		v2=true;
		counter++;
		aumentarProgreso();
	}
	comprobar();vie2=valor;
	if(v1==true&&v2==true){
		$("#five").removeClass("#ccff90");
		$("#five").addClass("#00e676 green accent-3");
	}
}
$(".b1").click(
		function() {
			alertify
					.confirm('Inscripción de horario',
							'¿Desea confirmar su asistencia a esta ponencia?',
							function() {
								localStorage.setItem("insc1", 1);
							
									
								lunes1();
								if (localStorage.getItem("contador")) {
									localStorage.setItem("contador",
											parseInt(localStorage
													.getItem("contador")) + 1);
									aumentarProgreso();
								} else {
									counter = counter + 1;
									localStorage.setItem("contador", counter);
									aumentarProgreso();
								}
							}, function() {
							});

		});


$(".confirmar").click(function(){
	 var isOpen = alertify.confirm().isOpen(); 
	 if(isOpen=true){
		 $(".ajs-ok").attr("id","alertyboton");
		 $(".ajs-cancel").attr("id","alertyboton2");
	 }
	$("#alertyboton").addClass("btn waves-effect waves-light #2962ff blue accent-4");
	$("#alertyboton2").addClass("btn waves-effect waves-light #bdbdbd grey lighten-1");
	alertify.confirm('Inscripción de horario', '¿Desea confirmar su el horario?</br>Considere que una vez que confirme no podrá elegir de nuevo el horario', function(){
	
		a = $("#a").val(); b = $("#b").val(); c = $("#c").val(); d = $("#d").val(); e = $("#e").val();
		f = $("#f").val(); g = $("#g").val(); h = $("#h").val(); i = $("#i").val(); j = $("#j").val();
		k = $("#k").val(); l = $("#l").val(); m = $("#m").val(); n = $("#n").val(); o = $("#o").val();
		p = $("#p").val(); q = $("#q").val(); r = $("#r").val(); s = $("#s").val();

		array = lun1+","+lun2+","+mar+","+mier1+","+mier2+","+mier3+","+mier4+","+jue+","+vie1+","+vie2+","+a+","+b+","+c+","+d+","+
		e+","+f+","+g+","+h+","+j+","+k+","+l+","+n+","+o+","+p+","+r+","+s;
		console.log(array);
	
		alertify.notify('Guardando información...', 'custom', 3, function(){
		$.get("talleres",{op:1,array:array},function(data){
			
			if(data>=26){
					var link = coneia_context_path + "/principal";
					$(".todo").empty();
					$(".loadin").css("display","block");
					location.href = link;
				
				
//				setTimeout(function() {
//					location.href = link;
//				}, 3000);
			}else{
				
			}
			});
		});
	}
   , function(){ });

	
});


