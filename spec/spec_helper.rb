# frozen_string_literal: true

require 'simplecov'
SimpleCov.start 'rails' do
  add_group 'Contracts', 'app/contracts'
  add_group 'Interactors', 'app/interactors'
  add_group 'Presenters', 'app/presenters'
  add_group 'Queries', 'app/queries'
  add_group 'Serializers', 'app/serializers'
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
