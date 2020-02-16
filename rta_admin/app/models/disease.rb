# frozen_string_literal: true

# Disease model
class Disease < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :profiles, dependent: :destroy
end
