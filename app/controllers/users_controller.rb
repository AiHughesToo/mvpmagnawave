class UsersController < ApplicationController
    before_action :authenticate_user!, only: %i[ show edit update destroy ] 

  def index
    @users = User.all.order('last_name')
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

    # PATCH/PUT /announcements/1 or /announcements/1.json
    def update
      p params[:id]
      user = User.find(params[:id])
      respond_to do |format|
        if user.update(user_params)
          format.html { redirect_to user_url(user), notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: user.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
     user = User.find(params[:id])
  
     user.destroy
     
      respond_to do |format|
        format.html { redirect_to stats_url, notice: "Stat was successfully destroyed." }
        format.json { head :no_content }
      end
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
    params.require(:user).permit(:first_name, :last_name, :image_link, :achievements, :mvp_sent)
  end

end
