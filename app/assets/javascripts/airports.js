// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){

  var change_pulldown = function(){

    var originAirportId = $('#origin_airport_pulldown').val()
    console.log(originAirportId)
    $.ajax({
      dataType: "script",
      type: "get",
      url: "/departing_flights/" + originAirportId
    });
  }; // change_pulldown


  $("#origin_airport_button").on('click', function(){
    console.log("clicked");
    change_pulldown();
  });

//#########

  var change_pulldown2 = function(){
    var destinationAirportId = $('#departing_flights_pulldown').val()
    var originAirportId2 = $('h3').attr('id');
    $.ajax({
      dataType: "script",
      type: "get",
      url: "/destination_airport/" + originAirportId2 + "/" + destinationAirportId
    });
  }; // change_pulldown


  $("body").on('click', '#departing_flights_button', function(){
    console.log("clicked2");
    change_pulldown2();
  });

}); // doc.ready

