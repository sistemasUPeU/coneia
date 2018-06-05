var mediaquery = window.matchMedia("(max-width: 600px)");
var vtm =0; vtj=0; tem=0;tej=0;lu1=0;lu2=0;mi1=0;mi2=0;mi3=0;mi4=0;vi1=0;vi2=0;conf1=0;conf2=0;conf3=0;conf4=0;act1=0;act2=0;act3=0;act4=0;
var nvm=0;ntm=0;ntj=0;nvj=0;
$(document).ready(function() {
	$('.modal').modal();
//	function checkPosition() {
//	    if (window.matchMedia('(max-width: 767px)').matches) {
//	        $(".btn").css("line-height","");
//	    } else {
//	    	 $(".btn").css("line-height","3");
//	    }
//	}
	alertify.confirm().bringToFront(); 
	$('ul.tabs').tabs({
		swipeable : false,
		responsiveThreshold : 1920,
		onShow : function(tab) {
		
			var t = tab[0].id.split('-')[1];
			$("#" + t).addClass("#ccff90 light-green accent-1")
		}
	});
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
	
	listarTodito();
});

function listarTodito(){
	$.get("customTaller", {op : 30}, function(data) {
		var obj = JSON.parse(data);
//		alert(obj[0].idtaller)
		$(".visitaMartes").empty().append('<div class="row center fonto">Talleres especializados</div><div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ '7:30 AM' +' a '+ '1:00 PM' +
				'</label></div><br><div class="row center"><a class="btn-floating waves-effect waves-light green modal-trigger"  data-target="modalvm"><i class="material-icons">add</i></a></div></br><div class="divider"></div></br>');
		$.each(obj,function(i,value){
//			alert(obj[i].idtaller)
			$(".visitaMartes").append('<div class="col s12"><div class="row">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row">Responsable: '+obj[i].ponente+'</div><div class="row" style="padding-bottom:0.5em">Vacantes: <span style="color:green;"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><div class="col s6" style="padding-left:10%"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>'+
					'<div class="col s6" style="padding-right:10%"><button class="waves-effect btn-floating red" onclick="eliminar('+obj[i].idtaller+')"><i class="large material-icons">delete_forever</i></button></div></div><br>');
			var tema = obj[i].tema;var ponente = obj[i].ponente;var stock = obj[i].stock;var idtaller=obj[i].idtaller; var idtipo = obj[i].idtipo; 
			if(vtm==0){visitas(tema,ponente,stock,idtaller,idtipo);}
		});vtm++;var idtipo=4;fecha="2018-06-05";
		if(nvm==0){vitas(idtipo,fecha)};nvm++;
	});

	$.get("customTaller", {op : 31}, function(data) {
		var obj = JSON.parse(data);
		var place="";
//		alert(obj[0].idtaller)
		$(".talleresMartes").empty().append('<div class="row center fonto">Visitas técnicas</div><div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ '6:30 AM' +' a '+ '1:00 PM' +
				'</label></div><br><div class="row center"><a class="btn-floating waves-effect waves-light green modal-trigger"  data-target="modaltm"><i class="material-icons">add</i></a></div></br><div class="divider"></div></br>');
		$.each(obj,function(i,value){
//			alert(obj[i].idtaller)
			if(typeof obj[i].lugar==="undefined" ||obj[i].lugar===""){
				place="";
			}else{
				place=obj[i].lugar;
			}
			$(".talleresMartes").append('<div class="col s12"><div class="row">'+(i+1)+'. Lugar: <b>'+obj[i].tema
					+'</b></div><div class="row">Requisitos: '+place+'</div><div class="row"  style="padding-bottom:0.5em">Vacantes: <span style="color:green;"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><div class="col s6" style="padding-left:10%"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>'+
					'<div class="col s6" style="padding-right:10%"><button class="waves-effect btn-floating red"  onclick="eliminar('+obj[i].idtaller+')"><i class="large material-icons">delete_forever</i></button></div></div><br>');
			var tema = obj[i].tema;var stock = obj[i].stock;var idtaller=obj[i].idtaller; var idtipo = obj[i].idtipo;
			if(tem==0){talleres(tema,place,stock,idtaller,idtipo);}			
		});	tem++;var idtipo=2;fecha="2018-06-05";
		if(ntm==0){vitas(idtipo,fecha)};ntm++;
	});
	$.get("customTaller", {op : 32}, function(data) {
		var obj = JSON.parse(data);
		var place="";
//		alert(obj[0].idtaller)
		$(".visitasJueves").empty().append('<div class="row center fonto">Talleres especializados</div><div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label >'+ '7:30 AM' +' a '+ '1:00 PM' +
				'</label></div><br><div class="row center"><a class="btn-floating waves-effect waves-light green modal-trigger"  data-target="modalvj"><i class="material-icons">add</i></a></div></br><div class="divider"></div></br>');
		$.each(obj,function(i,value){
//			alert(obj[i].idtaller)
			if(typeof obj[i].lugar==="undefined" ||obj[i].lugar===""){
				place="";
			}else{
				place=obj[i].lugar;
			}
			$(".visitasJueves").append('<div class="col s12"><div class="row">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row">Responsable: '+obj[i].ponente+'</div><div class="row" style="padding-bottom:0.5em">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><div class="col s6" style="padding-left:10%"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>'+
					'<div class="col s6" style="padding-right:10%"><button class="waves-effect btn-floating red" onclick="eliminar('+obj[i].idtaller+')" ><i class="large material-icons">delete_forever</i></button></div></div></br>');
			var tema = obj[i].tema;var ponente = obj[i].ponente;var stock = obj[i].stock;var idtaller=obj[i].idtaller;var idtipo = obj[i].idtipo;
			if(vtj==0){visitas(tema,ponente,stock,idtaller,idtipo);}	
		});	vtj++;var idtipo=4;fecha="2018-06-07";
		if(nvj==0){vitas(idtipo,fecha)};nvj++;
	});
	$.get("customTaller", {op : 33}, function(data) {
		var obj = JSON.parse(data);
		var place="";
//		alert(obj[0].idtaller)
		$(".talleresJueves").empty().append('<div class="row center fonto">Visitas técnicas</div><div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ '6:30 AM' +' a '+ '1:00 PM' +
				'</label></div><br><div class="row center"><a class="btn-floating waves-effect waves-light green modal-trigger"  data-target="modaltj"><i class="material-icons">add</i></a></div></br><div class="divider"></div></br>');
		$.each(obj,function(i,value){
//			alert(obj[i].idtaller)
			if(typeof obj[i].lugar==="undefined" ||obj[i].lugar===""){
				place="";
			}else{place=obj[i].lugar;}
			$(".talleresJueves").append('<div class="col s12"><div class="row">'+(i+1)+'. Lugar: <b>'+obj[i].tema
					+'</b></div><div class="row">Requisitos: '+place+'</div><div class="row" style="padding-bottom:0.5em">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><div class="col s6" style="padding-left:10%"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>'+
					'<div class="col s6" style="padding-right:10%"><button class="waves-effect btn-floating red"  onclick="eliminar('+obj[i].idtaller+')"><i class="large material-icons">delete_forever</i></button></div></div></br>');
			var tema = obj[i].tema;var stock = obj[i].stock;var idtaller=obj[i].idtaller; var idtipo = obj[i].idtipo;
			if(tej==0){talleres(tema,place,stock,idtaller,idtipo);}	
		});	tej++;	var idtipo=2;fecha="2018-06-07";
		if(ntj==0){vitas(idtipo,fecha)};ntj++;
	});
	$.get("customTaller", {op : 35}, function(data) {
		var obj = JSON.parse(data);
		$(".ponenciasLunes").empty().append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ obj[0].horaI +' a '+ obj[0].horaF +
				'</label></div><div class="divider"></div><br>');
		$.each(obj,function(i,value){
			$(".ponenciasLunes").append('<div class="col s4"><div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row center">Ponente: '+obj[i].ponente+'</div><div class="row center">Lugar: '+obj[i].lugar+'</div><div class="row" style="padding-bottom:0.5em">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><div class="col s6"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>'+
					'<div class="col s6"><button class="waves-effect btn-floating red" onclick="eliminar('+obj[i].idtaller+')"><i class="large material-icons">delete_forever</i></button></div>');
			var tema = obj[i].tema;var ponente = obj[i].ponente;var lugar = obj[i].lugar;var stock = obj[i].stock;var idtaller=obj[i].idtaller;var idtipo = obj[i].idtipo; 
			if(lu1==0){modales(tema,ponente,lugar,stock,idtaller,idtipo);}
		});lu1++;
	});
	$.get("customTaller", {op : 36}, function(data) {
		var obj = JSON.parse(data);
		$(".ponenciasLunes2").empty().append('</br><div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ obj[0].horaI +' a '+ obj[0].horaF +
				'</label></div><div class="divider"></div><br>');
		$.each(obj,function(i,value){
			$(".ponenciasLunes2").append('<div class="col s4"><div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row center">Ponente: '+obj[i].ponente+'</div><div class="row center">Lugar: '+obj[i].lugar+'</div><div class="row" style="padding-bottom:0.5em">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><div class="col s6"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>'+
					'<div class="col s6"><button class="waves-effect btn-floating red" onclick="eliminar('+obj[i].idtaller+')"><i class="large material-icons">delete_forever</i></button></div>');
			var tema = obj[i].tema;var ponente = obj[i].ponente;var lugar = obj[i].lugar;var stock = obj[i].stock;var idtaller=obj[i].idtaller;var idtipo = obj[i].idtipo; 
			if(lu2==0){modales(tema,ponente,lugar,stock,idtaller,idtipo);}
		});lu2++;
	});
	$.get("customTaller", {op : 37}, function(data) {
		var obj = JSON.parse(data);
		$(".ponenciasMiercoles1").empty().append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ obj[0].horaI +' a '+ obj[0].horaF +
				'</label></div><div class="divider"></div><br>');
		$.each(obj,function(i,value){
			$(".ponenciasMiercoles1").append('<div class="col s4"><div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row center">Ponente: '+obj[i].ponente+'</div><div class="row center">Lugar: '+obj[i].lugar+'</div><div class="row" style="padding-bottom:0.5em">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><div class="col s6"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>'+
					'<div class="col s6"><button class="waves-effect btn-floating red" onclick="eliminar('+obj[i].idtaller+')"><i class="large material-icons">delete_forever</i></button></div>');
			var tema = obj[i].tema;var ponente = obj[i].ponente;var lugar = obj[i].lugar;var stock = obj[i].stock;var idtaller=obj[i].idtaller;var idtipo = obj[i].idtipo; 
			if(mi1==0){modales(tema,ponente,lugar,stock,idtaller,idtipo);}
		});mi1++;
	});
	$.get("customTaller", {op : 38}, function(data) {
		var obj = JSON.parse(data);
		$(".ponenciasMiercoles2").empty().append('</br><div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ obj[0].horaI +' a '+ obj[0].horaF +
				'</label></div><div class="divider"></div><br>');
		$.each(obj,function(i,value){
			$(".ponenciasMiercoles2").append('<div class="col s4"><div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row center">Ponente: '+obj[i].ponente+'</div><div class="row center">Lugar: '+obj[i].lugar+'</div><div class="row" style="padding-bottom:0.5em">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><div class="col s6"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>'+
					'<div class="col s6"><button class="waves-effect btn-floating red modal-trigger" ><i class="large material-icons">delete_forever</i></button><div>');
			var tema = obj[i].tema;var ponente = obj[i].ponente;var lugar = obj[i].lugar;var stock = obj[i].stock;var idtaller=obj[i].idtaller;var idtipo = obj[i].idtipo; 
			if(mi2==0){modales(tema,ponente,lugar,stock,idtaller,idtipo);}
		});mi2++;
	});
	$.get("customTaller", {op : 39}, function(data) {
		var obj = JSON.parse(data);
		$(".ponenciasMiercoles3").empty().append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ obj[0].horaI +' a '+ obj[0].horaF +
				'</label></div><div class="divider"></div><br>');
		$.each(obj,function(i,value){
			$(".ponenciasMiercoles3").append('<div class="col s4"><div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row center">Ponente: '+obj[i].ponente+'</div><div class="row center">Lugar: '+obj[i].lugar+'</div><div class="row" style="padding-bottom:0.5em">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><div class="col s6"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>'+
					'<div class="col s6"><button class="waves-effect btn-floating red" onclick="eliminar('+obj[i].idtaller+')"><i class="large material-icons">delete_forever</i></button></div>');
			var tema = obj[i].tema;var ponente = obj[i].ponente;var lugar = obj[i].lugar;var stock = obj[i].stock;var idtaller=obj[i].idtaller;var idtipo = obj[i].idtipo; 
			if(mi3==0){modales(tema,ponente,lugar,stock,idtaller,idtipo);}
		});mi3++;
	});
	$.get("customTaller", {op : 40}, function(data) {
		var obj = JSON.parse(data);
		$(".ponenciasMiercoles4").empty().append('</br><div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ obj[0].horaI +' a '+ obj[0].horaF +
				'</label></div><div class="divider"></div><br>');
		$.each(obj,function(i,value){
			$(".ponenciasMiercoles4").append('<div class="col s4"><div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row center">Ponente: '+obj[i].ponente+'</div><div class="row center">Lugar: '+obj[i].lugar+'</div><div class="row" style="padding-bottom:0.5em">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><div class="col s6"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>'+
					'<div class="col s6"><button class="waves-effect btn-floating red" onclick="eliminar('+obj[i].idtaller+')"><i class="large material-icons">delete_forever</i></button></div>');
			var tema = obj[i].tema;var ponente = obj[i].ponente;var lugar = obj[i].lugar;var stock = obj[i].stock;var idtaller=obj[i].idtaller;var idtipo = obj[i].idtipo; 
			if(mi4==0){modales(tema,ponente,lugar,stock,idtaller,idtipo);}
		});mi4++;
	});
	$.get("customTaller", {op : 41}, function(data) {
		var obj = JSON.parse(data);
		$(".ponenciasViernes1").empty().append('<div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ obj[0].horaI +' a '+ obj[0].horaF +
				'</label></div><div class="divider"></div><br>');
		$.each(obj,function(i,value){
			$(".ponenciasViernes1").append('<div class="col s4"><div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row center">Ponente: '+obj[i].ponente+'</div><div class="row center">Lugar: '+obj[i].lugar+'</div><div class="row" style="padding-bottom:0.5em">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><div class="col s6"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>'+
					'<div class="col s6"><button class="waves-effect btn-floating red" onclick="eliminar('+obj[i].idtaller+')"><i class="large material-icons">delete_forever</i></button></div>');
			var tema = obj[i].tema;var ponente = obj[i].ponente;var lugar = obj[i].lugar;var stock = obj[i].stock;var idtaller=obj[i].idtaller;var idtipo = obj[i].idtipo; 
			if(vi1==0){modales(tema,ponente,lugar,stock,idtaller,idtipo);}
		});vi1++;
	});
	$.get("customTaller", {op : 42}, function(data) {
		var obj = JSON.parse(data);
		$(".ponenciasViernes2").empty().append('</br><div class="row center"><i class="material-icons md-18">access_time</i> Horario: <label>'+ obj[0].horaI +' a '+ obj[0].horaF +
				'</label><div class="divider"></div><br></div>');
		$.each(obj,function(i,value){
			$(".ponenciasViernes2").append('<div class="col s4"><div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row center">Ponente: '+obj[i].ponente+'</div><div class="row center">Lugar: '+obj[i].lugar+'</div><div class="row" style="padding-bottom:0.5em">Vacantes: <span style="color:green"><b>'+obj[i].stock+'</b></span></div>'+
					'<div class="row"><div class="col s6"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>'+
					'<div class="col s6"><button class="waves-effect btn-floating red" onclick="eliminar('+obj[i].idtaller+')"><i class="large material-icons">delete_forever</i></button></div>');
			var tema = obj[i].tema;var ponente = obj[i].ponente;var lugar = obj[i].lugar;var stock = obj[i].stock;var idtaller=obj[i].idtaller;var idtipo = obj[i].idtipo; 
			if(vi2==0){modales(tema,ponente,lugar,stock,idtaller,idtipo);}
		});vi2++;
		
	});
	//O  N  L  Y    U  P  D  A  T  E
	$.get("customTaller", {op : 14}, function(data) {
		var obj = JSON.parse(data); var div="";
		$.each(obj,function(i,value){
			if(i==0){div=".conf1"}else{div=".conf2"}
			$(div).empty().append('<div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row center">Ponente: '+obj[i].ponente+'</div><div class="row center">Lugar: '+obj[i].lugar+'</div>'+
					'<div class="row center"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>');
			var tema = obj[i].tema;var ponente = obj[i].ponente;var lugar = obj[i].lugar;var stock = obj[i].stock;var idtaller=obj[i].idtaller;var idtipo = obj[i].idtipo; 
			if(conf1==0){conferencias(tema,ponente,lugar,idtaller,idtipo);}
		});conf1++;
	});
	$.get("customTaller", {op : 18}, function(data) {
		var obj = JSON.parse(data); var div="";
		$.each(obj,function(i,value){
			if(i==0){div=".conf3"}else{div=".conf4"}
			$(div).empty().append('<div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row center">Ponente: '+obj[i].ponente+'</div><div class="row center">Lugar: '+obj[i].lugar+'</div>'+
					'<div class="row center"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>');
			var tema = obj[i].tema;var ponente = obj[i].ponente;var lugar = obj[i].lugar;var stock = obj[i].stock;var idtaller=obj[i].idtaller;var idtipo = obj[i].idtipo; 
			if(conf2==0){conferencias(tema,ponente,lugar,idtaller,idtipo);}
		});conf2++;
	});
	$.get("customTaller", {op : 19}, function(data) {
		var obj = JSON.parse(data); var div="";
		$.each(obj,function(i,value){
			if(i==0){div=".conf5"}if(i==1){div=".conf6"}
			if(i==0||i==1){
				$(div).empty().append('<div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
						+'</b></div><div class="row center">Ponente: '+obj[i].ponente+'</div><div class="row center">Lugar: '+obj[i].lugar+'</div>'+
						'<div class="row center"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>');
				var tema = obj[i].tema;var ponente = obj[i].ponente;var lugar = obj[i].lugar;var stock = obj[i].stock;var idtaller=obj[i].idtaller;var idtipo = obj[i].idtipo; 
				if(conf3==0){conferencias(tema,ponente,lugar,idtaller,idtipo);}
			}
			
		});conf3++;
	});
	$.get("customTaller", {op : 20}, function(data) {
		var obj = JSON.parse(data);var ponente="";
		
		$.each(obj,function(i,value){
			if(typeof obj[i].ponente==="undefined" ||obj[i].ponente===""){
				ponente="";}else{ponente= obj[i].ponente;
			}
			$(".conf7").empty().append('<div class="row center">'+(i+1)+'. Tema: <b>'+obj[i].tema
					+'</b></div><div class="row center">Ponente: '+ponente+'</div><div class="row center">Lugar: '+obj[i].lugar+'</div>'+
					'<div class="row center"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>');
			var tema = obj[i].tema;var lugar = obj[i].lugar;var stock = obj[i].stock;var idtaller=obj[i].idtaller;var idtipo = obj[i].idtipo; 
			if(conf4==0){conferencias(tema,ponente,lugar,idtaller,idtipo);}
		});conf4++;
	});
	$.get("customTaller", {op : 15}, function(data) {
		var obj = JSON.parse(data);var ponente="";var div="";
		
		$.each(obj,function(i,value){
			if(i==0){div=".act1"} if(i==1){div=".act2"}
			if(i==0 || i==1){
				$(div).empty().append('<div class="row center">'+(i+1)+'. Evento: <b>'+obj[i].tema
						+'</b></div><div class="row center">Lugar: '+obj[i].lugar+'</div>'+
						'<div class="row center"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>');
				var tema = obj[i].tema;var lugar = obj[i].lugar;var stock = obj[i].stock;var idtaller=obj[i].idtaller;var idtipo = obj[i].idtipo; 
				if(act1==0){actividades(tema,lugar,idtaller,idtipo);
				}
			}
			
		});act1++;
	});
	$.get("customTaller", {op : 16}, function(data) {
		var obj = JSON.parse(data);var div="";
		$.each(obj,function(i,value){
			if(i==0){div=".act3"};if(i==1){div=".act4"};if(i==2){div=".act5"};if(i==3){div=".act6"};if(i==4){div=".act7"}
			$(div).empty().append('<div class="row center">'+(i+1)+'. Evento: <b>'+obj[i].tema
					+'</b></div><div class="row center">Lugar: '+obj[i].lugar+'</div>'+
					'<div class="row center"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>');
			var tema = obj[i].tema;var lugar = obj[i].lugar;var stock = obj[i].stock;var idtaller=obj[i].idtaller;var idtipo = obj[i].idtipo; 
			if(act2==0){actividades(tema,lugar,idtaller,idtipo);}
		});act2++;
	});
	$.get("customTaller", {op : 17}, function(data) {
		var obj = JSON.parse(data);var div="";		
		$.each(obj,function(i,value){
			if(i==0){div=".act8"};if(i==1){div=".act9"};if(i==2){div=".act10"};
			if(i==0||i==1||i==2){
			$(div).empty().append('<div class="row center">'+(i+1)+'. Evento: <b>'+obj[i].tema
					+'</b></div><div class="row center">Lugar: '+obj[i].lugar+'</div>'+
					'<div class="row center"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>');
			var tema = obj[i].tema;var lugar = obj[i].lugar;var stock = obj[i].stock;var idtaller=obj[i].idtaller;var idtipo = obj[i].idtipo; 
			if(act3==0){actividades(tema,lugar,idtaller,idtipo);}}
		});act3++;
	});
	$.get("customTaller", {op : 21}, function(data) {
		var obj = JSON.parse(data);var div="";	
		$.each(obj,function(i,value){
			if(i==0){div=".act11"};if(i==1){div=".act12"};
			if(i==0||i==1){
				$(div).empty().append('<div class="row center">'+(i+1)+'. Evento: <b>'+obj[i].tema
						+'</b></div><div class="row center">Lugar: '+obj[i].lugar+'</div>'+
						'<div class="row center"><a class="btn-floating orange modal-trigger" data-target="modal'+obj[i].idtaller+'"><i class="large material-icons">mode_edit</i></a></div>');
				var tema = obj[i].tema;var lugar = obj[i].lugar;var stock = obj[i].stock;var idtaller=obj[i].idtaller;var idtipo = obj[i].idtipo; 
				if(act4==0){actividades(tema,lugar,idtaller,idtipo);
				}
			}
			
		});act4++;
	});
	
	
}


