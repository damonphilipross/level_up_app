Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :challenges, only: [ :create, :edit, :index, :new ] do
    resources :participants, only: [ :create, :edit, :show, :index, :new, :update]
    # after creating a challenge we redirect to the index of the daily goals
    # Here we can select the a daily goal, go the the show page and add daily goal tasks
    resources :daily_goal, only: [ :index ]
  end
  resources :daily_goal, only: [ :index ]do
    resources :daily_goals_tasks, only: [ :edit, :show, :update, :destroy ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
