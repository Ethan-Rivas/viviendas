
ActiveAdmin.register ProgressInput do
  permit_params :settlement_id, :progress_check_id, :progress

  index do
    selectable_column
    column :settlement_id
    column :progress_check_id
    actions
  end

  config.filters = false

end
