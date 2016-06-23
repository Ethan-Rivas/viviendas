class KmlParser
  def initialize(xml)
    @data = Hash.from_xml(xml)
  end

  def parse
    @data['kml']['Document']['Folder']['Placemark'].map do |node|
      parse_node(node)
    end
  end

private

  def parse_node(node)
    x, y, z = node['Point']['coordinates'].split(',').map(&:to_f)

    {
      name:  node['name'],
      geo_x: x,
      geo_y: y
    }
  end
end
