var data = [
      {
        items: [
          {
            "id": 1,
            "name": "Cimentación",
            "value": 0
          },
          {
            "id": 2,
            "name": "Muros",
            "value": 0
          },
          {
            "id": 3,
            "name": "Losa",
            "value": 0
          },
          {
            "id": 4,
            "name": "Azoteas",
            "value": 0
          },
          {
            "id": 5,
            "name": "Piso",
            "value": 0
          },
          {

            "id": 6,
            "name": "Acabados",
            "value": 0
          },
          {
            "id": 7,
            "name": "Instalación Eléctrica",
            "value": 0
          },
          {
            "id": 8,
            "name": "Puerta",
            "value": 0
          },
          {
            "id": 9,
            "name": "Ventanas",
            "value": 0
          },
          {
            "id": 10,
            "name": "Pintura",
            "value": 0
          }
        ]
      }
        //{cimentacion: 50, muros: 100, losa: 100, azoteas: 50, piso: 50, acabados: 50, instalacion_electrica: 100, puerta: 0, ventanas: 50, pintura: 50},
        //{cimentacion: 100, muros: 100, losa: 50, azoteas: 100, piso: 50, acabados: 50, instalacion_electrica: 100, puerta: 0, ventanas: 50, pintura: 50},
        //{cimentacion: 0, muros: 50, losa: 50, azoteas: 50, piso: 50, acabados: 50, instalacion_electrica: 100, puerta: 0, ventanas: 50, pintura: 50},
        //{cimentacion: 50, muros: 50, losa: 100, azoteas: 50, piso: 50, acabados: 50, instalacion_electrica: 100, puerta: 0, ventanas: 50, pintura: 50},
      ];

var convertedData = [];
data.forEach(function(group){
    for (var i = 0; i < convertedData.length; i++) {
      console.log(convertedData[i]);
    }
});

var chart = c3.generate({
    data: {
      columns: convertedData,
      order: 'desc',
      //keys: {
        //value: ['cimentacion','muros', 'losa', 'azoteas', 'piso', 'acabados', 'instalacion_electrica', 'puerta', 'ventanas', 'pintura'],
      //},
      type: 'bar',
      //groups: [
      //    ['cimentacion','muros', 'losa', 'azoteas', 'piso', 'acabados', 'instalacion_electrica', 'puerta', 'ventanas', 'pintura']
      //]
  }
});
