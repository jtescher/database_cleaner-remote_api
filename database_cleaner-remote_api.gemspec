$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'database_cleaner/remote_api/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'database_cleaner-remote_api'
  s.version     = DatabaseCleaner::RemoteApi::VERSION
  s.authors     = ['Julian Tescher']
  s.email       = ['jatescher@gmail.com']
  s.homepage    = 'https://github.com/jtescher/database_cleaner-remote_api'
  s.summary     = 'An API for database_cleaner remote wipes'
  s.description = 'Simply creates an HTTP API for cleaning your database to be used by client tests.'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 3.2.13'

  s.add_dependency 'database_cleaner', '~> 1.0.1'

  if defined?(JRUBY_VERSION)
    s.add_development_dependency 'activerecord-jdbcsqlite3-adapter', '~> 1.2.9'
  else
    s.add_development_dependency 'sqlite3', '~> 1.3.7'
  end
  s.add_development_dependency 'rspec-rails', '~> 2.13.2'
  s.add_development_dependency 'capybara', '~> 2.1.0'
  s.add_development_dependency 'simplecov', '~> 0.7.1'
end
