# DatabaseCleaner::RemoteApi

Simply creates an HTTP API for cleaning your database to be used by client tests.

Tested against ruby-head, ruby 2.0.0, ruby 1.9.3,  jruby-19mode, jruby-head, and rbx-19mode

[![Build Status](https://travis-ci.org/jtescher/database_cleaner-remote_api.png?branch=master)]
(https://travis-ci.org/jtescher/database_cleaner-remote_api)
[![Code Climate](https://codeclimate.com/github/jtescher/database_cleaner-remote_api.png)]
(https://codeclimate.com/github/jtescher/database_cleaner-remote_api)
[![Dependency Status](https://gemnasium.com/jtescher/database_cleaner-remote_api.png)]
(https://gemnasium.com/jtescher/database_cleaner-remote_api)
[![Coverage Status](https://coveralls.io/repos/jtescher/database_cleaner-remote_api/badge.png)]
(https://coveralls.io/r/jtescher/database_cleaner-remote_api)


##Installation

Add this line to your application's Gemfile:

```ruby
gem 'database_cleaner-remote_api', '~> 0.0.1'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install database_cleaner-remote_api
```

Then mount as an engine in your config/routes.rb file.
```ruby
Rails.application.routes.draw do
  ...
  mount DatabaseCleaner::RemoteApi::Engine => '/database_cleaner' if Rails.env.test?
  ...
end
```


## Usage

First install [DatabaseCleaner](https://github.com/bmabey/database_cleaner).

To use with a client application, start rails in the `test` environment (or whichever environment mounted the engine).
```bash
$ rails server -e test
```

Then you can clean the database remotely via `/mount_path/clean`

### Example

Given a user in the database:
```ruby
User.count #=> 1
```

When you clean the database via any client:
```bash
$ curl http://localhost:3000/database_cleaner/clean
```

Then the users have been removed:
```ruby
User.count #=> 0
```

## Usage (As Client)

DatabaseCleaner::RemoteApi can also be used between rails servers by the client rails app.
First install the gem (You don't have to mount the engine in routes.rb)

Then configure the server URL (if different than localhost:3000/database_cleaner) in
`spec/support/database_cleaner-remote_api.rb`

```ruby
require 'database_cleaner/remote_api'
DatabaseCleaner::RemoteApi.configure do |config|
  config.server_url = 'http://localhost:3001'  # Default: http://localhost:3000
  config.server_mount_path = '/db_cleaner'     # Default: /database_cleaner
end
```

Then you can wipe the remote server's database after each test has been run:

```ruby
RSpec.configure do |config|
  config.after(:each) do
    DatabaseCleaner::RemoteApi.clean
  end
end
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
