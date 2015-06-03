class Answer < ActiveRecord::Base
  belongs_to :round

  def mark_guessed!
    update_attribute(:guessed, true)
    round.complete! unless round.remaining_answers.any?
  end
end
