class DailyGoalsController < ApplicationController
  before_action :set_challenge
  def new
    @challenge = Challenge.find(params[:challenge_id])
  end

  def create
    goals_hash = daily_goal_params.to_h
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

    raise
    # params.each do |key, value|
    #   value.each do |k, v|
    #     @daily_goal_task = DailyGoalTask.new(v)
    #     @daily_goal_task.save!
    #   end
    # end
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

  def daily_goal_params
    params.require(:daily_goals).permit!
  end
end
