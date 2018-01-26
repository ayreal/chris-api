Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :lists
      resources :items
      # post '/signup', to: 'users#create'
      # post '/login', to: 'auth#create'
      # post '/current_user', to: 'auth#show'
    end
  end
end