$(".confirmar").click(function(){
	 var isOpen = alertify.confirm().isOpen(); 
	 if(isOpen=true){
		 $(".ajs-ok").attr("id","alertyboton");
		 $(".ajs-cancel").attr("id","alertyboton2");
	 }
	$("#alertyboton").addClass("btn waves-effect waves-light #2962ff blue accent-4");
	$("#alertyboton2").addClass("btn waves-effect waves-light #bdbdbd grey lighten-1");
	alertify.confirm('Inscripción de horario</span>', '¿Desea confirmar su asistencia a estas ponencias y talleres?', function(){

		array = lun1+","+lun2+","+mar+","+mier1+","+mier2+","+mier3+","+mier4+","+jue+","+vie1+","+vie2;
		
		$.get("talleres",{op:1,array:array},function(data){
			
			if(data==10){
			
				var link = coneia_context_path + "/principal";
				$(".todo").css("display","none");
				$(".loadin").css("display","block");
				
				setTimeout(function() {
					location.href = link;
				}, 3000);
			}
		});
	}
   , function(){ });
});
function vitas(idtipo,fecha){
	 var horaI="06:30";horaF ="13:00";  horaI2="07:30";
	 
	if(idtipo==4){
		if(fecha=="2018-06-05"){
			$("#modalvm").css("z-index","50000");
			$("#modales").append('<div id="modalvm" class="modal"><div class="modal-content modal-form"><div class="row">'+
					'<h2 class="center" style="font-family:' +"'"+'Cinzel'+"'"+', serif;">Nueva visita técnica</h2><div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">account_balance</i><textarea type="text" placeholder="Escriba el tema" id="temavm" class="materialize-textarea" ></textarea>'+
					'<label for="temavm" class="active">Tema: </label></div></div><div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">account_circle</i><input type="text" placeholder="Escriba el nombre de la empresa o responsable" id="ponentevm" value=""/>'+
					'<label for="ponentevm" class="active">Responsable: </label></div></div><div class="col s12"><div class="input-field inline col s6"><i class="material-icons prefix">mode_edit</i><input type="number" min="0" placeholder="Escriba el stock" id="stockvm" value=""/>'+
					'<label for="stockvm" class="active">Stock: </label></div></div></div></div>'+
					'<div class="modal-footer inline"><a class=" waves-effect waves-light btn #0277bd light-blue darken-3" onclick="nuevoVitas(\''+idtipo+'\',\''+horaI+'\',\''+horaF+'\',\''+fecha+'\')" style="width:30%"><i class="material-icons">save</i></a> <a href="#!" class="modal-action modal-close waves-effect waves-light btn-flat">Cerrar</a></div></div>');
			$('.modal').modal({
				
				ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
					modal.css("z-index","50000");
					$("#modales").show();
			        
			      },
			      complete: function() { $("#modales").hide();} // Callback for Modal close
			});
		}else{
			$("#modalvj").css("z-index","50000");
			$("#modales").append('<div id="modalvj" class="modal"><div class="modal-content modal-form"><div class="row">'+
					'<h2 class="center" style="font-family:' +"'"+'Cinzel'+"'"+', serif;">Nueva visita técnica</h2><div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">account_balance</i><textarea type="text" placeholder="Escriba el tema" id="temavj" class="materialize-textarea" ></textarea>'+
					'<label for="temavj" class="active">Tema: </label></div></div><div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">account_circle</i><input type="text" placeholder="Escriba el nombre de la empresa o responsable" id="ponentevj" value=""/>'+
					'<label for="lugarvj" class="active">Responsable: </label></div></div><div class="col s12"><div class="input-field inline col s6"><i class="material-icons prefix">mode_edit</i><input type="number" min="0" placeholder="Escriba el stock" id="stockvj" value=""/>'+
					'<label for="stockvj" class="active">Stock: </label></div></div></div></div>'+
					'<div class="modal-footer inline"><a class=" waves-effect waves-light btn #0277bd light-blue darken-3" onclick="nuevoVitas(\''+idtipo+'\',\''+horaI+'\',\''+horaF+'\',\''+fecha+'\')" style="width:30%"><i class="material-icons">save</i></a> <a href="#!" class="modal-action modal-close waves-effect waves-light btn-flat">Cerrar</a></div></div>');
			$('.modal').modal({
				
				ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
					modal.css("z-index","50000");
					$("#modales").show();
			      
			      },
			      complete: function() { $("#modales").hide();} // Callback for Modal close
			});
		}
		
	}else{
		if(fecha=="2018-06-05"){
			$("#modaltm").css("z-index","50000");
			$("#modales").append('<div id="modaltm" class="modal">'+
					'<div class="modal-content modal-form">'+
						'<div class="row">'+
							'<h2 class="center" style="font-family:' +"'"+'Cinzel'+"'"+', serif;">Nuevo taller especializado</h2>'+
							'<div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">account_balance</i><textarea type="text" placeholder="Escriba el tema" id="tematm" class="materialize-textarea" ></textarea><label for="tematm" class="active">Tema: </label></div></div>'+
							'<div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">account_circle</i><input type="text" placeholder="Escriba el lugar" id="lugartm" value=""/><label for="lugartm" class="active">Lugar: </label></div></div>'+
							'<div class="col s12"><div class="input-field inline col s6"><i class="material-icons prefix">mode_edit</i><input type="number" min="0" placeholder="Escriba el stock" id="stocktm" value=""/><label for="stocktm" class="active">Stock: </label></div></div>'+
						'</div></div>'+
					'<div class="modal-footer inline"><a class=" waves-effect waves-light btn #0277bd light-blue darken-3" onclick="nuevoVitas(\''+idtipo+'\',\''+horaI2+'\',\''+horaF+'\',\''+fecha+'\')" style="width:30%"><i class="material-icons">save</i></a> <a href="#!" class="modal-action modal-close waves-effect waves-light btn-flat">Cerrar</a></div>'+
							
					'</div>');
			$('.modal').modal({
				
				ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
					modal.css("z-index","50000");
					$("#modales").show();
			        
			      },
			      complete: function() { $("#modales").hide();} // Callback for Modal close
			});
		}else{
			$("#modaltj").css("z-index","50000");
			$("#modales").append('<div id="modaltj" class="modal"><div class="modal-content modal-form"><div class="row">'+
					'<h2 class="center" style="font-family:' +"'"+'Cinzel'+"'"+', serif;">Nuevo taller especializado</h2><div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">account_balance</i><textarea type="text" placeholder="Escriba el tema" id="tematj" class="materialize-textarea" ></textarea>'+
					'<label for="tematj" class="active">Tema: </label></div></div><div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">account_circle</i><input type="text" placeholder="Escriba el lugar" id="lugartj" value=""/>'+
					'<label for="lugartj" class="active">Lugar: </label></div></div><div class="col s12"><div class="input-field inline col s6"><i class="material-icons prefix">mode_edit</i><input type="number" min="0" placeholder="Escriba el stock" id="stocktj" value=""/>'+
					'<label for="stocktj" class="active">Stock: </label></div></div></div></div>'+
					'<div class="modal-footer inline"><a class=" waves-effect waves-light btn #0277bd light-blue darken-3" onclick="nuevoVitas(\''+idtipo+'\',\''+horaI2+'\',\''+horaF+'\',\''+fecha+'\')" style="width:30%"><i class="material-icons">save</i></a> <a href="#!" class="modal-action modal-close waves-effect waves-light btn-flat">Cerrar</a></div></div>');
			$('.modal').modal({
				
				ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
					modal.css("z-index","50000");
					$("#modales").show();
			      
			      },
			      complete: function() {$("#modales").hide(); } // Callback for Modal close
			});
		}
	}
	
}

