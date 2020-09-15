class AddImageToUsersAndPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :avatar , :string
    add_column :posts, :image , :string
  end
end
