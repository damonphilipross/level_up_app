class DailyGoalsController < ApplicationController
  before_action :set_challenge, only: [:new, :create, :index, :edit, :update]

  def index
    @daily_goals = DailyGoal.where(challenge_id: params[:challenge_id])
  end

  def new
  end

  def create
    goals_hash = daily_goals_params.to_h

    duration = @challenge.duration_days
    # For this challenge
    # Each day should get a daily goal object
    # Each daily goal object should get all the tasks defined in the goals hash

    # Iterate over all the days
    counter = 1
    duration.times do
      # For each day we create a daily_goal
      daily_goal = @challenge.daily_goals.create
      daily_goal.update(day: counter)
      # daily_goal = DailyGoal.new
      # daily_goal.challenge = @challenge
      # We iterate over the goals_hash to get
      goals_hash.each do |key, task|
        # For each day we create tasks as specified by the user.
        # task = DailyGoalTask.new(task)
        daily_goal.daily_goal_tasks.create(task)
      end
      counter += 1
    end
    redirect_to challenge_daily_goals_path(@challenge)
  end

  def edit
    @daily_goal = DailyGoal.find(params[:id])
    @daily_goal_tasks = DailyGoalTask.where(daily_goal_id: @daily_goal)
  end

  def update
    tasks_hash = daily_goal_task_params.to_h

    tasks_hash.each do |_key, value|
      task_to_update = DailyGoalTask.find(value[:id])
      render :edit unless task_to_update.update(
        description: value[:description],
        task_points: value[:task_points]
      )
    end

    redirect_to challenge_daily_goals_path(@challenge)

    # daily_goal_task_id = goals_hash.values[0].values[0][:id].to_i
    # daily_goal_task = DailyGoalTask.find(daily_goal_task_id)
    # daily_goal_task.description = goals_hash.values[0].values[0][:description]
    # daily_goal_task.task_points = goals_hash.values[0].values[0][:task_points]
    # daily_goal_task.save
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

  def daily_goal_task_params
    params.require(:daily_goal).require(:daily_goal_tasks_attributes).permit!
  end

  def daily_goals_params
    params.require(:daily_goals).permit!
  end
end
