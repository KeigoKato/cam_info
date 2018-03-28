class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :file

  process :resize_to_limit => [740, 740]

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
