class AddBookingIdToPassengers < ActiveRecord::Migration[6.1]
  def change
    add_column :passengers, :booking_id, :bigint
    add_index :passengers, :booking_id
  end
end
