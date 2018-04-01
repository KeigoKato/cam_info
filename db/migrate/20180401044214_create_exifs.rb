class CreateExifs < ActiveRecord::Migration[5.1]
  def change
    create_table :exifs do |t|
      t.string :dateTime
      t.string :make
      t.string :model
      t.string :lensType
      t.integer :pixelX
      t.integer :pixelY
      t.string :exposureTime
      t.integer :exopsureBias
      t.integer :isoSpeed
      t.integer :fNumber
      t.integer :focalLength
      t.string :whiteBalance
      t.string :flash
      t.timestamps
    end
  end
end
