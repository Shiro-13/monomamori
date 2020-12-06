class ChangeRentalsColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :item_id, :integer
    add_column :rentals, :days, :datetime
  end
end
