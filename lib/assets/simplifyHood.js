var loremIpsum = require('lorem-ipsum'),
    turf = require('turf'),
    gju = require('geojson-utils'),
    fs = require('fs');

var neighborhoodsfile = 'planning_neighborhoods_simple.json',
    neighborhoods = JSON.parse(fs.readFileSync(neighborhoodsfile, 'utf8'));

var gendata = turf.merge(neighborhoods);

var outputfile = 'cityOutline.geojson';

fs.writeFile(outputfile, JSON.stringify(gendata), function(err) {
    if(err) {
        return console.log(err);
    }
    console.log("The file was saved!");
});
