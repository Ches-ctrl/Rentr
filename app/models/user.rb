class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cars, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :booked_cars, through: :bookings, dependent: :destroy, source: :car
  validates :first_name, :last_name, presence: true
  # Removed :email from presence true to re-enable edit my details without
  # changing my password, but still putting in current password.
  validates :email, uniqueness: true
  validates :password, presence: true, on: :create
  has_one_attached :photo
end