function modales(tema,ponente,lugar,stock,idtaller,tipo){
	$("#modal"+idtaller).css("z-index","500"+idtaller);
	$("#modales").append('<div id="modal'+idtaller+'" class="modal"><div class="modal-content modal-form"><div class="row">'+
			'<h2 class="center" style="font-family:' +"'"+'Cinzel'+"'"+', serif;">Actualizar cambios</h2><div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">account_balance</i><textarea type="text" placeholder="Escriba el tema" id="tema'+idtaller+'" class="materialize-textarea" >'+tema+'</textarea>'+
			'<label for="tema'+idtaller+'" class="active">Tema: </label></div></div><div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">account_circle</i><input type="text" placeholder="Escriba el ponente" id="ponente'+idtaller+'" value="'+ponente+'"/>'+
			'<label for="ponente'+idtaller+'" class="active">Ponente: </label></div></div><div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">event_seat</i><input type="text" placeholder="Escriba el lugar" id="lugar'+idtaller+'" value="'+lugar+'"/>'+
			'<label for="lugar'+idtaller+'" class="active">Lugar: </label></div></div><div class="col s12"><div class="input-field inline col s6"><i class="material-icons prefix">mode_edit</i><input type="number" min="0" placeholder="Escriba el stock" id="stock'+idtaller+'" value="'+stock+'"/>'+
			'<label for="stock'+idtaller+'" class="active">Stock: </label></div></div></div><input type="hidden" id="tipo'+idtaller+'" value="'+tipo+'"/>'+
			'<a class="btn waves-effect waves-light  #1a237e indigo darken-4" onclick=(reporteTaller('+idtaller+'));>REPORTE <i class="large material-icons">print</i></a>'+
			'</div><div class="modal-footer inline"><a class=" waves-effect waves-light btn #0277bd light-blue darken-3" onclick="update('+idtaller+')" style="width:30%"><i class="material-icons">sync</i></a> <a href="#!" class="modal-action modal-close waves-effect waves-light btn-flat">Cerrar</a></div></div></div></div></br></div>');
	$('.modal').modal({
		
		ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
			modal.css("z-index","500"+idtaller);
			$("#modales").show();
	        
	      },
	      complete: function() {$("#modales").hide(); } // Callback for Modal close
	});
}

