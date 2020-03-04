source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'

#User Authorezation and Roles
gem 'devise'
gem 'cancancan'
gem 'rolify'

#Administration
gem 'activeadmin', github: 'activeadmin'
gem 'kaminari'

#ActiveAdmin depends
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'ransack',             github: 'activerecord-hackery/ransack'
gem 'draper',              '> 3.x'

#Frontend
gem 'slim'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'font-awesome-sass'

#Images
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'rmagick'
gem 'mini_magick'

#Editors
gem 'ckeditor', github: 'galetahub/ckeditor'

# Database
gem 'mysql2'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'listen', '~> 3.0.5'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do
  gem 'unicorn'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem "rspec-rails"
  gem "factory_girl_rails"
end

group :test do
  gem "faker"
  gem "database_cleaner"
  gem 'shoulda'
  gem 'shoulda-matchers', require: false
  gem 'rails-controller-testing'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
  #gem 'capistrano', '~> 3.6'
  gem "capistrano", :github => "capistrano/capistrano"
  gem 'capistrano3-unicorn'
  gem 'capistrano-rvm'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
