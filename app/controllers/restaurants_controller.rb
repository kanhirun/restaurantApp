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
  end


  def create
    @restaurant = Restaurant.new(
      name:         params[:name],
      description:  params[:description],
      address_1:    params[:address_1],
      address_2:    params[:address_2],
      phone_number: params[:phone_number]
    )

    if @restaurant.save
      redirect_to action: :show
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
end
