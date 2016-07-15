ActiveAdmin.register_page "Control de Avances" do
  content do

    table do
      thead do
        tr do
          %w[No Municipio Localidad Nombre A.Paterno A.Materno Cimentación Muros Losa Azoteas Piso Acabados Inst.Eléctrica Puerta Ventanas Pintura Avance].each &method(:th)
        end
      end
      tbody do
        Settlement.all.each do |settlement|
          tr do
            td settlement.no
            td settlement.town.name
            td settlement.localidad
            td settlement.nombre
            td settlement.apellido_paterno
            td settlement.apellido_materno
            ProgressCheck.all.map do |item|
              td settlement.progress_for(item) / 100.0
            end
            td "#{settlement.progress}%"
          end
        end
    end
  end

  end
end
