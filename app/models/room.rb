class Room < ActiveRecord::Base
  has_many :messages
  has_many :rounds
  after_create :set_slug

  STATES = [:pending, :active, :idle]
#active_round
#complete_round! (room: active => idle; active_round: active => played; next round (with status: future) => active
  def create_round_from_topic(topic)
    round = rounds.create(prompt: topic.prompt, topic: topic)
    topic.topic_answers.each do |t_a|
      round.answers.create(body: t_a.body, order: t_a.order)
    end
    round
  end

  def to_param
    slug
  end

  def create_round_from_suggestion(suggestion)
    rounds.create(prompt: suggestion.body, suggested_prompt: suggestion)
  end

  def create_round_from_prompt(prompt)
    rounds.create(prompt: prompt)
  end

  def current_round
    rounds.where(state: "active").last || rounds.where(state: "played").last
  end

  def queued_rounds
    rounds.where(state: "future")
  end

  def recommended_topics
    Topic.where.not(id: rounds.pluck(:topic_id))
  end

  def recommended_prompts
    SuggestedPrompt.where.not(id: rounds.pluck(:suggested_prompt_id))
  end

  def attach_round(options = {})
    if options["topic_id"]
      topic = Topic.find(options["topic_id"])
      create_round_from_topic(topic)
    elsif options["suggested_prompt_id"]
      suggestion = SuggestedPrompt.find(options["suggested_prompt_id"])
      create_round_from_suggestion(suggestion)
    elsif options["prompt"]
      create_round_from_prompt(options["prompt"])
    else
      raise "Somethings wrong"
    end
  end

  def active
    !!(current_round && current_round.active?)
  end
  alias_method :active?, :active

  def as_json(options={})
    super(options.merge(methods: [:active]))
  end
private

  def set_slug
    update_attribute :slug, rand(36**5).to_s(33)
  end

end
