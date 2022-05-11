class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :guest, null: false, foreign_key: true
      t.string :code
      t.date :start_date
      t.date :end_date
      t.integer :nights
      t.integer :total_guests
      t.integer :adults
      t.integer :children
      t.integer :infants
      t.string :status
      t.string :currency
      t.integer :payout_price
      t.integer :security_price
      t.integer :total_price

      t.timestamps
    end
  end
end
