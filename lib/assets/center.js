// find the geographic center of an array of coordinatesArray
// in geoJson format: [ [long0, lat0], [long1, lat1], etc... ]
function findCenter(coordinatesArray){
  function getLatLong(arr, latlon) {
    // long = 0 , lat = 1
    var result=[];
    arr.forEach(function(el,i){
      result.push(el[latlon]);
    });
    return result;
  }
  function alterArray(arr, func){
    var result=[];
    arr.forEach(function(el,i){
      result[i] = func(el);
    });
    return result;
  }
  function arrayAverage(arr){
    return arraySum(arr)/arr.length;
  }
  function arraySum(arr) {
    return arr.reduce(function(a,b){ return a + b; });
  }
  function degreeToRadian(num){
    return Math.PI*num/180;
  }
  var lats = getLatLong(coordinatesArray, 1),
      longs = getLatLong(coordinatesArray, 0),
      longsInRadians = alterArray(longs, degreeToRadian);

  var avgLat = arrayAverage(lats);
  var avgLong = 180*Math.atan2( arrayAverage( alterArray(longsInRadians, Math.sin) ) , arrayAverage(alterArray(longsInRadians, Math.cos)) )/Math.PI;

  return [avgLong,avgLat];
}


// how to use:
// 1) download features.json from mapbox designer
//    features.json will be geoJson format
// 2) run this script using node.js:
//    $ node center.js
// 3) output.json now has center of points for each feature as property "centroid"

var inputfile = 'features.json',
    outputfile = 'output.json';

var fs = require('fs');
//read from file
var data = JSON.parse(fs.readFileSync(inputfile, 'utf8'));
//so something to data
data.features.forEach(function(el){
  el['centroid'] = findCenter(el.geometry.coordinates);
});
//output the file
fs.writeFile(outputfile, JSON.stringify(data), function(err) {
    if(err) {
        return console.log(err);
    }
    console.log("The file was saved!");
});
