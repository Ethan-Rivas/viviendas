ActiveAdmin.register Settlement do
  permit_params :package_id, :no, :municipio, :nombre, :apellido_materno, :apellido_paterno,
                :curp, :telefono, :fecha_nacimiento, :cp, :colonia, :localidad, :calle,
                :num_casa, :cruzamientos, :dia, :mes, :anio, :sifode, :sexo, :resultado,
                :marginacion, :procedencia, :procede, :observacion, :owner_name, :geo_x, :geo_y, progress_check_ids: []

  active_admin_importable do |model, hash|
    hash.each do |key, value|
      hash[key] = value.encode('UTF-8', 'Windows-1252') unless value.blank?
    end

    Settlement.create(hash)
   end

  index do
    selectable_column
    #column :no
    column :package
    column :municipio
    column('Beneficiario', &:owner_full_name)
    column 'GPS' do |settlement|
      if settlement.geo_x.present? && settlement.geo_y.present?
        "(#{settlement.geo_x}, #{settlement.geo_y})"
      end
    end
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
    column 'Progreso' do |settlement|
      "#{settlement.progress}%"
    end
    actions
  end

  filter :package
  filter :town

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
    end
  end
end
