class CreateEquipments < ActiveRecord::Migration[5.2]
  def change
    create_table :equipments do |t|
      t.string :title, null: false
      t.string :kind, null: false
      t.integer :serial_number, null: false
      t.references :organization

      t.timestamps
    end
  end
end
