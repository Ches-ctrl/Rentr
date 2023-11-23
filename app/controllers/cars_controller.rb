class CarsController < ApplicationController
  before_action :set_car, only: [:show]

  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = User.find(current_user.id)
    if @car.save
      redirect_to @car
    else
      render :new, status: :unprocessable_entity
    end
  end

  def user_cars
    @cars = Car.where(user: current_user)
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:category, :model, :brand, :location, :transmission, :day_rate, :description, :user_id, photos: [])
  end
end
