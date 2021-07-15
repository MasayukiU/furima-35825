Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
    collection do
      get 'search'
      get 'item_search'
    end
    # member do
    # end
  end
end
