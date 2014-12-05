class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: { "token" => user.token }
    else
      head :unauthorized
    end
  end

  def logout
    head :ok
  end

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    head :no_content
  end

  private 
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :role, :email, :password, :password_confirmation, :token)
  end

  def set_user
    @user = User.find(params[:id])
  end
end