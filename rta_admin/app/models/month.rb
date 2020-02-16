# frozen_string_literal: true

# Month Model
class Month < ApplicationRecord
  validates :name, :code, presence: true, uniqueness: true
  has_many :profiles, dependent: :destroy
end
