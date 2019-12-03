class UsersController < ApplicationController

  before_action :get_all_users, only: [:index, :create, :destroy]
  before_action :find_user_by_id, only: [:destroy]

  def create 
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: 'Danger, Will Robinson!'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def get_all_users
    @users = User.all 
  end

  def find_user_by_id
    @user = User.find(params[:id])
  end 

end
