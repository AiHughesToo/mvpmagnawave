class AddImageLinkToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :image_link, :string
  end
end
