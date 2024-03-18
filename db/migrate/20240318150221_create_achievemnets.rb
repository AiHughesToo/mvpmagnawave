class CreateAchievemnets < ActiveRecord::Migration[6.1]
  def change
    create_table :achievemnets do |t|
      t.string :title
      t.string :description
      t.string :image_link

      t.timestamps
    end
  end
end
