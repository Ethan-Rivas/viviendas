class Api::V1::SettlementsController < ApiController
  before_action :authenticate_user!
  before_filter :find_settlement, only: [:show, :update, :destroy]

  def index
    settlements = current_user.contract.settlements

    render json: settlements
  end

  def show
    render json: @settlement
  end

  def create
    settlement = Settlement.create(settlement_params)

    if settlement.valid?
      render json: settlement
    else
      render json: settlement.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @settlement.destroy

    render nothing: true, status: :ok
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
      :uso, :dos, :tres, :contract_id
    ]) if params[:settlement].present?
  end

  def find_settlement
    @settlement = Settlement.find(params[:id])
  end
end
