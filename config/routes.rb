Rails.application.routes.draw do

  root to: 'api/feeds#index'

  namespace :api do
    resources :feeds, only: [:index, :show]
    resources :users, only: [:index, :show, :create, :update]
    resources :notes
  end

end
