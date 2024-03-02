class CreateNominations < ActiveRecord::Migration[6.1]
  def change
    create_table :nominations do |t|
      t.string :nom_type
      t.integer :sender_id
      t.string :sender_name
      t.integer :user_id
      t.string :receiver_name
      t.string :receiver_img_link
      t.string :nom_body

      t.timestamps
    end
  end
end
