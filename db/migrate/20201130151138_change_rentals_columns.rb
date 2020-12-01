class ChangeRentalsColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :rentals, :equipment_id, :integer
    add_column :rentals, :item_id, :integer
  end
end
