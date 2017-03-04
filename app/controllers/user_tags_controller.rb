class UserTagsController < ApplicationController
  before_action :set_tag, only: [ :destroy]

  # POST /user_tags
  # POST /user_tags.json
  def create
    if !UserTag.already_registered(user_tag_params.to_h['user_id'], user_tag_params.to_h['tag_id'])
      @user_tag = UserTag.new(user_tag_params)
      respond_to do |format|
        if @user_tag.save
          format.html { redirect_to tags_url, notice: 'タグのコミュニティに参加しました' }
          format.json { render template: 'tags/index', status: :created, location: @user_tag }
        else
          format.html { render template: 'tags/index' }
          format.json { render json: @user_tag.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to tags_url, notice: 'すでに参加しています。' }
        format.json { render template: 'tags/index', status: :not_modified, location: @user_tag }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @user_tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url, notice: 'タグのコミュニティから抜けました' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @user_tag = UserTag.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_tag_params
    params.require(:user_tag).permit(:user_id, :tag_id)
  end
end
