require 'net/http'
require 'json'

module DatabaseCleaner
  module RemoteApi
    class Request

      def clean
        JSON.parse(Net::HTTP.get_response(clean_uri).body)
      end

    private

      def clean_uri
        URI("#{configuration.server_url}#{configuration.server_mount_path}/clean")
      end

      def configuration
        DatabaseCleaner::RemoteApi.configuration
      end

    end
  end
end
