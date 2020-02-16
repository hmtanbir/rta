# frozen_string_literal: true

# Profile spec
require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :year }
  it { is_expected.to belong_to :month }
  it { is_expected.to belong_to :country }
  it { is_expected.to belong_to :disease }
  it { is_expected.to belong_to :age }

  it { is_expected.to define_enum_for(:gender).with_values(%i[male female]) }
  it { is_expected.to define_enum_for(:profile_type).with_values(%i[patient carer]) }

  subject { FactoryBot.create(:profile) }
  it { is_expected.to validate_presence_of :user }
  it { is_expected.to validate_uniqueness_of(:user) }
end
