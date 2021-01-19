class Passenger < ApplicationRecord
  validates :name, :email, presence: true

  belongs_to :booking
  has_one :flight, through: :booking
  has_one :departure, through: :flight
  has_one :arrival, through: :flight
end
