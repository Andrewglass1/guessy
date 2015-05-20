class Topic < ActiveRecord::Base
  has_many :topic_answers
end
