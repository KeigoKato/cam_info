class ExifsController < ApplicationController

  def edit
    @picture = Picture.find(params[:picture_id])
    @exif = @picture.exif
  end

  def update
  end

end
