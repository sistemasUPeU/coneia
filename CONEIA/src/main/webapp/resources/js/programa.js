var mediaquery = window.matchMedia("(max-width: 600px)");
var counter = 0;
var progreso = 0;
$(document).ready(function(){
	aumentarProgreso();
    $('ul.tabs').tabs({
      swipeable : false,
      responsiveThreshold : 1920,
      onShow: function(tab) {
    	  //console.log(tab[0].id.split('-')[1]);
    	  var t = tab[0].id.split('-')[1];
    	  $( "#"+t).addClass( "#ccff90 light-green accent-1" )
    	  }
    });
    (function() {

    	setInterval(function(){
    	  var el = document.getElementById('blink');
    	  if(el.className == 'luz'){
    	      el.className = 'luz on';
    	  }else{
    	      el.className = 'luz';
    	  }
    	},500);

    	})();
    
    (function() {

    	setInterval(function(){
    	  var el = document.getElementById('blink2');
    	  if(el.className == 'luz'){
    	      el.className = 'luz on';
    	  }else{
    	      el.className = 'luz';
    	  }
    	},500);

    	})();
   lunes1();lunes2();
    

    var options = [{
        selector: '#staggered-test',
        offset: 300,
        callback: function(el) {
          Materialize.showStaggeredList($(el));
        }
      
      }];
      
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
    	
    	$('#my-collapsible').bind('expand', function () {
    	    alert('Expanded');
    	}).bind('collapse', function () {
    	    alert('Collapsed');
    	});
  });

function aumentarProgreso(){
	if(localStorage.getItem("contador")){
		progreso = (localStorage.getItem("contador")/11)*100;
		localStorage.setItem("progreso",progreso);
		$(".determinate").css("width",localStorage.getItem("progreso")+"%");
		$("#progreso").html("");
		$("#progreso").append("<span style='color:grey'><b>"+[localStorage.getItem("contador")]+" de 11</b></span>");
	}else{
		progreso = (counter/11)*100;
		$(".determinate").css("width",progreso+"%");
		$("#progreso").html("");
		$("#progreso").append("<span style='color:grey'><b>"+[counter]+" de 11</b></span>");
	}
	
}

function lunes1(){
//	 $.get("talleres",{op:1,fecha:"2018-06-04",hora:"10:30"},function(data){
	    	if(localStorage.getItem("insc1")){
	    		$(".choose1").css("display","none");
	    		$(".took1").css("display","block");
	    		$(".pick1").css("display","none");
	    		$(".bot1").css("display","block");	
	    	}else{
	    		$(".choose1").css("display","block");
	    		$(".took1").css("display","none");
	    		$(".pick1").css("display","block");
	    		$(".bot1").css("display","none");
	    	}
//	    });
}

function lunes2(){
//	 $.get("talleres",{op:1,fecha:"2018-06-04",hora:"11:30"},function(data){	    	
	    	if(localStorage.getItem("insc2")){
	    		$(".choose2").css("display","none");
	    		$(".took2").css("display","block");
	    		$(".pick2").css("display","none");
	    		$(".bot2").css("display","block");
	    	}else{
	    		$(".choose2").css("display","block");
	    		$(".took2").css("display","none");
	    		$(".pick2").css("display","block");
	    		$(".bot2").css("display","none");
	    	}
//	    });

}

$(".b1").click(function(){
	alertify.confirm('Inscripción de horario', '¿Desea confirmar su asistencia a esta ponencia?', function(){
		 localStorage.setItem("insc1",1);
		 console.log(localStorage.getItem("insc1")+" soy uno"); lunes1();
		 if(localStorage.getItem("contador")){
			 localStorage.setItem("contador",parseInt(localStorage.getItem("contador"))+1);
			 aumentarProgreso();
		 }else{
			 counter= counter+1;
			 localStorage.setItem("contador",counter);
			 aumentarProgreso(); 
		 }
	}
    , function(){ });

});

//$.get("talleres",{op:2,idtaller:1,fecha:"2018-06-04",hora:"10:30"},function(data){
//	 if(data==1){
//		 lunes1();
//		 alertify.success('Inscripción confirmada'); 
//	 }
//	 
//});
$(".b2").click(function(){
	alertify.confirm('Inscripción de horario', '¿Desea confirmar su asistencia a esta ponencia?', function(){
		 localStorage.setItem("insc1",2);
		 console.log(localStorage.getItem("insc1")+" soy dos"); lunes1();
		 if(localStorage.getItem("contador")){
			 localStorage.setItem("contador",parseInt(localStorage.getItem("contador"))+1);
			 aumentarProgreso();
		 }else{
			 counter= counter+1;
			 localStorage.setItem("contador",counter);
			 aumentarProgreso(); 
		 }
	}
   , function(){ });
});

