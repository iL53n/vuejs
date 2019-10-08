class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :title, null: false
      t.string :form_of_owership, null: false
      t.integer :tax_number, null: false, limit: 8
      t.integer :reg_number, null: false, limit: 8

      t.timestamps
    end
  end
end