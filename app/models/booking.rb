class Booking < ApplicationRecord
  validate :passenger_id, :confirmation_number, :flight_id, presence: true
end
