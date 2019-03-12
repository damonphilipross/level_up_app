
Rails.application.routes.draw do

 devise_for :users
 root to: 'pages#home'
 resources :challenges, only: [ :create, :edit, :index, :new ] do
   resources :participants, only: [ :create, :show, :index, :new ]
   post 'participants/upvote', to: 'participants#upvote', as: :upvotr
   # after creating a challenge we redirect to the index of the daily goals
   # Here we can select the a daily goal, go the the show page and add daily goal tasks
   resources :task_results, only: [ :index, :edit, :update ]
   post 'task_results/complete', to: 'task_results#complete', as: :completr
   resources :daily_goals, only: [ :index, :new, :create, :edit, :update, :destroy ]
 end
 resources :daily_goals, only: [ :show ] do
   resources :daily_goals_tasks, only: [ :edit, :update, :destroy, :new, :create, :index ]
 end
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
