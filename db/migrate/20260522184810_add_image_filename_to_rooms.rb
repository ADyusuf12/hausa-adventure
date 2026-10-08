class AddImageFilenameToRooms < ActiveRecord::Migration[8.1]
  def change
    add_column :rooms, :image_filename, :string
  end
end
