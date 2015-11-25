var turf = require('turf'),
    gju = require('geojson-utils'),
    fs = require('fs');

var inputfile = 'data/allRoutes.geojson',
    routeGeojson = JSON.parse(fs.readFileSync(inputfile, 'utf8'));
var gendata = {},
    outdata = {};


//https://github.com/maxogden/geojson-js-utils
//step1
/**
  *THIS IS BRUTE FORCE:
  *EVERY ELEVATION LINE IS CHECKED.
  *SUPER INEFFICIENT.
  /*
/**
  *file contours.geojson comes from a geojson version of the elevation profile
  *shapefile downloaded from data.sfgov.org
  *download and use ogr2ogr to make it yourself
  */
// var elevationfile = 'data/contours.geojson',
//     elevations = JSON.parse(fs.readFileSync(elevationfile, 'utf8'));
// elevations.features.forEach( function(feature){
//   routeGeojson.features.forEach( function(bikeroute){
//     var crossing = gju.lineStringsIntersect( feature.geometry , bikeroute.geometry);
//     if (crossing) {
//       gendata[bikeroute.properties.name] = gendata[bikeroute.properties.name] || [];
//       gendata[bikeroute.properties.name].push({elev: feature.properties.ELEVATION, point: crossing});
//     }
//   })
// });
// results from step 1 saved as "stepOneElevationData.json" so that doesn't have to run every time.

//step2
var datafile = 'data/stepOneElevationData.json',
    gendata = JSON.parse(fs.readFileSync(datafile, 'utf8'));
for (var bikeroute in gendata) {
  outdata[bikeroute] = outdata[bikeroute] || [];
  gendata[bikeroute].forEach(function(elevPoint){
    elevPoint.point.forEach(function(point){
      outdata[bikeroute].push(
        turf.point([point.coordinates[1],point.coordinates[0]], {elev: elevPoint.elev})
      )
    })
  })
}
for (var bikeroute in outdata){
  outdata[bikeroute] = turf.featurecollection(outdata[bikeroute]);
}


//step 3
// var datafile = 'data/semiFinalElevationData.json',
//     outdata = JSON.parse(fs.readFileSync(datafile, 'utf8'));
var finaldata = {};
routeGeojson.features.forEach(function(bikeroute){
  finaldata[bikeroute.properties.name] = finaldata[bikeroute.properties.name] || [];
  var beginpoint = turf.point(bikeroute.geometry.coordinates[0]),
      totalDistance = Number( turf.lineDistance(bikeroute,'miles').toFixed(3) );
  outdata[bikeroute.properties.name].features.forEach(function(point){
    var distance = Number( turf.lineDistance( turf.lineSlice(beginpoint, point, bikeroute), 'miles').toFixed(3) );
    finaldata[bikeroute.properties.name].push({dist: distance, elev: point.properties.elev});
  });
  finaldata[bikeroute.properties.name].push({dist:0});
  finaldata[bikeroute.properties.name].push({dist:totalDistance});
});
for (var bikeroute in finaldata) {
  finaldata[bikeroute].sort(compare);
  var final = finaldata[bikeroute].length;
  finaldata[bikeroute][0].elev = finaldata[bikeroute][1].elev;
  finaldata[bikeroute][final-1].elev = finaldata[bikeroute][final-2].elev;
}

function compare(a,b) {
  //array.sort(compare);
  if (+a.dist < +b.dist)
    return -1;
  if (+a.dist > +b.dist)
    return 1;
  return 0;
}


var outputfile = 'data/elevationProfiles.json';
fs.writeFile(outputfile, JSON.stringify(finaldata), function(err) {
    if(err) {
        return console.log(err);
    }
    console.log("The file was saved!");
});
