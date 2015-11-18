L.mapbox.accessToken = accessToken;

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


var margin = {top: 1, right: 1, bottom: 1, left: 1},
    width = 500 - margin.left - margin.right,
    height = 100 - margin.top - margin.bottom;

var x = d3.scale.linear()
    .range([0, width]);

var y = d3.scale.linear()
    .range([height, 0]);

var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left");

var line = d3.svg.line()
    .x(function(d) { return x(d.dist); })
    .y(function(d) { return y(d.elev); });

var svg = d3.select("#elev").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

console.log('d3');
elevationData.forEach(function(d) {
  d.dist = +d.dist;
  d.elev = +d.elev;
});

x.domain(d3.extent(elevationData, function(d) { return d.dist; }));
y.domain(d3.extent(elevationData, function(d) { return d.elev; }));

svg.append("g")
    .attr("class", "x axis")
    .attr("transform", "translate(0," + height + ")");
    // .call(xAxis);

// svg.append("g")
//     .attr("class", "y axis")
//     .call(yAxis)
//   .append("text")
//     .attr("transform", "rotate(-90)")
//     .attr("y", 6)
//     .attr("dy", ".71em")
//     .style("text-anchor", "end")
//     .text("Price ($)");

svg.append("path")
    .datum(elevationData)
    .attr("class", "line")
    .attr("d", line);
