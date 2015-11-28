var dataPath = '/data/planning_neighborhoods_simple.topojson';

var mapContainer = d3.select('#map-container');

var margin = {top: 10, left: 10, bottom: 10, right: 10},
    width = parseInt(mapContainer.style('width')),
    width = width - margin.left - margin.right,
    mapRatio = 1,
    height = width * mapRatio,
    scaleMultiplier = 350;

var svg = mapContainer.append('svg')

var projection = d3.geo.mercator()
    .center([ -122.441, 37.758 ])
    .scale(width*scaleMultiplier)
    .translate([width / 2, height / 2]);

var path = d3.geo.path()
    .projection(projection);

svg.call(renderNeighborhoods);

svg.attr('height', height)
   .attr('id','neighborhood-map');

function renderNeighborhoods(){
  d3.json(dataPath, function(error, sf) {
    if (error) return console.error(error);

    var sfneighborhoods = topojson.feature(sf, sf.objects.planning_neighborhoods).features;
    // var sfneighborhoods = topojson.feature(sf, sf.objects.SFFind_Neighborhoods.features);

    svg.append('g')
        .attr('class', 'neighborhoods')
      .selectAll('.neighborhood')
        .data(sfneighborhoods)
      .enter().append('a')
        .attr('xlink:href',function(d) { return 'neighborhoods/' + d.properties.nId || '#'; }) //change property here to change link
      .append('path')
        .attr('class', 'neighborhood')
        .on('mouseover', function(d) { return setTitle(d.properties.name); })
        .attr('d', path)
        .append('svg:title')
        .text( function(d) { return d.properties.name; });
  });
}

d3.select(window).on('resize', resize);

function resize() {
  // adjust things when the window size changes
  width = parseInt(mapContainer.style('width'));
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
  d3.select('#selected-neighborhood').text(newTitle);
  var parsedName = newTitle.replace(/ /g,'').toLowerCase();
  var infoCard = $('#' + parsedName);
  var infoRoutes = infoCard.children().children('p').text()
  var routeList = d3.select('#selected-title-routes')
  routeList.text('Routes in this neighborhood: ' + infoRoutes);
  (infoRoutes.length !== 0) ? routeList.classed('hidden', false) : routeList.classed('hidden', true);

}
