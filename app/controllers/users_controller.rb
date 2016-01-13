class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_filter :is_admin?, only: [:index]

  def login
    user = User.find_by(username: params[:username])
    if user && user = user.authenticate(params[:password])
      user.increment_sign_in_count
      user.set_current_sign_in
      session[:current_user_id] = user.token
      render json: user, status: :accepted
    else
      head :unauthorized
    end
  end

  def logout
    user = authenticate
    user.set_last_sign_in
    @current_user = session[:current_user_id] = nil
    head :ok
  end

  def index
    users = User.all
    render json: users, status: 200
  end

  def show
    render json: @user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created, location: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :role, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
