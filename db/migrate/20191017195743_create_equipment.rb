class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string :title, null: false
      t.string :kind, null: false
      t.integer :serial_number, null: false

      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
