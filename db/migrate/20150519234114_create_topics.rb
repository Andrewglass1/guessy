class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :prompt

      t.timestamps null: false
    end
  end
end
