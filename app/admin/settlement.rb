ActiveAdmin.register Settlement do
  permit_params :no, :municipio, :nombre, :apellido_materno, :apellido_paterno,
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
    column :fecha_nacimiento
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

end
