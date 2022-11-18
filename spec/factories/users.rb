# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { Faker::Internet.password }
    trait :admin do
      initialize_with { Admin.new(attributes) }

      type { 'Admin' }
    end
    trait :merchant do
      initialize_with { Merchant.new(attributes) }

      type { 'Merchant' }
    end
  end
end
