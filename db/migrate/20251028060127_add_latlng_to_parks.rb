class AddLatlngToParks < ActiveRecord::Migration[6.1]
  def change
    add_column :parks, :latitude, :float, null: false, default: 0
    add_column :parks, :longitude, :float, null: false, default: 0
  end
end
