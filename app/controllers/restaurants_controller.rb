class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
    # render index.html.erb
  end

  def show
  end

  def new
    # for the form
    @restaurant = Restaurant.new
  end

  def create # never has a view!
    # save to DB
    @restaurant = Restaurant.new(restaurant_params) # strong params!
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      # redirect_to new_restaurant_path
      render :new # new.html.erb
    end
  end

  def edit # our form
  end

  def update # updating the DB
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit # edit.html.erb
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  # STRONG PARAMS -> whitelisting attributes
  def restaurant_params
    # params[:restaurant] -> permit name, address, raint
    params.require(:restaurant).permit(:name, :address, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