function reporteTaller(idt){
	localStorage.setItem("idtaller",idt);
	var item = localStorage.getItem("idtaller",idt);
	console.log("este es el taller: "+item);
	link = coneia_context_path  + "/admin/impresiones";
	location.href=link;
}
function conferencias(tema,ponente,lugar,idtaller,tipo){
	$("#modal"+idtaller).css("z-index","500"+idtaller);
	$("#modales").append('<div id="modal'+idtaller+'" class="modal"><div class="modal-content modal-form"><div class="row">'+
			'<h2 class="center" style="font-family:' +"'"+'Cinzel'+"'"+', serif;">Actualizar cambios</h2><div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">account_balance</i><textarea type="text" placeholder="Escriba el tema" id="tema'+idtaller+'" class="materialize-textarea" >'+tema+'</textarea>'+
			'<label for="tema'+idtaller+'" class="active">Tema: </label></div></div><div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">account_circle</i><input type="text" placeholder="Escriba el ponente" id="ponente'+idtaller+'" value="'+ponente+'"/>'+
			'<label for="ponente'+idtaller+'" class="active">Ponente: </label></div></div><div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">event_seat</i><input type="text" placeholder="Escriba el lugar" id="lugar'+idtaller+'" value="'+lugar+'"/>'+
			'<label for="lugar'+idtaller+'" class="active">Lugar: </label></div></div><input type="hidden" id="tipo'+idtaller+'" value="'+tipo+'"/>'+
			'<a class="btn waves-effect waves-light  #1a237e indigo darken-4" onclick=(reporteTaller('+idtaller+'));>REPORTE <i class="large material-icons">print</i></a>'+
			'</div><div class="modal-footer inline"><a class=" waves-effect waves-light btn #0277bd light-blue darken-3" onclick="update('+idtaller+')" style="width:30%"><i class="material-icons">sync</i></a> <a href="#!" class="modal-action modal-close waves-effect waves-light btn-flat">Cerrar</a></div></div></div></div></br></div>');
	$('.modal').modal({
		
		ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
			modal.css("z-index","600"+idtaller);
			$("#modales").show();
	       
	      },
	      complete: function() { $("#modales").hide();} // Callback for Modal close
	});
}

