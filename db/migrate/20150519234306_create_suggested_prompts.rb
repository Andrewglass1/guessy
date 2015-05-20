class CreateSuggestedPrompts < ActiveRecord::Migration
  def change
    create_table :suggested_prompts do |t|
      t.string :body

      t.timestamps null: false
    end
  end
end
