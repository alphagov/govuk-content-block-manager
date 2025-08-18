source "https://rubygems.org"

gem "bootsnap", require: false
gem "gds-api-adapters"
gem "gds-sso"
gem "govuk_app_config"
gem "govuk_publishing_components"
gem "jbuilder"
gem "pg", "~> 1.1"
gem "plek"
gem "puma", ">= 5.0"
gem "rails", "~> 8.0.2", ">= 8.0.2.1"
gem "thruster", require: false
gem "tzinfo-data", platforms: %i[windows jruby]

group :development, :test do
  gem "brakeman", require: false
  gem "byebug"
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "erb_lint"
  gem "govuk_test"
  gem "rspec-rails"
  gem "rubocop-govuk"
end

group :test do
  gem "simplecov"
end

group :development do
  gem "web-console"
end
