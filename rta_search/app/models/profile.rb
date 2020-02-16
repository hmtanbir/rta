# frozen_string_literal: true

# Profile
class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :year
  belongs_to :month
  belongs_to :country
  belongs_to :disease
  belongs_to :age

  validates :user, uniqueness: true, presence: true

  enum profile_type: %i[patient carer]
  enum gender: %i[male female]
end
