require 'cucumber/rails'
require 'database_cleaner'
require 'database_cleaner/cucumber'
require_relative './request_helper'

# Include factory_bot methods
World(FactoryBot::Syntax::Methods)

Capybara.javascript_driver = :selenium

# Configure the Chrome driver
Capybara.register_driver :selenium do |app|

  # chrome headless
  args = %w[window-size=1440,900 headless disable-gpu]
  caps = Selenium::WebDriver::Remote::Capabilities.chrome(
    'chromeOptions' => {
      'args' => args
    }
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: caps)
end

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :truncation
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Around do |scenario, block|
  DatabaseCleaner.cleaning(&block)
end