function actividades(tema,lugar,idtaller,tipo){
	$("#modal"+idtaller).css("z-index","500"+idtaller);
	$("#modales").append('<div id="modal'+idtaller+'" class="modal"><div class="modal-content modal-form"><div class="row">'+
			'<h2 class="center" style="font-family:' +"'"+'Cinzel'+"'"+', serif;">Actualizar cambios</h2><div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">account_balance</i><textarea type="text" placeholder="Escriba el tema" id="tema'+idtaller+'" class="materialize-textarea" >'+tema+'</textarea>'+
			'<label for="tema'+idtaller+'" class="active">Tema: </label></div></div><div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">event_seat</i><input type="text" placeholder="Escriba el lugar" id="lugar'+idtaller+'" value="'+lugar+'"/>'+
			'<label for="lugar'+idtaller+'" class="active">Lugar: </label></div></div><input type="hidden" id="tipo'+idtaller+'" value="'+tipo+'"/>'+
			'<a class="btn waves-effect waves-light  #1a237e indigo darken-4" onclick=(reporteTaller('+idtaller+'));>REPORTE <i class="large material-icons">print</i></a>'+
			'</div><div class="modal-footer inline"><a class=" waves-effect waves-light btn #0277bd light-blue darken-3" onclick="update('+idtaller+')" style="width:30%"><i class="material-icons">sync</i></a> <a href="#!" class="modal-action modal-close waves-effect waves-light btn-flat">Cerrar</a></div></div></div></div></br></div>');
	$('.modal').modal({
		
		ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
			modal.css("z-index","600"+idtaller);
			$("#modales").show();
	        
	      },
	      complete: function() { $("#modales").hide();} // Callback for Modal close
	});
}

