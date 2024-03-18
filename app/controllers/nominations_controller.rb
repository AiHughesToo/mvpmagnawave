class NominationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_nomination, only: %i[ show edit update destroy ]

  # GET /nominations or /nominations.json
  def index
   # @nominations = Nomination.all.order(created_at: :desc)
   if current_user.admin
    @nominations = Nomination.where(created_at: 1.week.ago..Time.now).order(created_at: :desc)
   else
    @nominations = Nomination.where(created_at: 2.weeks.ago..Time.now).order(created_at: :desc)
   end
   
  end

  # GET /nominations/1 or /nominations/1.json
  def show
  end

  # GET /nominations/new
  def new
    @nomination = Nomination.new
  end

  # GET /nominations/1/edit
  def edit
  end

  # POST /nominations or /nominations.json
  def create
  
    rstat = Stat.where(user_id: nomination_params[:user_id])
    
    rstat[0].noms_received = (rstat[0].noms_received || 0)+ 1
    rstat[0].save

    sstat = Stat.where(user_id: current_user.id)
    sstat[0].noms_sent = (sstat[0].noms_sent || 0) + 1
    sstat[0].save
  
    receiver = User.find(nomination_params[:user_id])


    @nomination = Nomination.new(nomination_params)
    @nomination.sender_id = current_user.id
    @nomination.sender_name = current_user.first_name
    @nomination.receiver_name = receiver.first_name + " " + receiver.last_name
    @nomination.receiver_img_link = receiver.image_link

    if current_user.mvp_sent
      @nomination.nom_type = "shoutout"
    end

    if nomination_params[:nom_type] == "mvp"
      current_user.mvp_sent = true
      current_user.save
    end

    respond_to do |format|
      if @nomination.save
        format.html { redirect_to nomination_url(@nomination), notice: "Nomination was successfully created." }
        format.json { render :show, status: :created, location: @nomination }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nomination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nominations/1 or /nominations/1.json
  def update
    respond_to do |format|
      if @nomination.update(nomination_params)
        format.html { redirect_to nomination_url(@nomination), notice: "Nomination was successfully updated." }
        format.json { render :show, status: :ok, location: @nomination }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nomination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nominations/1 or /nominations/1.json
  def destroy
    @nomination.destroy

    respond_to do |format|
      format.html { redirect_to nominations_url, notice: "Nomination was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nomination
      @nomination = Nomination.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nomination_params
      params.require(:nomination).permit(:nom_type, :sender_id, :sender_name, :user_id, :receiver_name, :receiver_img_link, :nom_body)
    end
end
