class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.bigint :passenger_id
      t.string :confirmation_number
      t.bigint :flight_id

      t.timestamps
    end
    add_index :bookings, :confirmation_number, unique: true
  end
end
