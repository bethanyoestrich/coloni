class CatsController < ApplicationController
  before_action :set_colony,  only: [:new, :create]

  def new
    @cat = Cat.new
  end

  def index
    @cats = Cat.all
  end

  def show
  end

  def edit
  end

  def create
    @cat = Cat.new(cat_params)
    #@cat.user = current_user

    respond_to do |format|
      if @cat.save
        format.html { redirect_to user_path(@current_user), notice: 'Cat was successfully saved.' }
        format.json { render :show, status: :created, location: @cat }
      else
        format.html { render :new }
      end
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :age, :vaccinated, :created_at, :updated_at, :spayneuter,
      :currentlyatcolony, :approximateage, :notes, :vaxdate, :fleatx, :firstdateseen)
  end

  def set_colony
    @cat = Colony.find(params[:colony_id])
  end
end
