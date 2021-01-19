class Booking < ApplicationRecord
  validates :flight_id, presence: true

  belongs_to :flight
  has_many :passengers
  has_one :departure, through: :flight
  has_one :arrival, through: :flight

  accepts_nested_attributes_for :passengers
end
