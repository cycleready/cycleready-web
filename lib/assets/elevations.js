var turf = require('turf'),
    gju = require('geojson-utils'),
    fs = require('fs');

var inputfile = 'allRoutes.geojson',
    routeGeojson = JSON.parse(fs.readFileSync(inputfile, 'utf8'));
var gendata = {};

var elevationfile = 'beginning.geojson',
    elevations = JSON.parse(fs.readFileSync(elevationfile, 'utf8'));

//https://github.com/maxogden/geojson-js-utils
//THIS WILL BE BRUTE FORCE,
//EVERY ELEVATION LINE SHOULD NOT BE CHECKED.
elevations.features.forEach( function(feature){
  routeGeojson.features.forEach( function(bikeroute){
    var crossing = gji.linesIntersect( feature.geometry , bikeroute.geometry);
    if (crossing) {
      gendata[bikeroute.name] = gendata[bikeroute.name] || [];
      gendata[bikeroute.name].push({elev: feature.ELEVATION, point: crossing});
    }
  })
});

var outputfile = 'elevationData.json';
fs.writeFile(outputfile, JSON.stringify(gendata), function(err) {
    if(err) {
        return console.log(err);
    }
    console.log("The file was saved!");
});
