class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|  
      t.integer :user_id
      t.integer :park_id
      t.string :title
      t.text :body
      t.integer :rating
      t.date :visit_day
      t.timestamps
    end
  end
end
