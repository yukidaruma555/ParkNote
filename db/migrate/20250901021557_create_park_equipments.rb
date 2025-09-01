class CreateParkEquipments < ActiveRecord::Migration[6.1]
  def change
    create_table :park_equipments do |t|
      t.references :park, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true

      t.timestamps
    end
    add_index :park_equipments, [:park_id, :equipment_id], unique: true
  end
end
