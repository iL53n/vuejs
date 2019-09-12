FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :staff do
    email
    password { '12345678' }
  end
end