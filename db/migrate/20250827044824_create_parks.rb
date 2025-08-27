class CreateParks < ActiveRecord::Migration[6.1]
  def change
    create_table :parks do |t|
      
      t.integer :user_id, null: false
      t.string :park_name, null: false
      t.text :introduction, null: false
      t.string :postal_code, null: false
      t.string :address, null:false
      t.timestamps
    end

    add_index :parks, :park_name
  end
end
