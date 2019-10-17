class CreateClientsOrganizationsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :clients, :organizations do |t|
      t.index :client_id
      t.index :organization_id
    end
  end
end
