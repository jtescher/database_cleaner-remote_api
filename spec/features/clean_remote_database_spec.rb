require 'spec_helper'

feature 'Clean remote database' do
  scenario 'create request to clear database' do
    config = DatabaseCleaner::RemoteApi.configuration
    uri = URI("#{config.server_url}#{config.server_mount_path}/clean")
    Net::HTTP.should_receive(:get_response).with(uri).and_return(stub(:response, body: '{}'))
    DatabaseCleaner::RemoteApi.clean
  end
end
