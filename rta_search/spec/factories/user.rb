# frozen_string_literal: true

# spec/factories/users
FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    email { 'x@y.com' }
    status { 0 }
  end
end
