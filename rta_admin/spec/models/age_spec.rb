# frozen_string_literal: true

#  range model spec
require 'rails_helper'

RSpec.describe Age, type: :model do
  it { is_expected.to validate_presence_of :range }
  it { is_expected.to validate_uniqueness_of(:range) }
  it { is_expected.to have_many :profiles }
end
