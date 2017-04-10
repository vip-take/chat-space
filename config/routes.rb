Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'groups#index'
  resources :groups, only: [:index, :new, :create, :edit, :update] do
    member do
      resources :messages, only: [:index, :create]
    end
  end
  resources :users, only: [] do
    collection do
      get 'search', formart: 'json'
    end
  end

end
