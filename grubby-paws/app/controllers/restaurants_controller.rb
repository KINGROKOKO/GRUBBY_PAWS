# require 'pry'

class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
  def index
    @restaurants = Restaurant.all.order("created_at DESC")
  end

  def show
  end

  def new
    @restaurant = current_user.restaurants.build
    @categories = Category.all.map{|c| [c.name, c.id]}
    # binding.pry
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    @restaurant.category_id = params[:category_id]

    if @restaurant.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @categories = Category.all.map{|c| [c.name, c.id]}
  end

  def update
    @restaurant.category_id = params[:category_id]

    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to root_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :location, :category_id)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
