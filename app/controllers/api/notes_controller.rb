class Api::NotesController < ApplicationController

  before_action :authenticate_user!

  def index
    render json: {}, status: :ok
  end

  def show
    render json: {}, status: :ok
  end

  def create
    render json: {}, status: :created
  end

  def update
    render json: {}, status: :ok
  end

  def destroy
    render json: {}, status: :reset_content
  end

end
