Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :challenges, only: [ :create, :edit, :show, :index ] do
    resources :participants, only: [ :create, :edit, :show, :index ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
