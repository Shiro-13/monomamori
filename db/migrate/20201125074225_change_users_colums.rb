class ChangeUsersColums < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :last_name, :string
    remove_column :users, :first_name, :string
    add_column :users, :name, :string
    add_column :users, :role, :integer, null: false, default: 2
  end
end
