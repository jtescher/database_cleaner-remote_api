module DatabaseCleaner
  module RemoteApi
    class DatabaseCleansController < DatabaseCleaner::RemoteApi::ApplicationController

      def show
        DatabaseCleaner.clean
        render json: {}
      end

    end
  end
end
