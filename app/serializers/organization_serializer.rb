class OrganizationSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :title, :form_of_owership, :tax_number, :reg_number, :client_ids, :clients
  has_many :clients
  has_many :equipments
end
