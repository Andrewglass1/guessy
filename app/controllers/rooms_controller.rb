class RoomsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    @room = Room.create
    round = @room.attach_round(params.slice("topic_id", "suggested_prompt_id", "prompt"))
    round.activate! if round.answers.any?

    respond_to do |format|
      format.json do
        render json: {room: @room}
      end

      format.html do
        if round.active?
          redirect_to room_path(@room)
        else
          redirect_to edit_round_path(round)
        end
      end
    end
  end

  def show
      @room         = Room.find_by(slug: params[:id])
      @round = @room.current_round
    respond_to do |format|
      format.json { render json: @room }
      format.html
    end
  end
end
