class CreateStats < ActiveRecord::Migration[6.1]
  def change
    create_table :stats do |t|
      t.integer :user_id
      t.integer :noms_sent
      t.integer :noms_received
      t.integer :mvp_wins

      t.timestamps
    end
  end
end
