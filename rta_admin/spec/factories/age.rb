# frozen_string_literal: true

# spec/factories
FactoryBot.define do
  factory :age do
    range { '20 - 30' }
  end
end
