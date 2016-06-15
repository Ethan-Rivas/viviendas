ActiveAdmin.register Company do
  permit_params :name, :rfc

  index do
    selectable_column
    column :name
    column :rfc
    actions
  end

  show do
    attributes_table do
      row :name
      row :rfc
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :rfc
    end
    f.actions
  end

end
