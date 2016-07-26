d3.json("/api/v1/settlements.json", function(data) {
  var name = [];
  console.log(data);
  for (var i = 0; i < data.items.length; i++) {
    name.push(data.items[i].name);
  }
  console.log(name);
  var chart = c3.generate({
    data: {
      columns: name
    }
  });
});
