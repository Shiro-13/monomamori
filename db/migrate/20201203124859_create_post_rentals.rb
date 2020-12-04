class CreatePostRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :post_rentals do |t|
      t.integer "item_id"
      t.integer "user_id"
      t.timestamps
    end
  end
end
