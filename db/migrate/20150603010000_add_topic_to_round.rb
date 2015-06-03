class AddTopicToRound < ActiveRecord::Migration
  def change
    add_reference :rounds, :topic, index: true
    add_foreign_key :rounds, :topics
  end
end
