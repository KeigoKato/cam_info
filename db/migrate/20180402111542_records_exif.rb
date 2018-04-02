class RecordsExif < ActiveRecord::Migration[5.1]
  def change
    drop_table :exifs
  end
end
