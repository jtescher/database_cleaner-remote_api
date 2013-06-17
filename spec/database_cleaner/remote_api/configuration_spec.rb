require 'spec_helper'

describe DatabaseCleaner::RemoteApi::Configuration do
  after(:each) { DatabaseCleaner::RemoteApi.reset_configuration }

  describe '#server_url=' do
    it 'removes trailing slashes' do
      DatabaseCleaner::RemoteApi.configure { |config| config.server_url = 'http://localhost:1234/' }
      DatabaseCleaner::RemoteApi.configuration.server_url.should == 'http://localhost:1234'
    end
  end

  describe '#server_mount_path=' do
    it 'adds leading slash if absent' do
      DatabaseCleaner::RemoteApi.configure { |config| config.server_mount_path = 'models' }
      DatabaseCleaner::RemoteApi.configuration.server_mount_path.should == '/models'
    end

    it 'removes trailing slash if present' do
      DatabaseCleaner::RemoteApi.configure { |config| config.server_mount_path = '/models/' }
      DatabaseCleaner::RemoteApi.configuration.server_mount_path.should == '/models'
    end
  end
end
