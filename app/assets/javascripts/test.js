var chart = c3.generate({
    data: {
      json: [
              {cimentacion: 50, muros: 100, losa: 100, azoteas: 50, piso: 50, acabados: 50, instalacion_electrica: 100, puerta: 0, ventanas: 50, pintura: 50},
              {cimentacion: 100, muros: 100, losa: 50, azoteas: 100, piso: 50, acabados: 50, instalacion_electrica: 100, puerta: 0, ventanas: 50, pintura: 50},
              {cimentacion: 0, muros: 50, losa: 50, azoteas: 50, piso: 50, acabados: 50, instalacion_electrica: 100, puerta: 0, ventanas: 50, pintura: 50},
              {cimentacion: 50, muros: 50, losa: 100, azoteas: 50, piso: 50, acabados: 50, instalacion_electrica: 100, puerta: 0, ventanas: 50, pintura: 50},
          ],
      order: 'desc',
      keys: {
        value: ['cimentacion','muros', 'losa', 'azoteas', 'piso', 'acabados', 'instalacion_electrica', 'puerta', 'ventanas', 'pintura'],
      },
      type: 'bar',
      groups: [
          ['cimentacion','muros', 'losa', 'azoteas', 'piso', 'acabados', 'instalacion_electrica', 'puerta', 'ventanas', 'pintura']
      ]
  }
});
