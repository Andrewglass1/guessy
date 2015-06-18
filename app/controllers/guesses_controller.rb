class GuessesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_round

  def create
    answer = @round.answers.find_by(body: params[:guess], guessed: false)
    if answer.nil?
      msg = "Keep Trying Chump!"
    else
      answer.mark_guessed!
      msg = @round.complete? ? "Congrats you finished!" : "Congrats, you guessed it! Only #{@round.remaining_answers.count} to go!"
    end
    respond_to do |f|
      f.html do
        flash[:success] = msg
        redirect_to room_path(@round.room)
      end
      f.json do
        render json: {room: @round.room, message: msg}
      end
    end
  end

  def load_round
    @round = Round.find(params[:round_id])
  end
end
