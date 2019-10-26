class ClientSerializer < ActiveModel::Serializer
  attributes :id, :email, :fullname, :phone, :organization_ids, :organizations
  has_many :organizations
end
