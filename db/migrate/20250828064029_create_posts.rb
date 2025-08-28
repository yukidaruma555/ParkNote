class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|  
      t.integer :user_id, null: false
      t.integer :park_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.integer :rating, null: false
      t.date :visit_day, null:false
      t.timestamps
    end
  end
end
