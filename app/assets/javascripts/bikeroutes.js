
var map = L.mapbox.map('map', 'mapbox.run-bike-hike')
    .setView([37.778313, -122.416105], 14);
//
var bikeRoute = map.featureLayer.setGeoJSON(routegeojson, {
  style: function (feature) {
    return {
      color: feature.properties.stroke,
      weight: feature.properties['stroke-width'],
      opacity: feature.properties['stroke-opacity']
    };
	}
});
bikeRoute.eachLayer( function (layer){
  map.setView([layer.feature.centroid[1], layer.feature.centroid[0]], 14 );
  layer.bindPopup(layer.feature.properties.name);
});
