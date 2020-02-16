# frozen_string_literal: true

# Year model spec
require 'rails_helper'

RSpec.describe Year, type: :model do
  it { is_expected.to validate_presence_of :year }
  it { is_expected.to validate_uniqueness_of(:year) }
  it { is_expected.to have_many :profiles }
end
