var winWidth, winHeight;
zoomTime = 4000; // time in ms to zoom in or out
 
$(document).ready(function() {
  winWidth = $(document).innerWidth();
  winHeight = $(document).innerHeight();
  $("#allSVG").svg({ loadURL: 'assets/objects-in-space.svg', onLoad: afterLoad });
});

/*
var starSpeed = 1000 * 60 * 10;
var starOffset = 100;
var starI = 1;

function rotateStars() {
  $("#starsGroup").attr('transform', 'rotate(0)');
  $("#starsGroup").animate({
    svgTransform: 'translate(' + winWidth/2 + ' ' + winHeight/2 + ')rotate(360)'
  }, starSpeed, 'linear');
  starI *= -1;
  starOffset *= starI;

  setTimeout("rotateStars()", starSpeed + 10);
}
*/

function afterLoad(svg) {
  registerEvents(svg);
  drawStars(svg);
  // rotateStars();
}

function moveStars(x, y, speed) {
	$("#starsGroup").animate({
    svgTransform: 'translate('+x+', '+y+')'
    }, speed);
}
  
function registerEvents(svg) { // TODO Maybe: Do the animations AFTER the content as been loaded, to avoid blank pages should an error occur.
  $("#Brown_x5F_Planet").click(function() {
    $("svg#spaceArt").animate({
      svgViewBox: '108, 449.8, 30, 30'
      }, zoomTime);

		moveStars(150, -50, zoomTime);
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
      }, zoomTime);

    $("#Rocket").animate({
      svgTransform: 'translate(520,0)'
      }, zoomTime);

		moveStars(100, -25, zoomTime);
    moveTitle("up");
    
    $.ajax({
      type : 'GET',
      url : '/portfolio',
      dataType : 'script'
    });
  });

  $("#Purple_x5F_Planet").click(function() {
    $("svg#spaceArt").animate({
      svgViewBox: '488, 440, 36, 36'
      }, zoomTime);

    $("#Ring_Back, #Ring_Front").animate({
        opacity: 0.3
      }, zoomTime);

		moveStars(20, -50, zoomTime);
    moveTitle("up");

    $.ajax({
      type : 'GET',
      url : '/portfolio',
      dataType : 'script'
    });
  });

  $("#Grey_x5F_Planet").click(function() {	
    $("svg#spaceArt").animate({
      svgViewBox: '642, 476.95, 20, 20'
      }, zoomTime);

		moveStars(-50, -75, zoomTime);
    moveTitle("up");

    $.ajax({
      type : 'GET',
      url : '/blog',
      dataType : 'script'
    });
  });

  $("#Blue_x5F_Planet").click(function() {
    $("svg#spaceArt").animate({
      svgViewBox: '767, 436.05, 39, 39'
      }, zoomTime);

		moveStars(-100, -50, zoomTime);
    moveTitle("up");

    $.ajax({
      type : 'GET',
      url : '/contact',
      dataType : 'script'
    });
  });
  
  $("#Moon_1_").click(function() {
    
    $(this).animate({
      svgTransform: 'rotate(360, 200, 100)',
      }, zoomTime)
  });
  
  $("#title").click(function() {
    $("svg#spaceArt").animate({
      svgViewBox: '0, 0, 1605, 1000'
      }, zoomTime/2);

    $("#Ring_Back, #Ring_Front").animate({ opacity: 1 }, zoomTime/2);
    $("#Rocket").animate({ svgTransform: 'translate(325.757,386.58)' }, zoomTime/2);
    
		moveStars(0,0, zoomTime/2);
		moveTitle("down");

    $.ajax({
      type : 'GET',
      url : '/pages',
      dataType : 'script'
    });
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
        r = Math.random() * 2 + 1;
        // c = Math.round((r-1)/2 * 127 + 127); // make between 0 & 1 and then scale to 0 & 255
        // c = '#' + c.toString(16) + c.toString(16) + c.toString(16); // convert to hex color
    svg.circle(starsGroup, cx, cy, r/*,  {fill: c} */);
  };
}