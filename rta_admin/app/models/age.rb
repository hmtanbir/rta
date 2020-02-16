# frozen_string_literal: true

# Age model
class Age < ApplicationRecord
  validates :range, presence: true, uniqueness: true
  has_many :profiles, dependent: :destroy
end
