$("#selection_window").empty()
$("#selection_window2").append "<%= j render '/airports/flights' %>"
$("h3").append "<h4 id='<%= @destination_airport.id %>'>You are arriving in: <%= @destination_airport.name %></h4>"