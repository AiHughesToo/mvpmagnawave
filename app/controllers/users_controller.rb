class UsersController < ApplicationController
    before_action :authenticate_user!, only: %i[ show edit update destroy ] 

  def index
    @users = User.all.order('last_name')
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  private def user_params
    params.require(:user).permit(:first_name, :last_name, :image_link)
  end

end
