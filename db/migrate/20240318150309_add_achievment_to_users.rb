class AddAchievmentToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :mvp_sent, :boolean, default: false
    add_column :users, :achievements, :integer, array: true, default: []
  end
end
