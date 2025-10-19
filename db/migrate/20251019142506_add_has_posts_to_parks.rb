class AddHasPostsToParks < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :posts, :parks, on_delete: :restrict
    add_index :posts, :park_id
  end
end
