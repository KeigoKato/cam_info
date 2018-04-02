# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180402122724) do

  create_table "exifs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "dataTime"
    t.string "make"
    t.string "cameraModel"
    t.string "imageSize"
    t.string "lensType"
    t.string "whiteBalance"
    t.string "orientation"
    t.string "fileType"
    t.string "ISO"
    t.string "focalLength"
    t.string "exposureBias"
    t.string "exposureTime"
    t.string "fNumber"
    t.string "focusDistance"
    t.string "flash"
    t.string "GPSLatitude"
    t.string "GPSLongitude"
    t.integer "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dataTime"
    t.string "make"
    t.string "model"
    t.string "imageSize"
    t.string "lensType"
    t.string "whiteBalace"
    t.string "orientation"
    t.string "fileType"
    t.integer "ISO"
    t.string "focalLength"
    t.integer "exposureBias"
    t.integer "fNumber"
    t.string "focusDistance"
    t.string "flash"
    t.string "GPSLatitude"
    t.string "GPSLongitude"
  end

end
