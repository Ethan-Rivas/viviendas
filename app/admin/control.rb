ActiveAdmin.register Settlement, :as => 'Control De Avances' do
  config.clear_action_items!

  index do
    selectable_column
    column :no
    column :package
    column :municipio
    column :localidad
    column('Beneficiario', &:owner_full_name)
    ProgressCheck.all.each do |item|
      column item.name do |settlement|
        (settlement.progress_inputs.find_by(:progress_check_id => item.id).try(:progress) || 0) / 100.0
      end
    end
    column 'Avance' do |settlement|
      "#{settlement.progress}%"
    end
  end

  filter :progress_inputs_updated_at, label: 'Fecha de Avances', as: :date_range

end
