FactoryBot.define do
  factory :client do
    email
    password { '12345678' }
  end
end