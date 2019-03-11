Rails.application.routes.draw do

  get 'task_results/index'
  get 'daily_goal_tasks/index'
  get 'daily_goal_task/index'
  devise_for :users
  root to: 'pages#home'
  resources :challenges, only: [ :create, :edit, :index, :new ] do
    resources :participants, only: [ :create, :show, :index, :new ]
    post 'participants/upvote', to: 'participants#upvote', as: :upvotr
    # after creating a challenge we redirect to the index of the daily goals
    # Here we can select the a daily goal, go the the show page and add daily goal tasks
    resources :daily_goals, only: [ :index, :new, :create, :show ]
    resources :task_results, only: [ :index, :edit, :update ]
  end
  resources :daily_goals, only: [ :show ] do
    resources :daily_goals_tasks, only: [ :edit, :update, :destroy, :new, :create, :index ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
