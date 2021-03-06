class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer "category_id"
      t.integer "rental_id"
      t.string "name"
      t.string "image_id"
      t.string "place"
      t.integer "status", default: 0
      t.text "caption"
      t.timestamps
    end
  end
end
