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

ActiveRecord::Schema.define(version: 20180401044214) do

  create_table "exifs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "dateTime"
    t.string "make"
    t.string "model"
    t.string "lensType"
    t.integer "pixelX"
    t.integer "pixelY"
    t.string "exposureTime"
    t.integer "exopsureBias"
    t.integer "isoSpeed"
    t.integer "fNumber"
    t.integer "focalLength"
    t.string "whiteBalance"
    t.string "flash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
