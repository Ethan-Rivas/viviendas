d3.json("/admin/settlements.json", function(settlements) {
  var data = [], columns = [];
  for (item in settlements[0].progress) {
    data.push([item]);
    columns.push(item);
  }

  var names = $.map(settlements, function(settlement) {
    return settlement.owner_name;
  });

  for (var i = 0; i < data.length; i++) {
    settlements.forEach(function(settlement) {
      data[i].push(settlement.progress[data[i][0]]);
    });
  }

  var chart = c3.generate({
    data: {
      type: 'bar',
      columns: data,
      groups: [columns],
      order: null
    },
    axis: {
      x: {
        type: 'category',
        categories: names
      }
    }
  });
});
