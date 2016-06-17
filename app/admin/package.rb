ActiveAdmin.register Package do
  permit_params :name

  index do
    selectable_column
    column :name
    column "# de Viviendas" do |package|
      link_to pluralize(package.settlements.count, 'Vivienda'), admin_settlements_path({
        q: {
          package_id_eq: package.id
        }
      })
    end
    actions
  end

  filter :contracts

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
