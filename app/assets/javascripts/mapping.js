var dataPath = '/data/sf-neighborhoods.json';


  var width = 750,
      height = 750;

  var svg = d3.select("#map_container").append("svg")
      .attr("width", width)
      .attr("height", height);

  var projection = d3.geo.mercator()
      .center([-122.433701, 37.767683])
      .scale(250000)
      .translate([width / 2, height / 2]);

  var path = d3.geo.path()
      .projection(projection);

  svg.call(renderNeighborhoods);

  function renderNeighborhoods(){
    d3.json(dataPath, function(error, sf) {
      if (error) return console.error(error);

      var sfneighborhoods = topojson.feature(sf, sf.objects.SFFind_Neighborhoods);

      svg.append("g")
          .attr("class", "neighborhoods")
        .selectAll(".neighborhood")
          .data(topojson.feature(sf, sf.objects.SFFind_Neighborhoods).features)
        .enter().append('a')
          .attr("xlink:href",function(d) { return d.properties.LINK || '#'; }) //change property here to change link
        .append("path")
          .attr("class", "neighborhood")
          .on("mouseover", function(d) { return setTitle(d.properties.name); })
          .attr("d", path)
          .append("svg:title")
          .text( function(d) { return d.properties.name; });
    });
  }

  function setTitle(newTitle){
    d3.select("#selected-title").text(newTitle);
  }
