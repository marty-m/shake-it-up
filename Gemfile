source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem "rails", "~> 7.0.0.rc1"

gem 'httparty', '~> 0.20.0'

gem "sprockets-rails", ">= 3.4.1"


gem "puma", "~> 5.0"

gem "importmap-rails", ">= 0.9.2"

gem "turbo-rails", ">= 0.9.0"

gem "stimulus-rails", ">= 0.7.3"

gem "jbuilder", "~> 2.11"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", ">= 1.4.4", require: false



group :development, :test do
  # See https://edgeguides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", ">= 1.0.0", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console", ">= 4.1.0"

  gem "sqlite3", "~> 1.4"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler", ">= 2.3.3"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :production do
  gem 'pg', '~> 1.2', '>= 1.2.3'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver", ">= 4.0.0"
  gem "webdrivers"

end
