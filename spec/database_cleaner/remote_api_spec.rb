require 'spec_helper'

describe DatabaseCleaner::RemoteApi do
  describe '.configuration' do
    it 'accepts a server_url option' do
      expect {
        DatabaseCleaner::RemoteApi.configure { |config| config.server_url = 'http://localhost:3001' }
      }.to change {
        DatabaseCleaner::RemoteApi.configuration.server_url
      }.from('http://localhost:3000').to('http://localhost:3001')
    end

    it 'accepts a server_mount_path option' do
      expect {
        DatabaseCleaner::RemoteApi.configure { |config| config.server_mount_path = '/models' }
      }.to change {
        DatabaseCleaner::RemoteApi.configuration.server_mount_path
      }.from('/factories').to('/models')
    end
  end
end
