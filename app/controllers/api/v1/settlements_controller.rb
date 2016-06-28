class Api::V1::SettlementsController < ApiController
  before_action :authenticate_user!
  before_filter :find_settlement, only: :show

  def index
    settlements = current_user.settlements

    render json: settlements
  end

  def show
    render json: @settlement
  end

private

  def find_settlement
    @settlement = current_user.settlements.find(params[:id])
  end
end
