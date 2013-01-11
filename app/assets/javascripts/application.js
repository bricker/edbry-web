//= require jquery
//= require jquery_ujs
//= require jquery.svg.js
//= require jquery.svganim.js
//= require_tree .

$.ajaxSetup({
  beforeSend: function(xhr) {
    xhr.setRequestHeader("Accept", "text/javascript");
  }
});

$(document).ready(function () {
	
	// TODO Auto-zoom in on planet when page is HTML-requested (like if someone types in expandableweb.com/blog)
	// TODO Implement HTML5 History for back button stuff
	
  var textarea = $("fieldset textarea"),
      iWidth = textarea.width(),
      iHeight = textarea.height();
  console.log(iWidth);
  textarea.focus(function() {
    $(this).animate({
      width: 500,
      height: 200
    }, 'fast')
  }).blur(function() {
    $(this).animate({
      width: iWidth,
      height: iHeight
    }, 'fast')
  });
  
  winWidth = $(document).innerWidth();
  winHeight = $(document).innerHeight();
  $('#allSVG').svg({ loadURL: 'assets/objects-in-space.svg', onLoad: afterLoad });
})