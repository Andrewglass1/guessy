class RoomsController < ApplicationController

  def new
  end

  def create
    @room = Room.create
    round = @room.attach_round(params.slice("topic_id", "suggested_prompt_id", "prompt"))
    if round.answers.any?
      round.activate!
      redirect_to room_path(@room)
    else
      redirect_to edit_round_path(round)
    end
  end

  def show
    @room         = Room.find_by(slug: params[:id])
    @round = @room.current_round
  end
end
