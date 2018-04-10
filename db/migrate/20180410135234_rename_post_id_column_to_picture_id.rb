class RenamePostIdColumnToPictureId < ActiveRecord::Migration[5.1]
  def change
    rename_column :likes, :post_id, :picture_id
  end
end
