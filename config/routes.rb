Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :hello, only: %i[index]
      post '/auth', to: 'authentications#create'
    end
  end
end
