class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :start_date, :end_date, presence: true
  validate :validate_dates

  private

  def validate_dates
    return false unless start_date.present? || end_date.present?

    booking_cannot_be_in_the_past
    end_date_cannot_be_before_start_date
    overlapping_bookings
  end

  def booking_cannot_be_in_the_past
    return unless start_date.past?

    errors.add(:start_date, "cannot be in the past")
  end

  def end_date_cannot_be_before_start_date
    return unless end_date < start_date

    errors.add(:end_date, "must be later than the start date")
  end

  def overlapping_bookings
    new_booking_range = start_date..end_date
    car.bookings.all.each do |booking|
      booking_range = booking.start_date..booking.end_date
      if new_booking_range.overlaps?(booking_range)
        errors.add(:base, "The car is already booked for selected dates")
        errors.add :start_date
        errors.add :end_date
      end
    end
    return
  end
end
