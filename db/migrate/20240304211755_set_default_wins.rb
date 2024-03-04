class SetDefaultWins < ActiveRecord::Migration[6.1]
  def change
    change_column :stats, :mvp_wins, :integer, :default => 0
  end
end
