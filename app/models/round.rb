class Round < ActiveRecord::Base
  belongs_to :room
  belongs_to :suggested_prompt
  belongs_to :topic
  has_many :answers

  STATES = [:pending, :active, :played, :future]

  def complete?
    state == "played"
  end

  def active?
    state == "active"
  end
  alias_method :active, :active?

  def activate!
    update_attribute(:state, "active")
  end

  def complete!
    update_attribute(:state, "played")
  end

  def remaining_answers
    answers.where(guessed: false)
  end

  def as_json(options = {})
    opts = {include: [:answers], methods: [:active]}
    super(options.merge(opts))
  end
end
