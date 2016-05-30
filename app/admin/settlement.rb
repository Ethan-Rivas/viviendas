ActiveAdmin.register Settlement do
  permit_params :uno, :dos, :tres, :contract_id

  active_admin_importable

  index do
    selectable_column
    id_column
    column :uno
    column :dos
    column :tres
    column :contract
    actions
  end
  
filter :contract

end
