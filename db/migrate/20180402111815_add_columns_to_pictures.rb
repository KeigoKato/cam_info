class AddColumnsToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :dataTime, :string
    add_column :pictures, :make, :string
    add_column :pictures, :model, :string
    add_column :pictures, :imageSize, :string
    add_column :pictures, :lensType, :string
    add_column :pictures, :whiteBalace, :string
    add_column :pictures, :orientation, :string
    add_column :pictures, :fileType, :string
    add_column :pictures, :ISO, :integer
    add_column :pictures, :focalLength, :string
    add_column :pictures, :exposureBias, :integer
    add_column :pictures, :fNumber, :integer
    add_column :pictures, :focusDistance, :string
    add_column :pictures, :flash, :string
    add_column :pictures, :GPSLatitude, :string
    add_column :pictures, :GPSLongitude, :string
  end
end
