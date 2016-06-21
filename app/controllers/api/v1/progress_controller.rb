class Api::V1::ProgressController < ApiController
  before_action :authenticate_user!
  before_filter :find_settlement
  
  def update
    progress = @settlement.progress_inputs.find_or_create_by(progress_check_id: params[:id])

    progress.update_attribute(:progress, params[:progress])

    if @settlement.valid?
      render json: @settlement, status: :ok
    else
      render json: { errors: @settlement.errors}, status: :unprocessable_entity
    end
  end

  private

  def find_settlement
    @settlement = Settlement.find(params[:settlement_id])
  end
end
