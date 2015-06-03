class AddSuggestedPromptToRound < ActiveRecord::Migration
  def change
    add_reference :rounds, :suggested_prompt, index: true
    add_foreign_key :rounds, :suggested_prompts
  end
end
