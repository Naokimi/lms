Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :learning_playlists, only: :index
      resources :users, only: :create do
        member do
          patch :login
          patch :admin
        end
      end
    end
  end
end
