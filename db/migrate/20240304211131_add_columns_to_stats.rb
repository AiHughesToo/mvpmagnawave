class AddColumnsToStats < ActiveRecord::Migration[6.1]
  def change
    
    add_column :stats, :so_sent, :integer, :default => 0
    add_column :stats, :so_received, :integer, :default => 0
    change_column :stats, :noms_received, :integer, :default => 0
    change_column :stats, :noms_sent, :integer, :default => 0
  end
end
