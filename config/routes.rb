Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :training_logs
      end
      
      get 'login', to: 'sessions#new'
      post 'login', to: 'sessions#create'
      delete 'login', to: 'sessions#destroy'
    end
  end
end
