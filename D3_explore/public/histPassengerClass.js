var svg = dimple.newSvg('#histPassengerClass');

d3.csv('data/titanic1.csv', function(data) {
    var chartInstance = new dimple.chart(svg, data);
    var x = chartInstance.addCategoryAxis('x', 'Passeneger Class');
    var y = chartInstance.addPctAxis('y', 'Count');
    var s = chartInstance.addSeries("Status", dimple.plot.bar);

    chartInstance.setBounds(60, 30, 510, 305);
    chartInstance.addLegend(60, 10, 510, 20, 'right');
    chartInstance.draw(1000);
});