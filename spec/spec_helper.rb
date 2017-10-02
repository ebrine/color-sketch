require 'rubygems'

ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rack/test'
require 'database_cleaner'

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) { DatabaseCleaner.start }
  config.after(:each)  { DatabaseCleaner.clean }
end

def app
  Sinatra::Application
end
