class CreateTopicAnswers < ActiveRecord::Migration
  def change
    create_table :topic_answers do |t|
      t.string :body
      t.integer :order
      t.references :topic, index: true

      t.timestamps null: false
    end
    add_foreign_key :topic_answers, :topics
  end
end
