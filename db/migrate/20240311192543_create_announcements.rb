class CreateAnnouncements < ActiveRecord::Migration[6.1]
  def change
    create_table :announcements do |t|
      t.string :part_one
      t.string :part_two
      t.string :part_three
      t.string :wfl
      t.string :bdays
      t.string :anniversarys

      t.timestamps
    end
  end
end
