class ColoniesController < ApplicationController
  before_action :set_colony, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except:[:index, :show]
  before_action :require_same_user, only:[:edit, :update, :destory]

  # GET /colonies
  # GET /colonies.json
  def index
    @colonies = Colony.all
  end

  # GET /colonies/1
  # GET /colonies/1.json
  def show

  end

  # GET /colonies/new
  def new
    @colony = Colony.new
  end

  # GET /colonies/1/edit
  def edit
  end

  # POST /colonies
  # POST /colonies.json
  def create
    @colony = Colony.new(colony_params)
    @colony.user = current_user
    respond_to do |format|
      if @colony.save
        format.html { redirect_to user_path(@current_user), notice: 'Colony was successfully created.' }
        format.json { render :show, status: :created, location: @colony }
      else
        format.html { render :new }
        format.json { render json: @colony.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colonies/1
  # PATCH/PUT /colonies/1.json
  def update
    respond_to do |format|
      if @colony.update(colony_params)
        format.html { redirect_to colonies_path, notice: 'Colony was successfully updated.' }
        format.json { render :show, status: :ok, location: @colony }
      else
        format.html { render :edit }
        format.json { render json: @colony.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colonies/1
  # DELETE /colonies/1.json
  def destroy
    @colony.destroy
    respond_to do |format|
      format.html { redirect_to colonies_path, notice: 'Colony was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_cat
    @colony = Colony.find(params[:id])
    @colony.cats.create
    redirect_to(colonies_path)
  end

  def add_cat
    @colony = Colony.find(params[:id])
    @colony.cats.create
    redirect_to(colonies_path)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_colony
    @colony = Colony.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def colony_params
    params.require(:colony).permit(:name, :address)
  end

  def require_user
  end

  def require_same_user
    if current_user!=@colony.user and !current_user.admin?
      flash[:danger] = "you can only edit or delete your own articles"
      redirect_to root_path
    end
  end
end
