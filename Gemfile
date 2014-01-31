source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc2'

gem 'pg'                                             # Use postgresql as the database for Active Record
gem 'sass-rails', '~> 4.0.0.rc2'                     # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'                           # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0'                       # Use CoffeeScript for .js.coffee assets and views
gem 'jquery-rails'                                   # Use jquery as the JavaScript library
gem 'jbuilder', '~> 1.2'                             # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'haml'                                           # Clean markup
gem 'activeadmin', github: 'gregbell/active_admin'   # Console for plebes
gem 'tzinfo'                                         # For handling timezones and daylight savings conversions
gem 'active_attr'                                    # What ActiveModel left out
gem 'font-awesome-rails'                             # For using "Font Awesome" icon fonts
gem 'mandrill-api'                                   # For sending mail

group :development, :test do
	gem 'rspec-rails', '~> 2.0'
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
end

group :doc do
  gem 'sdoc', require: false                         # bundle exec rake doc:rails generates the API under doc/api.
end

group :production do
  gem 'rails_12factor'
end

# gem 'bcrypt-ruby', '~> 3.0.0'					# Use ActiveModel has_secure_password
# gem 'unicorn'									# Use unicorn as the app server
# gem 'capistrano', group: :development			# Use Capistrano for deployment
# gem 'debugger', group: [:development, :test]	# Use debugger
