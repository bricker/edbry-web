var winWidth, winHeight;
  
$(document).ready(function() {
  winWidth = $(document).innerWidth();
  winHeight = $(document).innerHeight();
  $("#allSVG").svg({ loadURL: 'assets/art.svg', onLoad: afterLoad });
});
  
function afterLoad(svg) {
  registerEvents(svg);
  drawStars(svg);
}
  
function registerEvents(svg) {
  zoomTime = 4000; // time in ms to zoom in or out
  $("#Brown_x5F_Planet").click(function() {
    $("svg#spaceArt").animate({
      svgViewBox: '108, 449.8, 30, 30'
      }, zoomTime),
    moveTitle("up");

		$.ajax({
	  	type : 'GET',
	  	url : '/about',
	  	dataType : 'script'
	  });
  });
  $("#Orange_x5F_Planet").click(function() {
    $("svg#spaceArt").animate({
      svgViewBox: '280, 398.8, 50, 50',
      // svgTransform: 'rotate(45,200,100)'
      }, zoomTime),
    $("#Rocket").animate({
      svgTransform: 'translate(520,0)'
      }, zoomTime)
    moveTitle("up");
  });
  $("#Purple_x5F_Planet").click(function() {
    $("svg#spaceArt").animate({
      svgViewBox: '488, 440, 36, 36'
      }, zoomTime),
    $("#Ring_Back, #Ring_Front").animate({
        opacity: 0.3
      }, zoomTime),
    moveTitle("up");
  });
  $("#Grey_x5F_Planet").click(function() {
    $("svg#spaceArt").animate({
      svgViewBox: '642, 476.95, 20, 20'
      }, zoomTime),
    moveTitle("up");
  });
  $("#Blue_x5F_Planet").click(function() {
    $("svg#spaceArt").animate({
      svgViewBox: '767, 436.05, 39, 39'
      }, zoomTime),
    moveTitle("up");
  });
  
  $("#Moon_1_").click(function() {
    
    $(this).animate({
      svgTransform: 'rotate(360, 200, 100)',
      }, zoomTime)
  });
  
  $("#title").click(function() {
    $("svg#spaceArt").animate({
      svgViewBox: '0, 0, 1605, 1000'
      }, zoomTime/2),
    $("#Ring_Back, #Ring_Front").animate({ opacity: 1 }, zoomTime/2),
    $("#Rocket").animate({ svgTransform: 'translate(325.757,386.58)' }, zoomTime/2),
    moveTitle("down");
  });
}
  
function moveTitle (direction) {
  if (direction == "up") {
    $("#title").animate({'top': 40}, 2000)
  } else if (direction == "down") {
    $("#title").animate({'top': 181}, 2000)
  };
}

function drawStars (svg) {
  var starsGroup = $("#starsGroup");
  for (var i = 200 - 1; i >= 0; i--){
    var cx = Math.random() * winWidth,
        cy = Math.random() * winHeight,
        r = Math.random() * 3;
    svg.circle(starsGroup, cx, cy, r, {fill: "#fff"});
  };
}