FactoryBot.define do
  sequence :email do |n|
    "client#{n}@test.com"
  end

  factory :client do
    fullname {'Ivan Ivanov'}
    phone {'1234567890'}
    email
    password { '12345678' }
  end
end