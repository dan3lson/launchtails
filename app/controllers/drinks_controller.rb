class DrinksController < ApplicationController
  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(drink_params)
    if @drink.save
      flash[:notice] = 'Drink added.'
      redirect_to '/drinks'
    else
      render :new
    end
  end

  def index
    # Code below works and is ahead of released specs
    #binding.pry
    #category = Category.find(params[:id])
    #@drinks = category.drinks
  end

  def show
  end

  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy
    flash[:notice] = 'Drink deleted.'
    redirect_to drinks_path
  end

  protected
  def drink_params
    params.require(:drink).permit(:title, :description)
  end
end
