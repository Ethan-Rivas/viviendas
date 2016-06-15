ActiveAdmin.register Package do
  permit_params :name

  index do
    selectable_column
    column :name
    actions
  end

  show do
    attributes_table do
      row :name
    end
  end

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

end
