class KmlParser
  def initialize(xml)
    @data = Hash.from_xml(xml)
  end

  def parse
    nodes.map do |node|
      parse_node(node)
    end
  end

private

  def nodes
    if @data['kml']['Folder']
      @data['kml']['Folder']['Placemark']
    else
      @data['kml']['Document']['Folder']['Placemark']
    end
  end

  def parse_node(node)
    x, y, z = node['Point']['coordinates'].split(',').map(&:to_f)

    {
      name:  node['name'],
      geo_x: x,
      geo_y: y
    }
  end
end
