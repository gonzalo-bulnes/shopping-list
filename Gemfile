source 'https://rubygems.org'

gem 'rails', '3.2.8'

gem 'haml-rails'
gem 'pg'

gem 'rails-boilerplate'
gem 'simple_form'


group :test do
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'

  # to render screenshots from capybara-webkit (requires ImageMagick)
  gem 'mini_magick'
  # test associations with rspec
  gem 'shoulda'
end

group :test, :development do
  gem "capybara"
  gem "capybara-webkit"
  gem "factory_girl_rails", "~> 4.0"
  gem "rspec-rails", "~> 2.0"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'

  gem 'bootstrap-sass'
  gem 'font-awesome-sass-rails'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'
