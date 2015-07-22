class RecommendedTopicsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :load_room

  def index
    render json: Topic.where.not(id: @room.rounds.pluck(:topic_id))
  end
private

  def load_room
    @room = Room.find_by(slug: params[:room_id])
  end
end
