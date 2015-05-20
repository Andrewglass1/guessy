class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :room, index: true
      t.string :sender_name

      t.timestamps null: false
    end
    add_foreign_key :messages, :rooms
  end
end
