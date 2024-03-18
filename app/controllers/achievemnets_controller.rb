class AchievemnetsController < ApplicationController
  before_action :set_achievemnet, only: %i[ show edit update destroy ]

  # GET /achievemnets or /achievemnets.json
  def index
    @achievemnets = Achievemnet.all
  end

  # GET /achievemnets/1 or /achievemnets/1.json
  def show
  end

  # GET /achievemnets/new
  def new
    @achievemnet = Achievemnet.new
  end

  # GET /achievemnets/1/edit
  def edit
  end

  # POST /achievemnets or /achievemnets.json
  def create
    @achievemnet = Achievemnet.new(achievemnet_params)

    respond_to do |format|
      if @achievemnet.save
        format.html { redirect_to achievemnet_url(@achievemnet), notice: "Achievemnet was successfully created." }
        format.json { render :show, status: :created, location: @achievemnet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @achievemnet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /achievemnets/1 or /achievemnets/1.json
  def update
    respond_to do |format|
      if @achievemnet.update(achievemnet_params)
        format.html { redirect_to achievemnet_url(@achievemnet), notice: "Achievemnet was successfully updated." }
        format.json { render :show, status: :ok, location: @achievemnet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @achievemnet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achievemnets/1 or /achievemnets/1.json
  def destroy
    @achievemnet.destroy

    respond_to do |format|
      format.html { redirect_to achievemnets_url, notice: "Achievemnet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achievemnet
      @achievemnet = Achievemnet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def achievemnet_params
      params.require(:achievemnet).permit(:title, :description, :image_link)
    end
end
