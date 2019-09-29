class ClientSerializer < ActiveModel::Serializer
  attributes :id, :email, :fullname, :phone
end
