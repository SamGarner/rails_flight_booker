class Passenger < ApplicationRecord
  validates :name, :email, presence: true

  has_many :bookings
  has_many :flights, through: :bookings
  has_many :departures, through: :flights
  has_many :arrivals, through: :flights
end
