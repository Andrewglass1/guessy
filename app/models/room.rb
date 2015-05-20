class Room < ActiveRecord::Base
  has_many :messages
  has_many :rounds
  after_create :set_slug

  def create_round_from_topic(topic)
    round = rounds.create(prompt: topic.prompt)
    topic.topic_answers.each do |t_a|
      round.answers.create(body: t_a.body, order: t_a.order)
    end
    round
  end

  def create_round_from_prompt(prompt)
    rounds.create(prompt: prompt)
  end

  def active_round
    rounds.where(state: "active").last
  end
private

  def set_slug
    update_attribute :slug, rand(36**5).to_s(33)
  end

end
