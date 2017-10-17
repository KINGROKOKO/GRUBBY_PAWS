class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
  def index
    @restaurants = Restaurant.all.order("created_at DESC")
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :location)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
