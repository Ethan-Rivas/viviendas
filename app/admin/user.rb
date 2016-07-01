ActiveAdmin.register User do
  permit_params :email, :code, :name, :phone_number, :contract_id #:devise_model, :devise_color
  config.clear_action_items!

  index do
    selectable_column
    column 'Contrato' do |user|
      user.email.split('@').first.upcase
    end
    column :code
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

  form title: proc { |user| "Dispositivo: #{user.username}" } do |f|
    f.inputs do
      f.input :code
    end
    f.actions
  end

end
