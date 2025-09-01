class CreateParkFacilities < ActiveRecord::Migration[6.1]
  def change
    create_table :park_facilities do |t|
      t.references :park, null: false, foreign_key: true
      t.references :facility, null: false, foreign_key: true

      t.timestamps
    end
    add_index :park_facilities, [:park_id, :facility_id], unique: true
  end
end
