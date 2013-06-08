module DatabaseCleaner
  module RemoteApi
    class Engine < ::Rails::Engine
      isolate_namespace DatabaseCleaner::RemoteApi
    end
  end
end
