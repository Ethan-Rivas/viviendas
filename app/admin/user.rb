ActiveAdmin.register User do
  permit_params :email, :code, :name, :phone_number, :contract_id #:devise_model, :devise_color

  index do
    selectable_column
    column :contract
    column :name
    column :email
    column :phone_number
    actions
  end

  filter :contract

  show :title => proc {|user| "#{user.name} #{user.contract.name}" } do
    attributes_table do
      row :contract
      row :name
      row :email
      row :phone_number
      row :code
    end
  end

  form do |f|
    f.inputs do
      f.input :contract
      f.input :name
      f.input :email
      f.input :phone_number
      f.input :code
    end
    f.actions
  end

end
