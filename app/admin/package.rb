ActiveAdmin.register Package do
  permit_params :name, :contract_id

  index do
    selectable_column
    column :name
    actions
  end

  show do
    attributes_table do
      row :name
      row :contract
    end
  end

end
