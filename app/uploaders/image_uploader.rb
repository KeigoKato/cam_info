class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :file

  process :resize_to_limit => [740, 740]

  version :thumb do
    process :resize_to_limit => [100, 100]
    # versionの行にあるthumbは変数のようなもの。勝手に名付けて良い。
    # ビュー に画像を表示するときは以下のような記述をビューファイルに書く
    # = image_tag current_user.prof_img.thumb.url
    # プロパティの最後はurlにする。その手前にthumbをつけるとリサイズされた画像が表示される。
  end


  process :convert => 'jpg'

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
