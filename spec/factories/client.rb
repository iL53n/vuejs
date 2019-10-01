FactoryBot.define do
  factory :client do
    fullname {'Ivan Ivanov'}
    phone {'1234567890'}
    email { 'client@mail.com' }
    password { '12345678' }
  end
end