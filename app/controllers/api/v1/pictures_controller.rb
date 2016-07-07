class Api::V1::PicturesController < ApiController
  before_action :authenticate_user!
  before_filter :find_settlement

  def create
    picture = @settlement.pictures.create(image: params[:bilddatei])
    render text: picture.image.url
  end

private

  def find_settlement
    @settlement = Settlement.find(params[:settlement_id])
  end
end
