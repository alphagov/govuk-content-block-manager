source "https://rubygems.org"

gem "babosa"
gem "bootsnap", require: false
gem "content_block_tools"
gem "dartsass-rails"
gem "friendly_id"
gem "gds-api-adapters"
gem "gds-sso"
gem "govuk_app_config"
gem "govuk_frontend_toolkit"
gem "govuk_publishing_components"
gem "jbuilder"
gem "kaminari"
gem "pg", "~> 1.1"
gem "plek"
gem "puma", ">= 5.0"
gem "rails", "~> 8.0.2", ">= 8.0.2.1"
gem "record_tag_helper", require: false
gem "sprockets-rails"
gem "thruster", require: false
gem "transitions", require: ["transitions", "active_record/transitions"]
gem "tzinfo-data", platforms: %i[windows jruby]
gem "view_component"

group :development, :test do
  gem "brakeman", require: false
  gem "byebug"
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "erb_lint"
  gem "govuk_test"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails"
  gem "rubocop-govuk"
end

group :test do
  gem "database_cleaner-active_record"
  gem "factory_bot"
  gem "minitest"
  gem "minitest-fail-fast"
  gem "minitest-stub-const"
  gem "mocha"
  gem "simplecov"
  gem "webmock", require: false
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
end

group :cucumber, :test do
  gem "capybara"
  gem "capybara-playwright-driver"
  gem "cucumber"
  gem "cucumber-rails", require: false
  gem "launchy"
end
