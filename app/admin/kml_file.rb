ActiveAdmin.register KmlFile do
  permit_params :upload

  form html: { enctype: 'multipart/form-data' } do |f|
    f.inputs 'Cargar archivo KML' do
      f.input :upload, as: :file
    end

    f.actions
  end
end
