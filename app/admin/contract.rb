ActiveAdmin.register Contract do
  permit_params :name, :company_id

  index do
    selectable_column
    column :name
    actions
  end

  show do
    attributes_table do
      row :name
      row :company
    end
  end

end
