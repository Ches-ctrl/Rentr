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
    @booked_dates = @car.bookings.pluck(:start_date, :end_date).map { |pair| (pair[0]..pair[1]).to_a }.flatten
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to @car, notice: 'Car successfully added'
    else
      render :new, notice: :unprocessable_entity
    end
  end

  def destroy
    if @car.destroy
      redirect_to profile_path(current_user), notice: 'Car succesfully removed'
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
