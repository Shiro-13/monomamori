class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.integer "category_id"
      t.string "name"
      t.integer "image_id"
      t.string "place"
      t.integer "status", default: 0
      t.text ""
      t.timestamps
    end
  end
end
