class Api::FeedsController < ApplicationController

  def index
    if current_user
      current_user
      @feeds = []
    else
      @feeds = []
    end
    render json: {}, status: :ok
  end

  def show
    current_user
    render json: {}, status: :ok
  end

end
