# frozen_string_literal: true

# Month spec
require 'rails_helper'

RSpec.describe Month, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :code }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_uniqueness_of(:code) }
  it { is_expected.to have_many :profiles }
end
