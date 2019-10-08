FactoryBot.define do
  sequence :tax_number do |n|
    "12345678#{n}"
  end

  sequence :reg_number do |n|
    "123456789012#{n}"
  end

  sequence :title do |n|
    "Organization_#{n}"
  end

  factory :organization do
    tax_number
    reg_number
    title
    type { 'ЗАО' }
  end
end
