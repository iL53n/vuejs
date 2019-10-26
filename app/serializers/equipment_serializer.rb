class EquipmentSerializer < ActiveModel::Serializer
  attributes :id, :title, :kind, :serial_number, :organization_id, :organization
  belongs_to :organization
end
