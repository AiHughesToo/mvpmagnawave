class AddWinnersToMvpwin < ActiveRecord::Migration[6.1]
  def change
    add_column :mvpwins, :winner_ids, :integer, array: true, default: []
  end
end
