class Api::V1::SettlementsController < ApiController
  before_action :authenticate_user!
  before_filter :find_settlement, only: [:show, :update]

  def index
    settlements = current_user.contract.settlements

    render json: settlements
  end

  def show
    render json: @settlement
  end

  def update
    @settlement.update(settlement_params)

    if @settlement.valid?
      render json: @settlement, status: :ok
    else
      render json: { errors: @settlement.errors}, status: :unprocessable_entity
    end
  end

  private
  def settlement_params
    params.require(:settlement).permit([
      :check_1, :check_2, :check_3,
      :check_4, :check_5, :check_6, :check_7,
      :check_8, :check_9, :check_10
    ]) if params[:settlement].present?
  end

  def find_settlement
    @settlement = Settlement.find(params[:id])
  end
end
