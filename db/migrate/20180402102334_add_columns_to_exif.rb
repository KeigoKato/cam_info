class AddColumnsToExif < ActiveRecord::Migration[5.1]
  def change
    add_column :exifs, :picture_id, :integer
  end
end
