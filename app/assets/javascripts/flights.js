// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){

  var map = L.mapbox.map('map', 'cstewa.map-po15cjpf').setView([42.3, -83], 3);
  $('#all-flights').find('.flight-info').each(function() {
    L.mapbox.markerLayer({
      type: 'Feature',
      geometry: {
        type: 'Point',
        coordinates: [parseFloat($(this).find('.longitude').attr('data')), parseFloat($(this).find('.latitude').attr('data'))]
      },
      properties: {
          title: $(this).find('.airport-name').attr('data'),
          description: $(this).find('.airport-city').attr('data'),
          'marker-size': 'large',
          'marker-color': '#f0a'
      }
    }).addTo(map);
  });

});