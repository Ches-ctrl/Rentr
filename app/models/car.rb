class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :renting_users, through: :bookings, source: :user
  
  validates :model, :brand, :location, :transmission, :day_rate, presence: true

  has_many_attached :photos

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
