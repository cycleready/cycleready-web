var loremIpsum = require('lorem-ipsum'),
    turf = require('turf'),
    gju = require('geojson-utils'),
    fs = require('fs');

var inputfile = 'allRoutes.geojson',
    routeGeojson = JSON.parse(fs.readFileSync(inputfile, 'utf8'));
var elevationfile = 'elevationProfiles.json',
    elevations = JSON.parse(fs.readFileSync(elevationfile, 'utf8'));
var neighborhoodsfile = 'planning_neighborhoods.geojson',
    neighborhoods = JSON.parse(fs.readFileSync(neighborhoodsfile, 'utf8'));

function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - min)) + min;
}

function unique(arr) {
  // http://www.shamasis.net/2009/09/fast-algorithm-to-find-unique-items-in-javascript-array/
  var o = {}, i, l = arr.length, r = [];
  for(i=0; i<l;i+=1) o[arr[i]] = arr[i];
  for(i in o) r.push(o[i]);
  return r;
};

var laneTypes=["Sharrows","Dedicated Lane","Separated Lane","Bike Path","Shared Lane"];
var gendata = [];
routeGeojson.features.forEach(function(route){

  route.properties.hoods = [];
  neighborhoods.features.forEach(function(hood){
    //check first point in route
    if ( gju.pointInPolygon( turf.point(route.geometry.coordinates[0]).geometry, hood.geometry) )
      route.properties.hoods.push(hood.properties.name);
    //check last point in route
    if ( gju.pointInPolygon( turf.point(route.geometry.coordinates[route.geometry.coordinates.length -1]).geometry, hood.geometry) )
      route.properties.hoods.push(hood.properties.name);

    // check if hood and bikeroute intersect
    var templine = {"type":"LineString", "coordinates": hood.geometry.coordinates[0]}; // gju.lineStringsIntersect only works with "LineString", not "Polygon"
    if ( gju.lineStringsIntersect( templine, route.geometry) )
      route.properties.hoods.push(hood.properties.name);
  })
  // get rid of dupicates in route.properties.hoods
  route.properties.hoods = unique(route.properties.hoods);

  gendata.unshift({
    name: route.properties.name,
    description: loremIpsum({count: 5, units: 'sentences'}),
    grade: getRandomInt(0,10),
    distance: Number(turf.lineDistance(route, 'miles').toFixed(2)),
    lane_type: laneTypes[Math.floor(Math.random() * laneTypes.length)],
    geojson: route,
    elevation: elevations[route.properties.name]
  });
  gendata[0].geojson.centroid = turf.center(route).geometry.coordinates;
  // gendata[0].geojson.centroid = turf.centroid(route).geometry.coordinates;
  // center rather than centroid because some routes have several points at one end and one at the other (curvy beginning and then straight line)
})

var outputfile = 'routeSeedData.json';

fs.writeFile(outputfile, JSON.stringify(gendata), function(err) {
    if(err) {
        return console.log(err);
    }
    console.log("The file was saved!");
});
