# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  acts_as_paranoid
  enum status: %i[active suspended deleted]
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  has_one :profile, dependent: :destroy
end
