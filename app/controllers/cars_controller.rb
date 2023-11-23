class CarsController < ApplicationController
  before_action :set_car, only: [:show, :destroy]

  def index
    @cars = Car.all
    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude
      }
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to @car
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy
    redirect_to profile_path(current_user)
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
