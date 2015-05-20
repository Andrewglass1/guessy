class RoomsController < ApplicationController

  def new
  end

  def create
    @room = Room.create
    round = attach_round
    if round.answers.any?
      round.activate
      redirect_to room_path(@room)
    else
      redirect_to edit_round_path(round)
    end
  end

  def show
    @room         = Room.find(params[:id])
    @active_round = @room.active_round
  end
private

  def attach_round
    if params["topic_id"]
      topic = Topic.find(params["topic_id"])
      @room.create_round_from_topic(topic)
    elsif params["suggested_prompt_id"]
      body = SuggestedPrompt.find(params["suggested_prompt_id"]).body
      @room.create_round_from_prompt(body)
    elsif params["prompt"]
      @room.create_round_from_prompt(params["prompt"])
    else
      raise "Somethings wrong"
    end

  end
end
