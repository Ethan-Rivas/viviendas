ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :devise_model, :devise_color, :contract_id

  config.clear_action_items! # Remove resources

  index do
    selectable_column
    id_column
    column :devise_model
    column :devise_color
    actions
  end

  filter :contract
  filter :devise_model
  filter :devise_color

  show :title => proc {|user| "#{user.devise_model} #{user.devise_color}" } do
    attributes_table do
      row :contract
      row :devise_model
      row :devise_color
    end
  end

  form do |f|
    f.inputs do
      f.input :contract
    end
    f.actions
  end

end
