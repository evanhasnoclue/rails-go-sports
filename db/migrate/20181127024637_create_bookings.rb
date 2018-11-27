class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :sport, foreign_key: true
      t.time :join_time

      t.timestamps
    end
  end
end
