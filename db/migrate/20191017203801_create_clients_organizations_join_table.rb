class CreateClientsOrganizationsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :clients_organizations do |t|
      t.references :client, foreign_key: true, null: false
      t.references :organization, foreign_key: true, null: false

      t.timestamps
    end

    add_index :clients_organizations, %i[client_id organization_id], unique: true
  end
end
