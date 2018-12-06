Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/login', to: 'users#login'
      get '/query', to: 'sports#query'
      resources :users, only: [ :create, :show, :update ]
      resources :messages, only: [ :update]
      resources :replies, only: [ :update]
      resources :sports, only: [:index, :show, :create, :update, :destroy ] do
        resources :bookings, only: [:create, :destroy]
        resources :messages, only: [:create]
      end
      resources :messages, only: [] do
        resources :replies, only: [:create]
      end

      # get '/tagged', to: "events#tagged", as: :tagged
    end
  end

  root to: 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
