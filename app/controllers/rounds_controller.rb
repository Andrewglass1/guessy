class RoundsController < ApplicationController
  before_action :load_room, only: [:create]

  def edit
    @round = Round.find(params[:id])
  end

  def create
    round = @room.attach_round(params.slice("topic_id", "suggested_prompt_id", "prompt"))
    if round.answers.any?
      round.activate!
      redirect_to room_path(@room)
    else
      redirect_to edit_round_path(round)
    end
  end

  def update
    # This path only gets hit when filling in
    # your own answers
    @round = Round.find(params[:id])
    answers = params["answers"].reject(&:empty?)
    answers.each_with_index do |answer, index|
      @round.answers.create(body: answer, order: index + 1)
    end
    @round.activate!
    redirect_to room_path(@round.room)
  end

  def load_room
    @room = Room.find_by(slug: params[:room_id])
  end
end
