class MvpwinsController < ApplicationController
  before_action :set_mvpwin, only: %i[ show edit update destroy ]

  # GET /mvpwins or /mvpwins.json
  def index
    @mvpwins = Mvpwin.all
  end

  # GET /mvpwins/1 or /mvpwins/1.json
  def show
  end

  # GET /mvpwins/new
  def new
    @mvpwin = Mvpwin.new
  end

  # GET /mvpwins/1/edit
  def edit
  end

  # POST /mvpwins or /mvpwins.json
  def create
    @mvpwin = Mvpwin.new(mvpwin_params)

    # look up each user stat and add in the mvp win 
  
    mvpwin_params[:winner_ids].each do |win|
      stat = Stat.where(user_id: Integer(win))
        p stat
        stat[0].mvp_wins = (stat[0].mvp_wins || 0) + 1
        stat[0].save

        # award the user with achievement of first mvp win
        user = User.find(Integer(win))
        if stat[0].mvp_wins == 1
          user.achievements << 2
          user.save
        end
    end
   

    respond_to do |format|
      if @mvpwin.save
        format.html { redirect_to mvpwin_url(@mvpwin), notice: "Mvpwin was successfully created." }
        format.json { render :show, status: :created, location: @mvpwin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mvpwin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mvpwins/1 or /mvpwins/1.json
  def update
    respond_to do |format|
      if @mvpwin.update(mvpwin_params)
        format.html { redirect_to mvpwin_url(@mvpwin), notice: "Mvpwin was successfully updated." }
        format.json { render :show, status: :ok, location: @mvpwin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mvpwin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mvpwins/1 or /mvpwins/1.json
  def destroy
    @mvpwin.destroy

    respond_to do |format|
      format.html { redirect_to mvpwins_url, notice: "Mvpwin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mvpwin
      @mvpwin = Mvpwin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mvpwin_params
      params.require(:mvpwin).permit(:details, winner_ids: [])
    end
end
