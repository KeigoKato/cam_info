class CreateExifs < ActiveRecord::Migration[5.1]
  def change
    create_table :exifs do |t|
      t.string :dataTime
      t.string :make
      t.string :cameraModel
      t.string :imageSize
      t.string :lensType
      t.string :whiteBalance
      t.string :orientation
      t.string :fileType
      t.string :ISO
      t.string :focalLength
      t.string :exposureBias
      t.string :exposureTime
      t.string :fNumber
      t.string :focusDistance
      t.string :flash
      t.string :GPSLatitude
      t.string :GPSLongitude
      t.integer :picture_id, foreign_key: true
      t.timestamps
    end
  end
end
