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
	$("input[type=radio][name='lu1']").click(function(){
		alert("JONAAAAAAS");
	});
	
	
	$('input[type=radio][name=grupo1]').change(function() {
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
				m2=false; 
				counter--;
				aumentarProgreso();
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
				m1=false; 
				counter--;
				aumentarProgreso();
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
				j2=false; 
				counter--;
				aumentarProgreso();
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
				j1=false; 
				counter--;
				aumentarProgreso();
			}
			comprobar();
		}
	});
	aumentarProgreso();
	$('ul.tabs').tabs({
		swipeable : false,
		responsiveThreshold : 1920,
		onShow : function(tab) {
			// console.log(tab[0].id.split('-')[1]);
			var t = tab[0].id.split('-')[1];
			$("#" + t).addClass("#ccff90 light-green accent-1")
		}
	});
	$.get("customTaller", {
		op : 1
	}, function(data) {
		var obj = JSON.parse(data);
//		alert(obj[0].idtaller)
		$(".visitaMartes").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label style="font-size:14px">'+ obj[0].horaI +' a '+ obj[0].horaF +'</label></div>');
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
		$(".talleresMartes").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label style="font-size:14px">'+ obj[0].horaI +' a '+ obj[0].horaF +'</label></div>');
		$.each(obj,function(i,value){
//			alert(obj[i].idtaller)
			if(typeof obj[i].lugar==="undefined" ||obj[i].lugar===""){
				place="";
			}else{
				place=obj[i].lugar;
			}
			$(".talleresMartes").append('<div class="col s12"><div class="row">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row">Lugar: '+place+'</div><div class="row">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><input class="with-gap" name="group2" type="radio" id="'+obj[i].idtaller+'" onclick="martes2('+obj[i].idtaller+')" disabled><label for="'+obj[i].idtaller+'" style="font-weight:bold">Asistiré</label></div></br></div>');
		});		
	});
	$.get("customTaller", {
		op : 3
	}, function(data) {
		var obj = JSON.parse(data);
		var place="";
//		alert(obj[0].idtaller)
		$(".visitasJueves").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label style="font-size:14px">'+ obj[0].horaI +' a '+ obj[0].horaF +'</label></div>');
		$.each(obj,function(i,value){
//			alert(obj[i].idtaller)
			if(typeof obj[i].lugar==="undefined" ||obj[i].lugar===""){
				place="";
			}else{
				place=obj[i].lugar;
			}
			$(".visitasJueves").append('<div class="col s12"><div class="row">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row">Lugar: '+place+'</div><div class="row">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><input class="with-gap" name="group3" type="radio" id="'+obj[i].idtaller+'" onclick="jueves1('+obj[i].idtaller+')" value="'+obj[i].idtaller+'" disabled><label for="'+obj[i].idtaller+'" style="font-weight:bold">Asistiré</label></div></br></div>');
		});		
	});
	$.get("customTaller", {
		op : 4
	}, function(data) {
		var obj = JSON.parse(data);
		var place="";
//		alert(obj[0].idtaller)
		$(".talleresJueves").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label style="font-size:14px">'+ obj[0].horaI +' a '+ obj[0].horaF +'</label></div>');
		$.each(obj,function(i,value){
//			alert(obj[i].idtaller)
			if(typeof obj[i].lugar==="undefined" ||obj[i].lugar===""){
				place="";
			}else{
				place=obj[i].lugar;
			}
			$(".talleresJueves").append('<div class="col s12"><div class="row">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row">Lugar: '+place+'</div><div class="row">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><input class="with-gap" name="group4" type="radio" id="'+obj[i].idtaller+'" onclick="jueves2('+obj[i].idtaller+')" value="'+obj[i].idtaller+'"><label for="'+obj[i].idtaller+'" style="font-weight:bold">Asistiré</label></div></br></div>');
		});		
	});
	$.get("customTaller", {
		op : 5
	}, function(data) {
		var obj = JSON.parse(data);
		$(".ponenciasLunes").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label style="font-size:14px">'+ obj[0].horaI +' a '+ obj[0].horaF +
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
		$(".ponenciasLunes2").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label style="font-size:14px">'+ obj[0].horaI +' a '+ obj[0].horaF +
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
		$(".ponenciasMiercoles1").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label style="font-size:14px">'+ obj[0].horaI +' a '+ obj[0].horaF +
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
		$(".ponenciasMiercoles2").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label style="font-size:14px">'+ obj[0].horaI +' a '+ obj[0].horaF +
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
		$(".ponenciasMiercoles3").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label style="font-size:14px">'+ obj[0].horaI +' a '+ obj[0].horaF +
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
		$(".ponenciasMiercoles4").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label style="font-size:14px">'+ obj[0].horaI +' a '+ obj[0].horaF +
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
		$(".ponenciasViernes1").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label style="font-size:14px">'+ obj[0].horaI +' a '+ obj[0].horaF +
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
		$(".ponenciasViernes2").append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label style="font-size:14px">'+ obj[0].horaI +' a '+ obj[0].horaF +
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
			console.log("mediaquery dentro de 600");
			$('b1').val("");
		} else {
			console.log("mediaquery fuera de 600");
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
}

function lunes2(valor) {
	if(l2==false){
		l2=true;
		counter++;
		aumentarProgreso();
	}comprobar();lun2=valor;
}
function martes1(valor) {
	if(m1==false){
		m1=true;
		counter++;
		aumentarProgreso();
	}comprobar();mar=valor;
}
function martes2(valor) {
	if(m2==false){
		m2=true;
		counter++;
		aumentarProgreso();
	}comprobar();mar=valor;
}
function miercoles1(valor) {
	if(mi1==false){
		mi1=true;
		counter++;
		aumentarProgreso();
	}comprobar();mier1=valor;
}
function miercoles2(valor) {
	if(mi2==false){
		mi2=true;
		counter++;
		aumentarProgreso();
	}comprobar();mier2=valor;
}
function miercoles3(valor) {
	if(mi3==false){
		mi3=true;
		counter++;
		aumentarProgreso();
	}comprobar();mier3=valor;
}
function miercoles4(valor) {
	if(mi4==false){
		mi4=true;
		counter++;
		aumentarProgreso();
	}comprobar();mier4=valor;
}
function jueves1(valor) {
	if(j1==false){
		j1=true;
		counter++;
		aumentarProgreso();
	}comprobar();jue=valor;
}
function jueves2(valor) {
	if(j2==false){
		j2=true;
		counter++;
		aumentarProgreso();
	}comprobar();jue=valor;
}
function viernes1(valor) {
	if(v1==false){
		v1=true;
		counter++;
		aumentarProgreso();
	}comprobar();vie1=valor;
}
function viernes2(valor) {
	if(v2==false){
		v2=true;
		counter++;
		aumentarProgreso();
	}
	comprobar();vie2=valor;
}
$(".b1").click(
		function() {
			alertify
					.confirm('Inscripción de horario',
							'¿Desea confirmar su asistencia a esta ponencia?',
							function() {
								localStorage.setItem("insc1", 1);
								console.log(localStorage.getItem("insc1")
										+ " soy uno");
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
		console.log("lunes1:"+lun1+"\n"+"lunes2:"+lun2+"\n"+"martes:"+mar+"\n"+"miercoles1:"+mier1+"\n"+"miercoles2:"+mier2+"\n"+"miercoles3:"
				+mier3+"\n"+"miercoles4:"+mier4+"\n"+"jueves:"+jue+"\n"+"viernes1:"+vie1+"\n"+"viernes2:"+vie2);
		a = $("#a").val(); b = $("#b").val(); c = $("#c").val(); d = $("#d").val(); e = $("#e").val();
		f = $("#f").val(); g = $("#g").val(); h = $("#h").val(); i = $("#i").val(); j = $("#j").val();
		k = $("#k").val(); l = $("#l").val(); m = $("#m").val(); n = $("#n").val(); o = $("#o").val();
		p = $("#p").val(); q = $("#q").val(); r = $("#r").val(); s = $("#s").val();
		console.log(a+b+c+d+e+f+g+h+i+j+k+l+m+n+o+p+q+r+s);
		array = lun1+","+lun2+","+mar+","+mier1+","+mier2+","+mier3+","+mier4+","+jue+","+vie1+","+vie2+","+a+","+b+","+c+","+d+","+
		e+","+f+","+g+","+h+","+j+","+k+","+l+","+m+","+n+","+o+","+p+","+r+","+s;
		console.log(array);
		$.get("talleres",{op:1,array:array},function(data){
			console.log(data);
			if(data>=27){
				console.log("Insertado");
				var link = coneia_context_path + "/principal";
				$(".todo").empty();
				$(".loadin").css("display","block");
				
				setTimeout(function() {
					location.href = link;
				}, 3000);
			}else{
				console.log("algo anda mal..")
			}
		});
	}
   , function(){ });

	
});


