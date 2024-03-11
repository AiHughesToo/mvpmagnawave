class CreateMvpwins < ActiveRecord::Migration[6.1]
  def change
    create_table :mvpwins do |t|
      t.string :details

      t.timestamps
    end
  end
end
