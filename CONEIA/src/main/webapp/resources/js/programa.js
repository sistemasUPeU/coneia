$(document).ready(function(){
	$('.collapsible').collapsible();
    $('ul.tabs').tabs({
      swipeable : true,
      responsiveThreshold : 1920,
      onShow: function(tab) {
    	  //console.log(tab[0].id.split('-')[1]);
    	  var t = tab[0].id.split('-')[1];
    	  $( "#"+t).addClass( "#ccff90 light-green accent-1" )
    	  }
    });
    
    var options = [{
        selector: '#staggered-test',
        offset: 300,
        callback: function(el) {
          Materialize.showStaggeredList($(el));
        }
      
      }];
      
      Materialize.scrollFire(options);
  });