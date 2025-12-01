# frozen_string_literal: true

Dir["spec/support/**/*.rb"].each { |f| require_relative "../#{f}" }
Dir["lib/**/*.rb"].each { |f| require_relative "../#{f}" }

RSpec.configure do |config|
  config.filter_run_excluding slow: true

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.example_status_persistence_file_path = "spec/examples.txt"
  config.filter_run_when_matching :focus

  Kernel.srand config.seed
end
