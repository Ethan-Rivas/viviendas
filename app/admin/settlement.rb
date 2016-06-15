ActiveAdmin.register Settlement do
  permit_params :package, :no, :municipio, :nombre, :apellido_materno, :apellido_paterno,
                :curp, :telefono, :fecha_nacimiento, :cp, :colonia, :localidad, :calle,
                :num_casa, :cruzamientos, :dia, :mes, :anio, :sifode, :sexo, :resultado,
                :marginacion, :procedencia, :procede, :observacion, :owner_name,
                :check_1, :check_2, :check_3, :check_4,
                :check_5, :check_6, :check_7, :check_8,
                :check_9, :check_10, :contract_id

  active_admin_importable

  index do
    selectable_column
    column :no
    column :municipio
    column :nombre
    column :apellido_materno
    column :apellido_paterno
    column :curp
    column :telefono
    column(:fecha_nacimiento) do |settlement|
      settlement.fecha_nacimiento.try(:strftime, '%d/%m/%Y')
    end
    column :cp
    column :colonia
    column :localidad
    column :calle
    column :num_casa
    column :cruzamientos
    column :dia
    column :mes
    column :anio
    column :sifode
    column :sexo
    column :resultado
    column :progress
    actions
  end

filter :contract

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
    f.input :check_1
    f.input :check_2
    f.input :check_3
    f.input :check_4
    f.input :check_5
    f.input :check_6
    f.input :check_7
    f.input :check_8
    f.input :check_9
    f.input :check_10
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
      row :dia
      row :mes
      row :anio
      row :sifode
      row :sexo
      row :resultado
      row :check_1
      row :check_2
      row :check_3
      row :check_4
      row :check_5
      row :check_6
      row :check_7
      row :check_8
      row :check_9
      row :check_10
    end
  end

end
