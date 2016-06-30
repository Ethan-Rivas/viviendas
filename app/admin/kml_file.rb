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

  controller do
    def create
      super do |format|
        redirect_to edit_admin_kml_file_path(resource) and return if resource.valid?
      end
    end
  end
end
