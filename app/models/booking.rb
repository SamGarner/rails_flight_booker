class Booking < ApplicationRecord
  validates :passenger_id, :confirmation_number, :flight_id, presence: true

  belongs_to :flight
  belongs_to :passenger
  has_one :departure, through: :flight
  has_one :arrival, through: :flight
end
