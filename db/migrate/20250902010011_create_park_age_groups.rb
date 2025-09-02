class CreateParkAgeGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :park_age_groups do |t|
      t.references :park, null: false, foreign_key: true
      t.references :age_group, null: false, foreign_key: true

      t.timestamps
    end
    add_index :park_age_groups, [:park_id, :age_group_id], unique: true
  end
end
