class CarsController < ApplicationController
  before_action :set_car, only: [:show, :destroy]

  def index
    @cars = Car.all
    if params[:start_date].present?
      start_date = params[:start_date]
      end_date = params[:end_date]
      @car_ids = @cars.reject do |car|
        car.bookings.pluck(:start_date, :end_date).map {|date| (date[0]..date[1]).to_a }.flatten.include?(start_date.to_date) || car.bookings.pluck(:start_date, :end_date).map {|date| (date[0]..date[1]).to_a }.flatten.include?(end_date.to_date)
      end.map {|car| car.id }
      @cars = Car.where(id: @car_ids)
    end

    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {car: car}),
        marker_html: render_to_string(partial: "marker", locals: {car: car})
      }
    end
  end

  def show
    @booking = Booking.new
    @booked_dates = @car.bookings.pluck(:start_date, :end_date).map { |pair| (pair[0]..pair[1]).to_a }.flatten
    @daily_rate = @car.day_rate
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
