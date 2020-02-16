# frozen_string_literal: true

# Year model
class Year < ApplicationRecord
  validates :year, presence: true, uniqueness: true
  has_many :profiles, dependent: :destroy
end
