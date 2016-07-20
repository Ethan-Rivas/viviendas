ActiveAdmin.register Settlement, :as => 'Control De Avances' do
  permit_params :package_id, :no, :municipio, :nombre, :apellido_materno, :apellido_paterno,
                :curp, :telefono, :fecha_nacimiento, :cp, :colonia, :localidad, :calle,
                :num_casa, :cruzamientos, :dia, :mes, :anio, :sifode, :sexo, :resultado,
                :marginacion, :procedencia, :procede, :observacion, :owner_name, :geo_x, :geo_y, progress_check_ids: []

  active_admin_importable do |model, hash|
    hash.each do |key, value|
      hash[key] = value.encode('UTF-8', 'Windows-1252') unless value.blank?
    end

    if hash[:municipio].present?
      town = Town.find_or_create_by(name: hash[:municipio])

      if hash[:localidad].present?
        location = Location.find_or_create_by(name: hash[:localidad], town_id: town.id)

        if hash[:licitacion].present?
          contract = Contract.find_or_create_by(name: hash[:licitacion])
          LocationContract.find_or_create_by(location_id: location.id, contract_id: contract.id)
        end
      end
    end

    Settlement.create(hash)
  end

  index do
    selectable_column
    column :no
    column :package
    column :municipio
    column :localidad
    column('Beneficiario', &:owner_full_name)
    # column :curp
    # column :telefono
    # column(:fecha_nacimiento) do |settlement|
      # settlement.fecha_nacimiento.try(:strftime, '%d/%m/%Y')
    # end
    # column :cp
    # column :colonia
    # column :localidad
    # column :calle
    # column :num_casa
    # column :cruzamientos
    # column :dia
    # column :mes
    # column :anio
    # column :sifode
    # column :sexo
    # column :resultado
    ProgressCheck.all.each do |item|
      column item.name do |settlement|
        settlement.progress_inputs(progress_check_ids: item.id)
      end
    end
    column 'Avance' do |settlement|
      "#{settlement.progress}%"
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :package
      f.input :no
      f.input :municipio
      f.input :nombre
      f.input :apellido_materno
      f.input :apellido_paterno
      f.input :curp
      f.input :telefono
      f.input :fecha_nacimiento
      f.input :cp
      f.input :colonia
      f.input :localidad
      f.input :calle
      f.input :num_casa
      f.input :cruzamientos
      f.input :dia
      f.input :mes
      f.input :anio
      f.input :sifode
      f.input :sexo
      f.input :resultado
      f.input :geo_x
      f.input :geo_y
    end
    f.actions
  end

  show do
    attributes_table do
      row :package
      row :no
      row :municipio
      row :nombre
      row :apellido_materno
      row :apellido_paterno
      row :curp
      row :telefono
      row :fecha_nacimiento
      row :cp
      row :colonia
      row :localidad
      row :calle
      row :num_casa
      row :cruzamientos
      row :geo_x
      row :geo_y

      row 'Progreso' do |settlement|
        ul do
          ProgressCheck.all.each do |item|
            li do
              span(style: 'display:inline-block;width:200px;') do
                "#{item.name} (#{item.value}%)"
              end

              strong "#{settlement.progress_for(item)}%"
            end
          end
        end
      end

      row 'Fotografías' do |settlement|
        ul do
          settlement.pictures.order(:created_at).each do |picture|
            li do
              img(src: picture.image.url)
              div I18n.l picture.created_at
            end
          end
        end
      end
    end
  end
end
