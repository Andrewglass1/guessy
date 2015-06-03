class GuessesController < ApplicationController
  before_action :load_round

  def create
    if answer = @round.answers.find_by(body: params[:guess], guessed: false)
      answer.mark_guessed!
      if @round.complete?
        flash[:success] = "Congrats, you finished the round!"
      else
        flash[:success] = "Congrats, you guessed it! Only #{@round.remaining_answers.count} to go!"
      end
    else
      flash[:success] = "Keep trying, chump."
    end
    redirect_to room_path(@round.room)
  end

  def load_round
    @round = Round.find(params[:round_id])
  end
end
