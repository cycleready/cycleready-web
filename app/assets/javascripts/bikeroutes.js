// L.mapbox.accessToken = accessToken;
//
// var map = L.mapbox.map('map', 'mapbox.run-bike-hike')
//     .setView([37.778313, -122.416105], 14);
// //
// var bikeRoute = map.featureLayer.setGeoJSON(routegeojson, {
//   style: function (feature) {
//     return {
//       color: feature.properties.stroke,
//       weight: feature.properties['stroke-width'],
//       opacity: feature.properties['stroke-opacity']
//     };
// 	}
// });
// bikeRoute.eachLayer( function (layer){
//   map.setView([layer.feature.centroid[1], layer.feature.centroid[0]], 14 );
//   layer.bindPopup(layer.feature.properties.name);
// });


var profileEl = d3.select("#elev");
d3.select(window).on('resize', resize);




var margin = {top: 5, right: 5, bottom: 5, left: 5},
    width = parseInt(profileEl.style('width')) - margin.left - margin.right,
    height = 80 - margin.top - margin.bottom;

var x = d3.scale.linear()
    .range([0, width])
    .domain(d3.extent(elevationData, function(d) { return d.dist; }));

var y = d3.scale.linear()
    .range([height, 0])
    .domain(d3.extent(elevationData, function(d) { return d.elev; }));

var line = d3.svg.line()
    .x(function(d) { return x(d.dist); })
    .y(function(d) { return y(d.elev); });

var svg = profileEl.append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom);

var svgframe =  svg.append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

svgframe.append("path")
    .datum(elevationData)
    .attr("class", "sparkline")
    .attr("d", line);

function resize() {
  // adjust things when the window size changes
  width = parseInt(profileEl.style('width'));
  // resize the container
  svg.style('width', width + 'px');
  // recalculate the x range
  x.range([0, width]);
  // redraw the line
  d3.select('.sparkline').attr('d', line);
}
