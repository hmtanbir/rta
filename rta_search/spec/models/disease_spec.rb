# frozen_string_literal: true

# Disease Model
require 'rails_helper'

RSpec.describe Disease, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to have_many :profiles }
end
