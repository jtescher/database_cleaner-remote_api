DatabaseCleaner::RemoteApi::Engine.routes.draw do
  match 'clean' => 'database_cleans#show', via: [:get, :post], defaults: { format: :json }
end
