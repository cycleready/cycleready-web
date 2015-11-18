var loremIpsum = require('lorem-ipsum'),
    turf = require('turf'),
    fs = require('fs');

var inputfile = 'allRoutes.geojson',
    routeGeojson = JSON.parse(fs.readFileSync(inputfile, 'utf8'));
var elevationfile = 'elevationProfiles.json',
    elevations = JSON.parse(fs.readFileSync(elevationfile, 'utf8'));

function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - min)) + min;
}
var laneTypes=["Sharrows","Dedicated Lane","Separated Lane","Bike Path","Shared Lane"];
var gendata = [];
routeGeojson.features.forEach(function(el){
  gendata.unshift({
    name: el.properties.name,
    description: loremIpsum({count: 5, units: 'sentences'}),
    grade: getRandomInt(0,10),
    distance: Number(turf.lineDistance(el, 'miles').toFixed(2)),
    lane_type: laneTypes[Math.floor(Math.random() * laneTypes.length)],
    geojson: el,
    elevation: elevations[el.properties.name]
  });
  gendata[0].geojson.centroid = turf.centroid(el).geometry.coordinates;
})

var outputfile = 'routeSeedData.json';

fs.writeFile(outputfile, JSON.stringify(gendata), function(err) {
    if(err) {
        return console.log(err);
    }
    console.log("The file was saved!");
});
