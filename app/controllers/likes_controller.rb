class LikesController < ApplicationController

  def create
    @likes = Like.new(user_id: current_user.id, picture_id: params[:picture_id])
    @likes.save
    # redirect_to request.path
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @likes = Like.find_by(user_id: current_user.id, picture_id: params[:picture_id])
    @likes.destroy
    # redirect_to request.path
    respond_to do |format|
      format.html
      format.js
    end
  end

end
