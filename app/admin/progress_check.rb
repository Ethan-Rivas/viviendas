ActiveAdmin.register ProgressCheck do
  permit_params :name, :value

  config.sort_order = 'id_asc'
  index do
    selectable_column
    column :name
    column :value
    actions
  end

  config.filters = false

end
