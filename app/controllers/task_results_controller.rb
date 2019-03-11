class TaskResultsController < ApplicationController
  def index
    @challenge = Challenge.find(params[:challenge_id])
    @daily_goal = DailyGoal.where(challenge_id: @challenge)
    @daily_goals_tasks = DailyGoalTask.where(daily_goal_id: @daily_goal)
    @participant = Participant.where(user_id: current_user.id)
  end
end
