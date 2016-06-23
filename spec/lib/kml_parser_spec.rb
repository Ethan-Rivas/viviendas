require 'rails_helper'

describe KmlParser do
  let(:xml)  { File.read("#{Rails.root}/spec/fixtures/bokoba.kml") }
  let(:expected) do
    [
      {
        "geo_y" => 21.005517,
        "geo_x" => -89.177364,
        "name" => "José Gabriel huchim Uitz "
      },
      {
        "name" => "Claudia martina kantun kantun",
        "geo_x" => -89.177176,
        "geo_y" => 21.003992
      },
      {
        "geo_y" => 21.002786,
        "geo_x" => -89.180109,
        "name" => "David Andrés oxte Arjona "
      },
      {
        "geo_x" => -89.172922,
        "name" => "Yenni marisol koh huchim ",
        "geo_y" => 21.005015
      },
      {
        "geo_y" => 21.009009,
        "name" => "Carlos Arturo Hernández cerino ",
        "geo_x" => -89.171529
      },
      {
        "geo_x" => -89.171137,
        "name" => "Felipe de Jesús noh huchim ",
        "geo_y" => 21.007181
      },
      {
        "name" => "Juventino chan huchim ",
        "geo_x" => -89.171204,
        "geo_y" => 21.00611
      },
      {
        "name" => "Buenaventura dzul oxte ",
        "geo_x" => -89.174998,
        "geo_y" => 21.007936
      },
      {
        "name" => "Maria Guadalupe May chan ",
        "geo_x" => -89.175008,
        "geo_y" => 21.008376
      },
      {
        "geo_y" => 21.006961,
        "geo_x" => -89.174093,
        "name" => "Socorro canche barrera "
      },
      {
        "geo_y" => 21.007079,
        "name" => "Santos Bernabe melchor moo rosales ",
        "geo_x" => -89.171826
      },
      {
        "geo_x" => -89.176146,
        "name" => "Gabriela chan huchim ",
        "geo_y" => 21.00838
      },
      {
        "name" => "Gaspar moo puc ",
        "geo_x" => -89.178993,
        "geo_y" => 21.008573
      },
      {
        "geo_y" => 21.009902,
        "name" => "Noemi del Rosario euan kantun ",
        "geo_x" => -89.178189
      },
      {
        "geo_y" => 21.01135,
        "name" => "Ofelia Guadalupe huchim puc ",
        "geo_x" => -89.178724
      },
      {
        "geo_y" => 21.011632,
        "geo_x" => -89.178952,
        "name" => "Francisco cesareo caamal May "
      },
      {
        "geo_x" => -89.180923,
        "name" => "Rolando Uitz huchim ",
        "geo_y" => 21.008624
      },
      {
        "geo_x" => -89.179902,
        "name" => "Manuel Jesús basto hau ",
        "geo_y" => 21.008584
      },
      {
        "geo_y" => 21.011234,
        "geo_x" => -89.177452,
        "name" => "Manuel Jesús sosa canche "
      },
      {
        "name" => "Gerardo bernardino moo hau ",
        "geo_x" => -89.180795,
        "geo_y" => 21.008032
      },
      {
        "geo_y" => 21.007194,
        "name" => "Jesús Adrian moo cohuo ",
        "geo_x" => -89.180856
      },
      {
        "geo_y" => 21.007097,
        "name" => "Brendy evelyn de Guadalupe sosa Pérez ",
        "geo_x" => -89.180582
      },
      {
        "name" => "Jorge Carlos iuit tzec",
        "geo_x" => -89.183308,
        "geo_y" => 21.004668
      },
      {
        "geo_x" => -89.18382,
        "name" => "Ligia marleny uc koh ",
        "geo_y" => 21.00433
      },
      {
        "geo_y" => 21.009193,
        "name" => "Beatriz Guadalupe dzib huchim ",
        "geo_x" => -89.182508
      },
      {
        "name" => "Lirda huchim puc ",
        "geo_x" => -89.178127,
        "geo_y" => 21.008207
      }
    ]
  end

  it 'extracts an array of names and geocoordinates' do
    settlements = KmlParser.new(xml).parse

    settlements.each_with_index do |settlement, index|
      expect(settlement[:name]).to eq(expected[index]['name'])
    end
  end
end
