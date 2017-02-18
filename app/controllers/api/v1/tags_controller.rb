class Api::V1::TagsController < ApplicationController
  def index
    @tags = Tag.search(tag_params[:name])
    @tags = @tags.map do |tag| {
      name: tag.name
    } end
    render json: @tags
  end

  private
  # リクエストパラメータのバリデーション
  def tag_params
    params.permit(:name)
  end
end
