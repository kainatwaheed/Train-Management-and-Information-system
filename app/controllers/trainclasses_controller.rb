class TrainclassesController < ApplicationController
  before_action :set_trainclass, only: [:show, :edit, :update, :destroy]

  # GET /trainclasses
  # GET /trainclasses.json
  def index
    @trainclasses = Trainclass.all
  end

  # GET /trainclasses/1
  # GET /trainclasses/1.json
  def show
  end

  # GET /trainclasses/new
  def new
    @trainclass = Trainclass.new
  end

  # GET /trainclasses/1/edit
  def edit
  end

  # POST /trainclasses
  # POST /trainclasses.json
  def create
    @trainclass = Trainclass.new(trainclass_params)

    respond_to do |format|
      if @trainclass.save
        format.html { redirect_to @trainclass, notice: 'Trainclass was successfully created.' }
        format.json { render :show, status: :created, location: @trainclass }
      else
        format.html { render :new }
        format.json { render json: @trainclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainclasses/1
  # PATCH/PUT /trainclasses/1.json
  def update
    respond_to do |format|
      if @trainclass.update(trainclass_params)
        format.html { redirect_to @trainclass, notice: 'Trainclass was successfully updated.' }
        format.json { render :show, status: :ok, location: @trainclass }
      else
        format.html { render :edit }
        format.json { render json: @trainclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainclasses/1
  # DELETE /trainclasses/1.json
  def destroy
    @trainclass.destroy
    respond_to do |format|
      format.html { redirect_to trainclasses_url, notice: 'Trainclass was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainclass
      @trainclass = Trainclass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trainclass_params
      params.require(:trainclass).permit(:name, :train_id, :totalseats, :fare)
    end
end
