class CreateItemRentalInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :item_rental_infos do |t|
      t.integer  "rental_count",     default: 0
      t.boolean  "is_rentaled",      default: false
      t.integer  "last_rental_id"
      t.string   "last_rental_name"
      t.integer  "now_rental_id"
      t.string   "now_rental_name"
      t.integer  "item_id"
      t.timestamps
    end
  end
end
