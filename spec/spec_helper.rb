require 'simplecov'
SimpleCov.start

require 'capybara/rspec'
require 'webmock/rspec'
require 'vcr'
WebMock.allow_net_connect!(:net_http_connect_on_start => true)

VCR.configure do |config|
 config.cassette_library_dir = "spec/vcr_cassettes"
 config.hook_into :webmock
end

RSpec.configure do |config|
  config.backtrace_exclusion_patterns << /\.rvm\/gems/

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
