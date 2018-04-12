class LikesController < ApplicationController
  before_action :set_pictures

  def create
    likes = Like.new(user_id: current_user.id, picture_id: params[:picture_id])
    respond_to do |format|
      if likes.save
        format.html
        format.js
      end
    end
  end

  def destroy
    likes = Like.find_by(user_id: current_user.id, picture_id: params[:picture_id])
    respond_to do |format|
      if likes.destroy
        format.html
        format.js
      else
        format.html
      end
    end
  end

  def set_pictures
    @pictures = Picture.order("created_at DESC").includes(:tags)
  end

end
