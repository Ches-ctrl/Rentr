class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
    @booked_dates = @car.bookings.pluck(:start_date, :end_date).map { |pair| (pair[0]..pair[1]).to_a }.flatten
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @car = Car.find(params[:car_id])
    @booking.car = @car
    if @booking.save
      @booking = Booking.new
      redirect_to car_path(@car), notice: 'Booking successfully added'
    else
      render 'cars/show', status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to profile_path(current_user), notice: 'Booking successfully cancelled'
    else
      render booking_path(@booking), status: :unprocessable_entity
    end
  end

  def user_bookings
    @bookings = Booking.where(user: current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :car_id)
  end
end
