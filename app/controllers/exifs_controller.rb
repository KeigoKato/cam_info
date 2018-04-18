class ExifsController < ApplicationController

  def edit
    @picture = Picture.find(params[:picture_id])
    @exif = @picture.exif
  end

  def update
    @exif = Exif.find_by(picture_id: params[:picture_id])
    if @exif.update(exif_params)
      redirect_to root_path, success: "exif情報が保存されました"
  end

  def exif_params
    # params.require(:exif).merge(picture_id: params[:picture_id])
    params.require(:exif).permit(:dataTime, :make, :cameraModel, :lensType, :whiteBalance, :orientation, :fileType, :ISO, :focalLength, :exposureBias, :exposureTime, :fNumber, :focusDistance, :flash, :GPSLatitude, :GPSLongitude, :picture_id)
  end

end
