class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :title, :form_of_owership, :tax_number, :reg_number
end
