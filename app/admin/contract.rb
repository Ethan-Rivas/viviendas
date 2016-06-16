ActiveAdmin.register Contract do
  permit_params :name, :company_id, :package_id, :devices_number

  index do
    selectable_column
    column :name
    actions
  end

  show do
    attributes_table do
      row :name
      row :company
      row :package
    end
  end

  form do |f|
    f.inputs do
      f.input :package, as: :select, collection: Package.all.map { |u| [u.name, u.id] }
      f.input :name
      f.input :company
      f.input :devices_number, as: :select, collection: (0..10), include_blank: false
    end
    f.actions
  end

end
