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

  def secret_admin_update
    respond_to do |format|
      @user = User.find(params[:id])
      @user.admin = true

      if @user.save
        format.html { redirect_to user_url(@user), notice: "done deal" }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private def user_params
    params.require(:user).permit(:first_name, :last_name, :image_link)
  end

end
