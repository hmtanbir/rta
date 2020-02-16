# frozen_string_literal: true

# User sped
require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to define_enum_for(:status).with_values(%i[active suspended deleted]) }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to have_one :profile }
end
