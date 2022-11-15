# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    uuid { Faker::Internet.uuid }
    customer_email { Faker::Internet.email }
    customer_phone { Faker::PhoneNumber.cell_phone }
    amount { rand(10...1000) }
    association :merchant, factory: [:user, :merchant]
  end
end
