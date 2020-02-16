# frozen_string_literal: true

# spec/factories/users
FactoryBot.define do
  factory :profile do
    name { FFaker::Name.name }
    gender { 0 }
    profile_type { 0 }
    association :user
    association :year
    association :month
    association :age
    association :country
    association :disease
  end
end
