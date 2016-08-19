class TrainroutesController < ApplicationController
  
  before_action :authenticate_user!


  load_and_authorize_resource
  layout :choose_layout

  before_action :set_trainroute, only: [:show, :edit, :update, :destroy]
  

  # GET /trainroutes
  # GET /trainroutes.json
  def index
    @q = Trainroute.where(available: true).ransack(params[:q])
    
    distances = [];
    if @q.result(distinct: true).length > 0
      @trainroutes = @q.result(distinct: true)
    else
      @searched_destination = Trainroute.where(source: params[:q][:source_cont], destination: params[:q][:destination_cont])
      @same_destinations = Trainroute.where(destination: params[:q][:destination_cont])
      (@same_destinations - @searched_destination).each do |sd|
        distances.push((@searched_destination.first.distance - sd.distance).abs)
      end
      selected_id  = @same_destinations.select{|d| (@searched_destination.first.distance - d.distance).abs == distances.min}.first.id 
      @trainroutes = Trainroute.where(id: selected_id)
    end
    @trainroutes
  end

  # GET /trainroutes/1
  # GET /trainroutes/1.json
  def show
  end

  # GET /trainroutes/new
  def new
    @trainroute = current_user.trainroutes.build  
  end

  # GET /trainroutes/1/edit
  def edit
  end

  # POST /trainroutes
  # POST /trainroutes.json
  def create
    @trainroute = current_user.trainroutes.build(trainroute_params)

    respond_to do |format|
      if @trainroute.save
        format.html { redirect_to @trainroute, notice: 'Trainroute was successfully created.' }
        format.json { render :show, status: :created, location: @trainroute }
      else
        format.html { render :new }
        format.json { render json: @trainroute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainroutes/1
  # PATCH/PUT /trainroutes/1.json
  def update
    respond_to do |format|
      if @trainroute.update(trainroute_params)
        format.html { redirect_to @trainroute, notice: 'Trainroute was successfully updated.' }
        format.json { render :show, status: :ok, location: @trainroute }
      else
        format.html { render :edit }
        format.json { render json: @trainroute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainroutes/1
  # DELETE /trainroutes/1.json
  def destroy
    @trainroute.destroy
    respond_to do |format|
      format.html { redirect_to trainroutes_url, notice: 'Trainroute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainroute
      @trainroute = Trainroute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trainroute_params
      params.require(:trainroute).permit(:train_id, :source, :destination, :deptdate, :arrivaldate, :deptime, :arrivaltime, :name, :distance, :totalseat)
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
