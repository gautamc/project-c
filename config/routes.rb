Rails.application.routes.draw do

  root to: 'api/feeds#index'

  namespace :api do

    resources :feeds, only: [:index, :show]

    resources :users do
      collection do
        post :login
        delete :logout
      end
    end

    resources :notes

  end

end
