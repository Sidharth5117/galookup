// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("semantic-ui-sass")
require("jquery")
require("@rails/ujs").start()

require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")






$('.message .close')
  .on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade')
    ;
  })
;



//$( function() {

// } );


$(document).on('turbolinks:load', function() {
$('.ui.dropdown').dropdown();
 $( "#datepicker" ).datepicker();
$('#example2').calendar({
  type: 'date'
});







})





// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "controllers"



window.initMap = function(...args) {
const event = document.createEvent("Events")
event.initEvent("google-maps-callback", true, true)
event.args=args
window.dispatchEvent(event)
}
