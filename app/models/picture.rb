class Picture < ApplicationRecord

  mount_uploader :image, ImageUploader
  has_one :exif, dependent: :destroy
  has_many :likes

  def get_exif_data()
    image = self.image.file.file
    exif = MiniExiftool.new image
    exif_data = {
      dataTime: exif.DateTimeOriginal,
      make: exif.Make,
      cameraModel: exif.Model,
      imageSize: exif.ImageSize,
      lensType: exif.LensType,
      whiteBalance: exif.WhiteBalanceTemperature,
      orientation: exif.Orientation,
      fileType: exif.FileType,
      ISO: exif.ISO,
      focalLength: exif.FocalLength35efl,
      exposureBias: exif.RawDevExposureBiasValue,
      exposureTime: exif.ExposureTime,
      fNumber: exif.FNumber,
      focusDistance: exif.FocusDistance,
      flash: exif.Flash,
      GPSLatitude: exif.GPSLatitude,
      GPSLongitude: exif.GPSLongitude
    }
    return exif_data
  end

  acts_as_taggable

end
