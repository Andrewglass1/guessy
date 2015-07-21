class TopicsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Topic.all
  end
end
