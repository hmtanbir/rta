# frozen_string_literal: true

# Profile Datum spec
require 'rails_helper'

RSpec.describe ProfileDatum, type: :model do
  describe '.readonly?' do
    let(:profile_datum) { FactoryBot.create :profile_datum }
    it 'returns true' do
      expect(profile_datum.readonly?).to eq(true)
    end
  end
end
