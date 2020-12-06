class AddColumnRoleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :integer, null: false, default: 2
    remove_column :users, :admin, :boolean
  end
end
