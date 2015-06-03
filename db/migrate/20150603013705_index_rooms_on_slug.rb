class IndexRoomsOnSlug < ActiveRecord::Migration
  def change
    add_index :rooms, :slug
  end
end
