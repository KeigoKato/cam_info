class Picture < ApplicationRecord

  mount_uploader :image, ImageUploader

  acts_as_taggable

  has_one :exif, dependent: :destroy
  has_many :likes

  # validates :image, presence: true
  validate :add_error_about_image

  def add_error_about_image
    if image.blank?
      errors[:base] << "画像を選択してください"
    end
  end


  def get_exif_data()
    if image.present?
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
  end


end
