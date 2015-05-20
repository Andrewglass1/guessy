class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :prompt
      t.references :room, index: true
      t.string :state, default: "pending"

      t.timestamps null: false
    end
    add_foreign_key :rounds, :rooms
  end
end
