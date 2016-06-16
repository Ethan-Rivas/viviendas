ActiveAdmin.register ProgressCheck do
  permit_params :name, :value

  index do
    selectable_column
    column :name
    column :value
    actions
  end

end
