$(document).ready ->
  change_pulldown = ->
    originAirportId = $("#origin_airport_pulldown").val()
    console.log originAirportId
    $.ajax
      dataType: "script"
      type: "get"
      url: "/departing_flights/" + originAirportId


  # change_pulldown
  $("#origin_airport_button").on "click", ->
    console.log "clicked"
    change_pulldown()


  ##########
  change_pulldown2 = ->
    destinationAirportId = $("#departing_flights_pulldown").val()
    originAirportId2 = $("h3").attr("id")
    $.ajax
      dataType: "script"
      type: "get"
      url: "/destination_airport/" + originAirportId2 + "/" + destinationAirportId


  # change_pulldown
  $("body").on "click", "#departing_flights_button", ->
    console.log "clicked2"
    change_pulldown2()


# doc.ready