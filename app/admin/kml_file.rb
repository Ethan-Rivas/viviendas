ActiveAdmin.register KmlFile do
  permit_params :town_id, :upload

  form html: { enctype: 'multipart/form-data' } do |f|
    f.inputs 'Cargar archivo KML' do
      f.input :town
      f.input :upload, as: :file
    end

    f.actions
  end
end
