class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.integer "user_id"
      t.datetime "return_date"
      t.datetime "rental_date"
      t.boolean "is_returned", default: false
      t.integer "item_id"
      t.datetime "days"
      t.timestamps
    end
  end
end
