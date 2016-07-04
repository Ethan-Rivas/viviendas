ActiveAdmin.register Contract do
  permit_params :name, :company_id, :package_id, :devices_number

  index do
    selectable_column
    column :company
    column :name
    column "# de Viviendas" do |package|
      link_to pluralize(package.settlements.count, 'Vivienda'), admin_settlements_path({
        q: {
          package_id_eq: package.id
        }
      })
    end
    column 'Progreso' do |package|
      "#{package.progress.round(2)}%"
    end
    actions
  end

  filter :company

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
    end
    f.actions
  end

end
