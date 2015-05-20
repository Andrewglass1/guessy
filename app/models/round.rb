class Round < ActiveRecord::Base
  belongs_to :room
  has_many :answers

  def activate
    update_attribute(:state, "active")
  end
end
