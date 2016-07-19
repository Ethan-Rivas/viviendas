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
      lc.contract_settlements.count
    end

    column 'Ponderación Parcial' do |lc|
      total   = lc.contract_settlements.count
      partial = lc.settlements.count
      percent = partial.to_f / total

      "#{(percent * 100).round(2)}% - #{(percent * lc.progress).round(2)}%"
    end

    column 'Suma' do |lc|
      "#{lc.contract.progress.round(2)}%"
    end
  end
end
