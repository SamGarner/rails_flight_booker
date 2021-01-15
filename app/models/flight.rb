class Flight < ApplicationRecord
  validates :duration, :take_off, :departure_id, :arrival_id, presence: true

  belongs_to :departure, class_name: 'Airport'
  belongs_to :arrival, class_name: 'Airport'

  def formatted_date(datetime = take_off)
    datetime.strftime('%F at %H:%M')
  end

  def self.search(departure_id, arrival_id)
      # if departure_id.nil? && arrival_id.nil?
      #   @flights = Flight.all
      # else
        @flights = []
        @flights << Flight.where('departure_id = ? AND arrival_id = ?', departure_id, arrival_id).first
      # end
  end
end
