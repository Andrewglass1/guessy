class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :state, default: "pending"
      t.string :slug

      t.timestamps null: false
    end
  end
end
