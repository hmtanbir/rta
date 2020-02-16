# frozen_string_literal: true

# helper file for RSpec

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'capybara/rspec'
require 'support/factory_bot'
require 'simplecov'
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
SimpleCov.start 'rails' do
# exclude coverage
  add_filter 'app/models/application_record.rb'
  add_filter 'app/models/user.rb'
  add_filter 'app/channels'
  add_filter 'app/helpers'
  add_filter 'app/mailers'
  add_filter 'app/jobs'
end
ActiveRecord::Migration.maintain_test_schema!
# rubocop:disable MethodLength
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.before(:all) do
    FactoryBot.reload
  end
end
