source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.4'
gem 'sass-rails', '~> 4.0.1'
gem 'uglifier', '~> 2.4.0'
gem 'coffee-rails', '~> 4.0.1'
gem 'jquery-rails', '~> 3.0.4'
gem 'turbolinks', '~> 2.1.0'
gem 'jbuilder', '~> 1.5.3'
gem 'bcrypt-ruby', '~> 3.1.2'

group :doc do
  gem 'sdoc', require: false
end

# production gems for heroku
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Paging
gem 'kaminari', '~> 0.15.0'

# Slugs and friendly id's
gem 'friendly_id', '~> 5.0.2'

# font-awesome
gem 'font-awesome-sass', '~> 4.0.2'

# Devise
gem 'devise', '~> 3.2.2'

# i18n
gem 'i18n_generators'

# Unicorn
gem 'unicorn'

# Codeclimate
gem "codeclimate-test-reporter", group: :test, require: nil

# Bootstrap 3
gem 'bootstrap-sass', '~> 3.0.3.0'
group :development, :test do
  gem 'rails_layout', '~> 0.5.11'  # Bootstrap 3 layout generator
end

# development gems
group :development, :test do
  gem 'sqlite3', '~> 1.3.8'    # dev & test database
  gem 'figaro', '~> 0.7.0'     # env variables
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-stack_explorer'

  if RUBY_VERSION >= '2.0.0'
    gem 'pry-byebug'
  else
    # 以下はRuby1.9の時のみ使う(pry-byebugの代わりに)
    # debuggerは1.9以下でしか動作しない, remote は byebug で使えないようになった
    gem 'pry-debugger'
    gem 'pry-remote'
  end

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'hirb'
  gem 'hirb-unicode'

  gem 'tapp'
  gem 'awesome_print'
  gem 'quiet_assets'

  gem 'timecop'
end

# RSpec
group :test, :development do
  gem "rspec-rails", '~> 2.14.1'
  gem "guard-rspec"
  gem "factory_girl_rails"
  gem "spring"
  gem "guard-livereload", require: false
  gem "spring-commands-rspec"
  gem 'database_rewinder'
end

# Yard
group :test, :development do
  gem 'yard', :require => false
  gem 'yard-cucumber', :require => false
  gem 'redcarpet'
  gem 'guard-yard'
  gem 'yard-rails-plugin', :git => 'https://github.com/ogeidix/yard-rails-plugin.git', :tag => 'v0.0.1'
  gem 'guard-ctags-bundler'
end

# Annotation
group :development do
  gem 'annotate', '2.5.0'
end

# Capybara
group :test do
  gem "capybara", '~> 2.2.1'
  gem "launchy"
end

# Cucumber
group :test do
  gem "cucumber-rails", require: false
  gem "database_cleaner"
  gem "guard-cucumber"
end
