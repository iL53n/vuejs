class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :title, null: false
      t.string :type, null: false
      t.integer :tax_number, null: false
      t.integer :reg_number, null: false

      t.timestamps
    end
  end
end