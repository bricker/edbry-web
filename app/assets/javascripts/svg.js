var winWidth, winHeight;
var BrownPlanet, OrangePlanet, PurplePlanet, GreyPlanet, BluePlanet;
var zoomTime = 4000; // time in ms to zoom in or out
 
$(document).ready(function() {
  winWidth = $(document).innerWidth();
  winHeight = $(document).innerHeight();
  $('#allSVG').svg({ loadURL: 'assets/objects-in-space.svg', onLoad: afterLoad });
});

Planet = function(parentSVG) {
  var svg = parentSVG;
  return {
    zoom: function(x, y, w, h, t) {
      svg.animate({
        svgViewBox: x + ',' + y + ',' + w + ',' + h
      }, t)
    } // zoom
  }
}

/*
var starSpeed = 1000 * 60 * 10;
var starOffset = 100;
var starI = 1;

function rotateStars() {
  $('#starsGroup').attr('transform', 'rotate(0)');
  $('#starsGroup').animate({
    svgTransform: 'translate(' + winWidth/2 + ' ' + winHeight/2 + ')rotate(360)'
  }, starSpeed, 'linear');
  starI *= -1;
  starOffset *= starI;

  setTimeout('rotateStars()', starSpeed + 10);
}
*/

function afterLoad(svg) {
  registerEvents(svg);
  drawStars(svg);
  
  parentSVG = $('svg#spaceArt');
  BrownPlanet = new Planet(parentSVG);
  OrangePlanet = new Planet(parentSVG);
  PurplePlanet = new Planet(parentSVG);
  GreyPlanet = new Planet(parentSVG);
  BluePlanet = new Planet(parentSVG);
  
  // rotateStars();
}

function moveStars(x, y, speed) {
  $('#starsGroup').animate({
    svgTransform: 'translate('+x+', '+y+')'
    }, speed);
}

function loadContent(path) {
  $.ajax({
    type : 'GET',
    url : path,
    dataType : 'script'
  });
}

function registerEvents(svg) { // TODO Maybe: Do the animations AFTER the content as been loaded, to avoid blank pages should an error occur.
                              // Edward's note: this happens already because this function is called in the $(document).ready block.
  $('#Brown_x5F_Planet,a[href="/about"]').click(function(e) {
    BrownPlanet.zoom(108, 449.8, 30, 30, zoomTime);
    moveStars(150, -50, zoomTime);
    moveTitle('up');
    loadContent('/about');
    e.preventDefault();
  });

  $('#Orange_x5F_Planet,a[href="/portfolio"]').click(function(e) {
    OrangePlanet.zoom(280, 398.8, 50, 50, zoomTime);
    moveStars(100, -25, zoomTime);
    moveTitle('up');
    loadContent('/portfolio');
    e.preventDefault();
    
    $('#Rocket').animate({
      svgTransform: 'translate(520,0)'
      }, zoomTime
    );
  });

  $('#Purple_x5F_Planet,a[href="/projects"]').click(function(e) {
    PurplePlanet.zoom(488, 440, 36, 36, zoomTime);
    moveStars(20, -50, zoomTime);
    moveTitle('up');
    loadContent('/projects');
    e.preventDefault();

    $('#Ring_Back, #Ring_Front').animate({
        opacity: 0.3
      }, zoomTime);
  });

  $('#Grey_x5F_Planet,a[href="/blog"]').click(function(e) {
    GreyPlanet.zoom(642, 476.95, 20, 20, zoomTime);
    moveStars(-50, -75, zoomTime);
    moveTitle('up');
    loadContent('/blog');
    e.preventDefault();
  });

  $('#Blue_x5F_Planet,a[href="/contact"]').click(function(e) {
    BluePlanet.zoom(767, 436.05, 39, 39, zoomTime);
    moveStars(-100, -50, zoomTime);
    moveTitle('up');
    loadContent('/contact');
    e.preventDefault();
  });
  
  $('#Moon_1_').click(function(e) {
    $(this).animate({
      svgTransform: 'rotate(360, 200, 100)'
      }, zoomTime
    )
  });
  
  function zoomedIn () {
    if ($('body.zoomedIn').length) { // if the body has a class of zoomedIn
      return true;
    } else {
      return false;
    }
  }
  
  $('#back').click(function(e) {
    if (zoomedIn()) { // if the body has a class of zoomedIn
      $('svg#spaceArt').animate({
        svgViewBox: '0, 0, 1605, 1000'
        }, zoomTime/2
      );
    
      $('#Ring_Back, #Ring_Front').animate({ opacity: 1 }, zoomTime/2);
      $('#Rocket').animate({ svgTransform: 'translate(325.757,386.58)' }, zoomTime/2);
    
      moveStars(0,0, zoomTime/2);
      moveTitle('down');
      loadContent('/pages');
    }; // if zoomedIn()
  });
  
  var mouseOverT, mouseOutT;
  
  $('body,.planet').hover(function() {
    clearTimeout(mouseOutT);
    mouseOverT = setTimeout(navAppear, 1000);
  }, function() {
    clearTimeout(mouseOverT);
    mouseOutT = setTimeout(navDisappear, 2000);
  })
  
  navAppear = function() {
    $('.zoomedOut #page-content>nav').css({
      top: '670'
    }).animate({
      top: '620',
      opacity: 1
    }, 400)
  }
  
  navDisappear = function() {
    $('.zoomedOut #page-content>nav').animate({
      top: '570',
      opacity: 0
      }, 200)
  }

  $('.planet').click(function() {
    clearTimeout(mouseOverT);
    clearTimeout(mouseOutT);
    $('.zoomedOut #page-content>nav').animate({
      top: '700',
      opacity: 0
      }, 1000)
  });
  
} // registerEvents
  
function moveTitle (direction) {
  moveTime = zoomTime/2;
  if (direction == 'up') {
    $('#title').animate({'top': 40}, moveTime);
    
    $('body').removeClass('zoomedOut')
    setTimeout(function() {
      $('body').addClass('zoomedIn');
    }, zoomTime);
    
  } else if (direction == 'down') {
    $('#title').animate({'top': 181}, moveTime);
    
    $('body').removeClass('zoomedIn');
    setTimeout(function() {
      $('body').addClass('zoomedOut');
    }, moveTime);
  };
}

function drawStars (svg) {
  var starsGroup = $('#starsGroup');
  for (var i = 280 - 1; i >= 0; i--){
    var cx = (Math.random() - 0.2) * winWidth * 1.4,
        cy = (Math.random() - 0.2) * winHeight * 1.4,
        r = Math.random() * 2 + 1;
        // c = Math.round((r-1)/2 * 127 + 127); // make between 0 & 1 and then scale to 0 & 255
        // c = '#' + c.toString(16) + c.toString(16) + c.toString(16); // convert to hex color
    svg.circle(starsGroup, cx, cy, r/*,  {fill: c} */);
  };
}