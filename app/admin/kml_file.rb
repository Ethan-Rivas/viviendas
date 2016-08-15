ActiveAdmin.register KmlFile do
  permit_params :town_id, :upload, kml_settlements_attributes: [:id, :settlement_id]

  form html: { enctype: 'multipart/form-data' } do |f|
    if object.new_record?
      f.inputs 'Cargar archivo KML' do
        f.input :town, as: :select, prompt: 'Selecione un Municipio',include_blank: false
        f.input :upload, as: :file
      end
    else
      f.inputs "Verificar KML de #{f.object.town.name}" do
        li do
          h3 "Viviendas en el municipio: #{f.object.town_settlements.count}"
          h3 "Viviendas en el KML: #{f.object.kml_settlements.count}"
        end

        f.fields_for :kml_settlements do |g|
          g.input :settlement_id, {
            label: g.object.name,
            as: :select,
            collection: g.object.options.for_select,
            include_blank: false
          }
        end
      end
    end

    f.actions
  end

  show do |kml|
    attributes_table do
      row :town
      row 'Viviendas en el Municipio' do
        kml.town_settlements.count
      end
      row 'Ubicaciones en el KML' do
        kml.kml_settlements.count
      end

      if kml.orphan_settlements.any?
        row "#{kml.orphan_settlements.count} viviendas no se encontraron en el KML:" do
          ul do
            kml.orphan_settlements.each do |settlement|
              li link_to(settlement.owner_name, admin_settlement_path(settlement))
            end
          end
        end
      end

      if kml.orphan_settlements.any?
        row "#{kml.orphan_locations.count} ubicaciones no corresponden a ninguna vivienda" do
          ul do
            kml.orphan_locations.each do |location|
              li location.name
            end
          end
        end
      end
    end
  end

  index do
    column :town
    column 'Viviendas en el Municipio' do |kml|
      kml.town_settlements.count
    end
    column 'Ubicaciones en el KML' do |kml|
      kml.town_settlements.count
    end
    column 'Viviendas sin ubicación' do |kml|
      kml.orphan_settlements.count
    end
    column 'Ubicaciones sin vivienda' do |kml|
      kml.orphan_locations.count
    end
    column 'Descargar KML' do |kml|
      link_to('Descargar', kml.upload.url)
    end
    actions
  end

  controller do
    def create
      super do |format|
        redirect_to edit_admin_kml_file_path(resource) and return if resource.valid?
      end
    end
  end
end
