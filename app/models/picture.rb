class Picture < ApplicationRecord

  mount_uploader :image, ImageUploader

  def get_exif_data()
    image = self.image.file.file
    exif = MiniExiftool.new image
    exif_data = {
      撮影日: exif.DataTimeOriginal,
      カメラメーカー: exif.Make,
      カメラモデル: exif.Model,
      イメージサイズ: exif.ImageSize,
      レンズ: exif.LensType,
      ホワイトバランス: exif.WhiteBalanceTemperature,
      測光モード: exif.MeteringMode,
      画像の向き: exif.Orientation,
      ファイルタイプ: exif.FileType,
      ISOスピード: exif.ISO,
      レンズ35mm換算焦点距離: exif.FocalLength35efl,
      露出バイアス値: exif.RawDevExposureBiasValue,
      f値: exif.FNumber,
      露出時間: exif.ExposureTime,
      被写体距離: exif.FocusDistance,
      ストロボ: exif.Flash,
      GPS緯度: exif.GPSLatitude,
      GPS経度: exif.GPSLongitude
    }
    return exif_data
  end

end
