var dataPath = '/data/sf-neighborhoods.json';


var margin = {top: 10, left: 10, bottom: 10, right: 10}
    , width = parseInt(d3.select('#map_container').style('width'))
    , width = width - margin.left - margin.right
    , mapRatio = 1
    , height = width * mapRatio
    , scaleMultiplier = 300
    ;

var svg = d3.select("#map_container").append("svg")

var projection = d3.geo.mercator()
    .center([-122.433701, 37.767683])
    .scale(width*scaleMultiplier)
    .translate([width / 2, height / 2]);

var path = d3.geo.path()
    .projection(projection);

svg.call(renderNeighborhoods);


svg.attr("height", height)
   .attr("id","neighborhood-map");

function renderNeighborhoods(){
  d3.json(dataPath, function(error, sf) {
    if (error) return console.error(error);

    var sfneighborhoods = topojson.feature(sf, sf.objects.SFFind_Neighborhoods);

    svg.append("g")
        .attr("class", "neighborhoods")
      .selectAll(".neighborhood")
        .data(topojson.feature(sf, sf.objects.SFFind_Neighborhoods).features)
      .enter().append('a')
        .attr("xlink:href",function(d) { return 'neighborhoods/' + d.properties.nId || '#'; }) //change property here to change link
      .append("path")
        .attr("class", "neighborhood")
        .on("mouseover", function(d) { return setTitle(d.properties.name); })
        .attr("d", path)
        .append("svg:title")
        .text( function(d) { return d.properties.name; });
  });
}

d3.select(window).on('resize', resize);

function resize() {
  // adjust things when the window size changes
  width = parseInt(d3.select('#map_container').style('width'));
  width = width - margin.left - margin.right;
  height = width * mapRatio;

  // update projection
  projection
      .translate([width / 2, height / 2])
      .scale(width*scaleMultiplier);

  // resize the map container
  svg
      .style('width', width + 'px')
      .style('height', height + 'px');

  // resize the map
  svg.select('.neighborhoods').attr('d', path);
  svg.selectAll('.neighborhood').attr('d', path);
}

function setTitle(newTitle){
  d3.select("#selected-title").text(newTitle);
  var parsedName = newTitle.replace(/ /g,'').toLowerCase()
  var infoCard = $('#' + parsedName);

  console.log(parsedName);
  console.log(infoCard);

  infoCard.css('background-color', 'red');

}
