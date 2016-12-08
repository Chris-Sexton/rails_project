class AddRoleToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :role, :string, default: 0
    add_column :users, :role, :integer, default: 0
  end
end