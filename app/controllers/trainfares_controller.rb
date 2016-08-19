class TrainfaresController < ApplicationController
before_action :authenticate_user!


   load_and_authorize_resource
   layout :choose_layout


  before_action :set_trainfare, only: [:show, :edit, :update, :destroy]

  # GET /trainfares
  # GET /trainfares.json
  def index
  
  @q = Trainfare.ransack(params[:q])
    
  @trainfares = @q.result(distinct: true)

   
  end

  # GET /trainfares/1
  # GET /trainfares/1.json
  def show
  end

  # GET /trainfares/new
  def new
    @trainfare = Trainfare.new
  end

  # GET /trainfares/1/edit
  def edit
  end

  # POST /trainfares
  # POST /trainfares.json
  def create
    @trainfare = Trainfare.new(trainfare_params)

    respond_to do |format|
      if @trainfare.save
        format.html { redirect_to @trainfare, notice: 'Trainfare was successfully created.' }
        format.json { render :show, status: :created, location: @trainfare }
      else
        format.html { render :new }
        format.json { render json: @trainfare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainfares/1
  # PATCH/PUT /trainfares/1.json
  def update
    respond_to do |format|
      if @trainfare.update(trainfare_params)
        format.html { redirect_to @trainfare, notice: 'Trainfare was successfully updated.' }
        format.json { render :show, status: :ok, location: @trainfare }
      else
        format.html { render :edit }
        format.json { render json: @trainfare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainfares/1
  # DELETE /trainfares/1.json
  def destroy
    @trainfare.destroy
    respond_to do |format|
      format.html { redirect_to trainfares_url, notice: 'Trainfare was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainfare
      @trainfare = Trainfare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trainfare_params
      params.require(:trainfare).permit(:train_id, :source, :destination, :fare1,:traintype, :name)
    end

     def choose_layout
      puts "#"*100, user_signed_in?, current_user.admin?
      if user_signed_in? and current_user.admin?
        "admin_layout"
      else
        "passenger_layout"
      end
    end
end