function visitas(tema,ponente,stock,idtaller,tipo){
	$("#modal"+idtaller).css("z-index","500"+idtaller);
	$("#modales").append('<div id="modal'+idtaller+'" class="modal"><div class="modal-content modal-form"><div class="row">'+
			'<h2 class="center" style="font-family:' +"'"+'Cinzel'+"'"+', serif;">Actualizar cambios</h2><div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">account_balance</i><textarea type="text" placeholder="Escriba el tema" id="tema'+idtaller+'" class="materialize-textarea" >'+tema+'</textarea>'+
			'<label for="tema'+idtaller+'" class="active">Tema: </label></div></div><div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">account_circle</i><input type="text" placeholder="Escriba la entidad responsable" id="ponente'+idtaller+'" value="'+ponente+'"/>'+
			'<label for="ponente'+idtaller+'" class="active">Ponente: </label></div></div><div class="col s12"><div class="input-field inline col s6"><i class="material-icons prefix">mode_edit</i><input type="number" min="0" placeholder="Escriba el stock" id="stock'+idtaller+'" value="'+stock+'"/>'+
			'<label for="stock'+idtaller+'" class="active">Stock: </label></div></div></div><input type="hidden" id="tipo'+idtaller+'" value="'+tipo+'"/>'+
			'<a class="btn waves-effect waves-light  #1a237e indigo darken-4" onclick=(reporteTaller('+idtaller+'));>REPORTE <i class="large material-icons">print</i></a>'+
			'</div><div class="modal-footer inline"><a class=" waves-effect waves-light btn #0277bd light-blue darken-3" onclick="update('+idtaller+')" style="width:30%"><i class="material-icons">sync</i></a> <a href="#!" class="modal-action modal-close waves-effect waves-light btn-flat">Cerrar</a></div></div></div></div></br></div>');
	$('.modal').modal({
		
		ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
			modal.css("z-index","500"+idtaller);
			$("#modales").show();
	       
	      },
	      complete: function() { $("#modales").hide(); } // Callback for Modal close
	});
}
function talleres(tema,lugar,stock,idtaller,tipo){
	$("#modal"+idtaller).css("z-index","500"+idtaller);
	$("#modales").append('<div id="modal'+idtaller+'" class="modal"><div class="modal-content modal-form"><div class="row">'+
			'<h2 class="center" style="font-family:' +"'"+'Cinzel'+"'"+', serif;">Actualizar cambios</h2><div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">account_balance</i><textarea type="text" placeholder="Escriba el tema" id="tema'+idtaller+'" class="materialize-textarea" >'+tema+'</textarea>'+
			'<label for="tema'+idtaller+'" class="active">Tema: </label></div></div><div class="col s12"><div class="input-field inline col s12"><i class="material-icons prefix">event_seat</i><input type="text" placeholder="Escriba el lugar" id="lugar'+idtaller+'" value="'+lugar+'"/>'+
			'<label for="lugar'+idtaller+'" class="active">Lugar: </label></div></div><div class="col s12"><div class="input-field inline col s6"><i class="material-icons prefix">mode_edit</i><input type="number" min="0" placeholder="Escriba el stock" id="stock'+idtaller+'" value="'+stock+'"/>'+
			'<label for="stock'+idtaller+'" class="active">Stock: </label></div></div></div><input type="hidden" id="tipo'+idtaller+'" value="'+tipo+'"/>'+
			'<a class="btn waves-effect waves-light  #1a237e indigo darken-4" onclick=(reporteTaller('+idtaller+'));>REPORTE <i class="large material-icons">print</i></a>'+
			'</div><div class="modal-footer inline"><a class=" waves-effect waves-light btn #0277bd light-blue darken-3" onclick="update('+idtaller+')" style="width:30%"><i class="material-icons">sync</i></a> <a href="#!" class="modal-action modal-close waves-effect waves-light btn-flat">Cerrar</a></div></div></div></div></br></div>');
	$('.modal').modal({
			
			ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
		        modal.css("z-index","500"+idtaller);
		        $("#modales").show();
		      
		      },
		      complete: function() {$("#modales").hide(); } // Callback for Modal close
	});
}

