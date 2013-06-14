Rails.application.routes.draw do
  mount DatabaseCleaner::RemoteApi::Engine => '/database_cleaner'
end
