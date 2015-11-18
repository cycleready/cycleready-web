var fs = require('fs'),
    turf = require('turf');

var inputfile = 'planning_neighborhoods.geojson',
    geodata = JSON.parse(fs.readFileSync(inputfile, 'utf8'));


var centroidPt = turf.centroid(geodata);

console.log(centroidPt);

// var outputfile = 'routeSeedData.json';
// fs.writeFile(outputfile, JSON.stringify(foo), function(err) {
//     if(err) {
//         return console.log(err);
//     }
//     console.log("The file was saved!");
// });
