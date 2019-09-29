class AddFullnameAndPhoneToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :fullname, :string
    add_column :clients, :phone, :string
  end
end
