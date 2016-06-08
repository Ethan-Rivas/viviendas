class Api::V1::PicturesController < ApiController
  before_filter :find_settlement

  def create
    picture = @settlement.pictures.create(image: params[:image])
    render text: picture.image.url
  end

private

  def find_settlement
    @settlement = Settlement.find(params[:settlement_id])
  end
end
