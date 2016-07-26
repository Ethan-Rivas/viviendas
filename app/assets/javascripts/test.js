d3.json("/api/v1/settlements.json", function(data) {
  var group = data;

  console.log(data);

  var chart = c3.generate({
    data: {
      json: group,
      type: 'bar',
      keys: {
        x: 'owner_name',
        value: ['id']
      }
    },
    axis: {
      x: {
        type: 'category'
      }
    }
  });
});
