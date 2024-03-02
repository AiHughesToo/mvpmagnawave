class AddAdminToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :stat_id, :integer
  end
end
