ActiveAdmin.register Picture do
  permit_params :settlement, :image, :title

  index do
    selectable_column
    id_column
    column :settlement
    column :title
    column('Imagen') do |picture|
      link_to(picture.image_file_name, picture.image.url(:medium), {
        target: :_blank
      })
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :image, :required => true, :as => :file
    end

    f.actions
  end

  show do |ad|
    attributes_table do
      row :title
      row :picture do
        image_tag(ad.image.url(:image))
      end
    end
  end
end
