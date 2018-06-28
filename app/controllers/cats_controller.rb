class CatsController < ApplicationController


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
    if @cat.save
      flash[:success]="Cat has been saved"
      redirect_to colony_path
    else
      render "new"
    end
  end

private
  def cat_params
    params.require(:cat).permit(:name, :age, :vaccinated, :created_at, :updated_at, :spayneuter,
      :currentlyatcolony, :approximateage, :notes, :vaxdate, :fleatx, :firstdateseen)
  end
end
