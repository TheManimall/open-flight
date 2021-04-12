Rails.application.routes.draw do
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      get '/airlines/by_country', to: 'airlines#by_country'
      resources :airlines, param: :slug
      get '/airlines/search/:query', to: 'airlines#search'
      resources :reviews, only: [:create, :destroy]
    end
  end

  get '*path', to: 'pages#index', via: :all
end

# namespace :api do
#   namespace :v1 do
#     resources :airlines do
#       collection do
#         get :search
#       end
#     end
#     resources :reviews, only: [:create, :destroy]
#   end
# end


