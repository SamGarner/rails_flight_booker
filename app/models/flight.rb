class Flight < ApplicationRecord
  validates :duration, :take_off, :departure_id, :arrival_id, presence: true

  belongs_to :departure, class_name: 'Airport'
  belongs_to :arrival, class_name: 'Airport'

  def formatted_date(datetime = take_off)
    datetime.strftime('%k:%M on %b %-d, %Y')
  end

  def drop_down_date(datetime = take_off)
    datetime.strftime('%m/%d/%Y')
  end

  def database_date(datetime = take_off)
    datetime.strftime('%F')
  end

  def self.search(departure_id, arrival_id, date)
    Flight.where('departure_id = ? AND arrival_id = ? AND DATE(take_off) = ?',
                 departure_id, arrival_id, date)
  end
end