function update(id){
	var idtipo = $('#tipo'+id).val();
	var tema =  $('#tema'+id).val();
	var ponente =  $('#ponente'+id).val();
	var lugar =  $('#lugar'+id).val();
	if(ponente ==undefined){ponente ="";}else{ponente =  $('#ponente'+id).val();}
	if(lugar ==undefined){lugar="";}else{lugar =  $('#lugar'+id).val();}
	var stock =  $('#stock'+id).val();
	
	if(idtipo==1||idtipo==2||idtipo==4){
		if(stock>=0){
			
			$(".ajs-header").addClass("#82b1ff  blue accent-1");
			var isOpen = alertify.confirm().isOpen(); 
			 if(isOpen=true){
				 $(".ajs-ok").attr("id","alertyboton");
				 $(".ajs-cancel").attr("id","alertyboton2");
				 $(".alertify .ajs-modal").css("z-index","9999"+id);
			 }
			 $("#alertyboton").addClass("btn waves-effect waves-light #2962ff blue accent-4");
				$("#alertyboton2").addClass("btn waves-effect waves-light #bdbdbd grey lighten-1");
				$('#modal'+id).modal('close');
				$.get("customTaller",{op:13,tema:tema,ponente:ponente,lugar:lugar,stock:stock,idtaller:id,idtipo:idtipo},function(data){
					if(data==1){
								
						alertify.notify('Actualizando...', 'custom', 1, function(){listarTodito();});
						
					}else{
					
						alertify.error('Error al intentar actualizar los datos');
					}
				});
			
	
		}else{
			alertify.error("El stock es negativo");
		}
	}else{
		if(idtipo==3){
			
			$(".ajs-header").addClass("#82b1ff  blue accent-1");
			var isOpen = alertify.confirm().isOpen(); 
			 if(isOpen=true){
				 $(".ajs-ok").attr("id","alertyboton");
				 $(".ajs-cancel").attr("id","alertyboton2");
				 $(".alertify .ajs-modal").css("z-index","99999"+id);
			 }
			 $("#alertyboton").addClass("btn waves-effect waves-light #2962ff blue accent-4");
				$("#alertyboton2").addClass("btn waves-effect waves-light #bdbdbd grey lighten-1");
	
				$('#modal'+id).modal('close');
				$.get("customTaller",{op:13,tema:tema,ponente:ponente,lugar:lugar,stock:1,idtaller:id,idtipo:idtipo},function(data){
					if(data==1){
								
						alertify.notify('Actualizando...', 'custom', 1, function(){listarTodito();});
						
					}else{
						
						alertify.error('Error al intentar actualizar los datos');
					}
				});
			
		}else{
			
			$(".ajs-header").addClass("#82b1ff  blue accent-1");
			var isOpen = alertify.confirm().isOpen(); 
			 if(isOpen=true){
				 $(".ajs-ok").attr("id","alertyboton");
				 $(".ajs-cancel").attr("id","alertyboton2");
				 $(".alertify .ajs-modal").css("z-index","99999"+id);
			 }
			 $("#alertyboton").addClass("btn waves-effect waves-light #2962ff blue accent-4");
	
				$('#modal'+id).modal('close');
				$.get("customTaller",{op:13,tema:tema,ponente:"",lugar:lugar,stock:1,idtaller:id,idtipo:idtipo},function(data){
					if(data==1){
								
						alertify.notify('Actualizando...', 'custom', 1, function(){listarTodito();});
						
					}else{
					
						alertify.error('Error al intentar actualizar los datos');
					}
				});
			
		}
		
	} 

	
}


