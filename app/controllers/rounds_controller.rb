class RoundsController < ApplicationController

  def edit
    @round = Round.find(params[:id])
  end

  def update
    @round = Round.find(params[:id])
    answers = params["answers"].reject(&:empty?)
    answers.each_with_index do |answer, index|
      @round.answers.create(body: answer, order: index)
    end
    @round.activate
    redirect_to room_path(@round.room)
  end
end
