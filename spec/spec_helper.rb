require 'simplecov'
SimpleCov.start

Dir[File.expand_path(File.dirname(__FILE__) + "../../lib/**/*.rb")].each(&method(:require))
Dir[File.expand_path(File.dirname(__FILE__) + "/fixtures/**/*.rb")].each(&method(:require))

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
