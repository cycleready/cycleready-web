var loremIpsum = require('lorem-ipsum'),
    turf = require('turf'),
    gju = require('geojson-utils'),
    fs = require('fs');

var neighborhoodsfile = 'data/planning_neighborhoods_simple.geojson',
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

var gendata = [];

neighborhoods.features.forEach(function(hood){


  gendata.unshift({
    name: hood.properties.name,
    about: loremIpsum({count: 5, units: 'sentences'}),
    geojson: hood,
    slug: hood.properties.nId
  });
  gendata[0].geojson.properties.centroid = turf.centroid(hood).geometry.coordinates;

})





var outputfile = 'hoodSeedData.json';

fs.writeFile(outputfile, JSON.stringify(gendata), function(err) {
    if(err) {
        return console.log(err);
    }
    console.log("The file was saved!");
});
