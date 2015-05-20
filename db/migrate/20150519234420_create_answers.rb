class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :round, index: true
      t.string :body
      t.integer :order
      t.boolean :guessed, default: false

      t.timestamps null: false
    end
    add_foreign_key :answers, :rounds
  end
end