function nuevoVitas(idtipo,horaI,horaF,fecha){
	var tema="";ponente="";stock=0;
	
	if(idtipo==4){
		if(fecha=="2018-06-05"){
			tema = $("#temavm").val();ponente =$("#ponentevm").val();stock =$("#stockvm").val();open();
			alertify.confirm('Confirmación de acción', '¿Está seguro(a) que desea confirmar este nuevo registro?', function(){
				$('#modalvm').modal('close');
				$.get("customTaller",{op:22,tema:tema,ponente:ponente,stock:stock,horaI:horaI,horaF:horaF,fecha:fecha,lugar:ponente,idtipo:idtipo},function(data){
					if(data==1){
							
						alertify.notify('Cargando...', 'custom', 1, function(){listarTodito();});
					}else{
					
						alertify.error('Error al intentar actualizar los datos');
					}
				});
			}
		   , function(){ });
			
		}else{
			tema = $("#temavj").val();ponente =$("#ponentevj").val();stock =$("#stockvj").val();open();
			alertify.confirm('Confirmación de acción', '¿Está seguro(a) que desea confirmar este nuevo registro?', function(){
				$('#modalvj').modal('close');
				$.get("customTaller",{op:22,tema:tema,ponente:ponente,stock:stock,horaI:horaI,horaF:horaF,fecha:fecha,lugar:ponente,idtipo:idtipo},function(data){
					if(data==1){
								
						alertify.notify('Cargando...', 'custom', 1, function(){listarTodito();});
					}else{
					
						alertify.error('Error al intentar actualizar los datos');
					}
				});
			}
		   , function(){ });
		}
	}else{
		if(fecha=="2018-06-05"){
			tema = $("#tematm").val();lugar =$("#lugartm").val();stock =$("#stocktm").val();open();
			alertify.confirm('Confirmación de acción', '¿Está seguro(a) que desea confirmar este nuevo registro?', function(){
				$('#modaltm').modal('close');
				$.get("customTaller",{op:22,tema:tema,ponente:lugar,stock:stock,horaI:horaI,horaF:horaF,fecha:fecha,lugar:lugar,idtipo:idtipo},function(data){
					if(data==1){
							
						alertify.notify('Cargando...', 'custom', 1, function(){listarTodito();});
					}else{
						
						alertify.error('Error al intentar actualizar los datos');
					}
				});
			}
		   , function(){ });
		}else{
			tema = $("#tematj").val();lugar =$("#lugartj").val();stock =$("#stocktj").val();open();
			alertify.confirm('Confirmación de acción', '¿Está seguro(a) que desea confirmar este nuevo registro?', function(){
				$('#modaltj').modal('close');
				$.get("customTaller",{op:22,tema:tema,ponente:lugar,stock:stock,horaI:horaI,horaF:horaF,fecha:fecha,lugar:lugar,idtipo:idtipo},function(data){
					if(data==1){
						
						alertify.notify('Cargando...', 'custom', 2, function(){listarTodito();});
					}else{
					
						alertify.error('Error al intentar actualizar los datos');
					}
				});
			}
		   , function(){ });
		}
	}
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
		$.get("customTaller",{op:23,id:id},function(data){
			if(data==1){
					
				alertify.notify('Eliminando...', 'custom', 1, function(){listarTodito();});
			}else{
				
				alertify.error('Error al intentar eliminar los datos');
			}
		});
	}
   , function(){ });

}
