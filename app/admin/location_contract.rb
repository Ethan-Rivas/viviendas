ActiveAdmin.register LocationContract do
  index do
    column :contract
    column :town
    column :location
    column :company
    column 'Cantidad' do |lc|
      lc.settlements.count
    end
    column 'Avance Real' do |lc|
      "#{lc.progress.round(2)}%"
    end

    column 'Suma' do |lc|
      if lc.contract_settlements
        lc.contract_settlements.count
      else
        0
      end
    end

    column 'Ponderación Parcial' do |lc|
      if lc.contract_settlements
        total   = lc.contract_settlements.count
        partial = lc.settlements.count
        percent = partial.to_f / total

        "#{(percent * 100).round(2)}% - #{(percent * lc.progress).round(2)}%"
      else
        'No Disponible'
      end
    end

    column 'Suma' do |lc|
      "#{lc.contract.progress.round(2)}%"
    end
  end
end
