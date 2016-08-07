class Api::UsersController < ApplicationController

  before_action :authenticate_user!, except: [:create]

  def index
    render json: {}, status: :ok
  end

  def show
    render json: {}, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save!
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    render json: {}, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(
      :email, :password,
      :password_confirmation
    )
  end

end
