require 'database_cleaner'
require 'database_cleaner/remote_api/engine'
require 'database_cleaner/remote_api/configuration'
require 'database_cleaner/remote_api/request'

module DatabaseCleaner
  module RemoteApi

    def self.configure
      yield configuration if block_given?
    end

    def self.configuration
      @configuration ||= DatabaseCleaner::RemoteApi::Configuration.new
    end

    def self.reset_configuration
      @configuration = nil
    end

    def self.clean
      DatabaseCleaner::RemoteApi::Request.new.clean
    end

  end
end
