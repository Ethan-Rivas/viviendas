ActiveAdmin.register Company do
  permit_params :name, :rfc

  controller do
    def scoped_collection
      Company.includes(contracts: { package: :settlements })
    end
  end

  index do
    selectable_column
    column :name
    column :rfc
    column "Progreso (Promedio: #{Company.avg_progress.round(2)}%)" do |company|
      render 'relative_progress', { progress: company.progress, avg: Company.avg_progress }
    end
    actions
  end

  filter :contracts

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
