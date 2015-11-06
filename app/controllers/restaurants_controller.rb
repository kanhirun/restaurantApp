class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end


  def show
    @restaurant = Restaurant.find_by(id: params[:id])

    if @restaurant
      redirect_to action: :show
    else
      redirect_to action: :index
    end
  end


  def new
    @restaurant = Restaurant.new
  end


  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      render action: :show
    else
      redirect_to action: :new
    end
  end


  def edit
    @restaurant = Restaurant.find_by(id: params[:id])

    if @restaurant
      redirect_to action: :show
    else
      redirect_to action: :index
    end
  end


  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(params[:attributes])
      redirect_to action: :show
    else
      redirect_to action: :update
    end
  end


  def destroy
    @restaurant = Restaurant.find(params[:id])

    @restaurant.destroy

    redirect_to :index
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name)
    end
end
