/*
var svg = dimple.newSvg('#histPassengerClass');

//data/
d3.csv('train.csv', function(data) {
    var chartInstance = new dimple.chart(svg, data);
    var x = chartInstance.addCategoryAxis('x', 'Passeneger Class');
    var y = chartInstance.addPctAxis('y', 'Count');
    var s = chartInstance.addSeries("Status", dimple.plot.bar);

    chartInstance.setBounds(60, 30, 510, 305);
    chartInstance.addLegend(60, 10, 510, 20, 'right');
    chartInstance.draw(1000);
});
*/

//Test code:
(function(d3) {

    var dataset = [
        { label: 'Abulia', count: 10 },
        { label: 'Betelgeuse', count: 20 },
        { label: 'Cantaloupe', count: 30 },
        { label: 'Dijkstra', count: 40 }
    ];
    var w = 360; //width
    var h = 360; //height
    var r = Math.min(w, h) / 2; //radius
    var color = d3.scaleOrdinal() //color indexes
        .range(['#A60F2B', '#648C85', '#B3F2C9', '#528C18', '#C3F25C']);

    var svg = d3.select(#testD3)
        .append('svg')
        .attr('width', w)
        .attr('height', h)
        .append('g')
        .attr('transform', 'translate(', + (w / 2) + ',' + (h / 2) + ')');

    var arc = d3.arc()
        .innerRadius(0)
        .outerRadius(r);

    var pie = d3.pie()
        .value(function(d) { return d.count; })
        .sort(null);

    var path = svg.selectAll('path')
        .data(pie(dataset))
        .enter()
        .append('path')
        .attr('d', arc)
        .attr('fill', function(d, i) {
            return color(d.data.label);
        });

})(window.d3);