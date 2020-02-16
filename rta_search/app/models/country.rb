# frozen_string_literal: true

# Country Model
class Country < ApplicationRecord
  validates :name, :code, presence: true, uniqueness: true
  has_many :profiles, dependent: :destroy
end
