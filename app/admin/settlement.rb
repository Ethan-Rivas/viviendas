ActiveAdmin.register Settlement do
  permit_params :owner_name, :address, :geo_x, :geo_y,
                :check_1, :check_2, :check_3, :check_4,
                :check_5, :check_6, :check_7, :check_8,
                :check_9, :check_10, :contract_id

  active_admin_importable

  index do
    selectable_column
    id_column
    column :owner_name
    column :address
    column :geo_x
    column :geo_y
    column :progress
    column :contract
    actions
  end

filter :contract

end
