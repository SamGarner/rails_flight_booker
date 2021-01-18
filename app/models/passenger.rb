class Passenger < ApplicationRecord
  validates :name, :email, presence: true
end