//$.get("talleres",{op:2,idtaller:2,fecha:"2018-06-04",hora:"10:30"},function(data){
//	 if(data==1){
//		 lunes1();
//		 alertify.success('Inscripción confirmada'); 
//	 }
//	 
//});
$(".b3").click(function(){
	alertify.confirm('Inscripción de horario', '¿Desea confirmar su asistencia a esta ponencia?', function(){
		 localStorage.setItem("insc1",3);
		 console.log(localStorage.getItem("insc1")+" soy tres"); lunes1();
		 if(localStorage.getItem("contador")){
			 localStorage.setItem("contador",parseInt(localStorage.getItem("contador"))+1);
			 aumentarProgreso();
		 }else{
			 counter= counter+1;
			 localStorage.setItem("contador",counter);
			 aumentarProgreso(); 
		 }
	}
   , function(){ });
});
//$.get("talleres",{op:2,idtaller:3,fecha:"2018-06-04",hora:"10:30"},function(data){
//	 if(data==1){
//		 lunes1();
//		 alertify.success('Inscripción confirmada'); 
//	 }
//	 
//});
$(".b4").click(function(){
	alertify.confirm('Inscripción de horario', '¿Desea confirmar su asistencia a esta ponencia?', function(){
		localStorage.setItem("insc2",4);
		 console.log(localStorage.getItem("insc2")+" soy cuatro"); lunes2();
		 if(localStorage.getItem("contador")){
			 localStorage.setItem("contador",parseInt(localStorage.getItem("contador"))+1);
			 aumentarProgreso();
		 }else{
			 counter= counter+1;
			 localStorage.setItem("contador",counter);
			 aumentarProgreso(); 
		 }
		 
	}
   , function(){ });
});
//$.get("talleres",{op:2,idtaller:4,fecha:"2018-06-04",hora:"11:30"},function(data){
//	 if(data==1){
//		 lunes2();
//		 alertify.success('Inscripción confirmada'); 
//	 }
//	 
//});
$(".b5").click(function(){
	alertify.confirm('Inscripción de horario', '¿Desea confirmar su asistencia a esta ponencia?', function(){
		localStorage.setItem("insc2",5);
		 console.log(localStorage.getItem("insc2")+" soy cinco"); lunes2();
		 if(localStorage.getItem("contador")){
			 localStorage.setItem("contador",parseInt(localStorage.getItem("contador"))+1);
			 aumentarProgreso();
		 }else{
			 counter= counter+1;
			 localStorage.setItem("contador",counter);
			 aumentarProgreso(); 
		 }
	}
   , function(){ });
});
//$.get("talleres",{op:2,idtaller:5,fecha:"2018-06-04",hora:"11:30"},function(data){
//	 if(data==1){
//		 lunes2();
//		 alertify.success('Inscripción confirmada'); 
//	 }
//	 
//});

$(".b6").click(function(){
	alertify.confirm('Inscripción de horario', '¿Desea confirmar su asistencia a esta ponencia?', function(){
		localStorage.setItem("insc2",6);
		 console.log(localStorage.getItem("insc2")+" soy seis"); lunes2();
		 if(localStorage.getItem("contador")){
			 localStorage.setItem("contador",parseInt(localStorage.getItem("contador"))+1);
			 aumentarProgreso();
		 }else{
			 counter= counter+1;
			 localStorage.setItem("contador",counter);
			 aumentarProgreso(); 
		 }
		
	}
   , function(){ });
});

//$.get("talleres",{op:2,idtaller:6,fecha:"2018-06-04",hora:"11:30"},function(data){
//	 if(data==1){
//		 lunes2();
//		 alertify.success('Inscripción confirmada'); 
//	 }
//	 
//});

$(".again1").click(function(){
	localStorage.clear("insc1");
	lunes1();
	if(localStorage.getItem("contador")){
		var contt = parseInt(localStorage.getItem("contador"))-1;
		alert(localStorage.getItem("contador"));
		localStorage.setItem("contador",contt);
		
	}
	aumentarProgreso();
	
});
$(".again2").click(function(){
	localStorage.clear("insc2");
	lunes2();
	if(localStorage.getItem("contador")){
		var contt = parseInt(localStorage.getItem("contador"))-1;
		alert(localStorage.getItem("contador"));
		localStorage.setItem("contador",contt);
		
	}
	aumentarProgreso();
	
});
