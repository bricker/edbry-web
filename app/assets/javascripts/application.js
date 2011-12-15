// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function () {
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
})