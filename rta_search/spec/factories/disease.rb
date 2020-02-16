# frozen_string_literal: true

# spec/factories/disease
FactoryBot.define do
  factory :disease do
    name { FFaker::Name.name }
  end
end
