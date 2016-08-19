class UsersController < ApplicationController


   load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
if User.current_user = :admin
    layout 'admin_layout'
else 
      layout 'passenger_layout'
  end 



  # GET /trains
  # GET /trains.json
  def index
    @users = User.all
  end

  # GET /trains/1
  # GET /trains/1.json
  def show
  end

  # GET /trains/new
  def new
    @user = User.new
  end

  # GET /trains/1/edit
  def edit
  end

  # POST /trains
  # POST /trains.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trains/1
  # PATCH/PUT /trains/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trains/1
  # DELETE /trains/1.json
  def destroy
    @train.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password)
    end

end
