class RemoveColumnsFromPictures < ActiveRecord::Migration[5.1]
  def change
    remove_column :Pictures, :whiteBalace
    remove_column :Pictures, :orientation
    remove_column :Pictures, :fileType
    remove_column :Pictures, :ISO
    remove_column :Pictures, :focalLength
    remove_column :Pictures, :exposureBias
    remove_column :Pictures, :fNumber
    remove_column :Pictures, :focusDistance
    remove_column :Pictures, :flash
    remove_column :Pictures, :GPSLatitude
    remove_column :Pictures, :GPSLongitude
  end
end
