FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { Faker::Internet.password }
    trait :admin do
      type { 'Admin' }
    end
    trait :merchant do
      type { 'Merchant' }
    end
  end
end
