% #!/usr/bin/env python
% # -*- coding: utf-8 -*-

<!DOCTYPE html>
<html>
  <head>
    <style type="text/css">
      html, body { height: 100%; margin: 0; padding: 0; }
      #map { height: 100%; }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <script type="text/javascript">

var map;
function initMap() {
  var marcadores = {{!loc}};
  var myLatLng = {lat: {{lat}}, lng: {{lon}}};
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 15,
    center: new google.maps.LatLng({{lat}}, {{lon}}),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  var infowindow = new google.maps.InfoWindow();
  var marker, i;
  for (i = 0; i < marcadores.length; i++) {  
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(marcadores[i][1], marcadores[i][2]),
      map: map
    });
    google.maps.event.addListener(marker, 'click', (function(marker, i) {
      return function() {
        infowindow.setContent(marcadores[i][0]);
        infowindow.open(map, marker);
      }
    })(marker, i));
  }
}
 google.maps.event.addDomListener(window, 'load', initMap);
    </script>
    <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBiVmIZCcnp0vMtBJoIIOPt1HZPhZ9xgos&callback=initMap">
    </script>
  </body>
</html>

