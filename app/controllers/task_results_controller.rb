class TaskResultsController < ApplicationController
  def index
    @challenge = Challenge.find(params[:challenge_id])
    @participant = Participant.where(user_id: current_user.id)
    @task_results = TaskResult.where(participant_id: @participant)
    @daily_goal = DailyGoal.where(challenge_id: @challenge)
    @daily_goals_tasks = DailyGoalTask.where(daily_goal_id: @daily_goal)
  end

  def complete
    @participant = Participant.where(user_id: current_user.id)
    @task_result = TaskResult.find(params[:button])
    @task_result.complete = true
    if @task_result.save
      redirect_to challenge_task_results_path
      flash[:notice] = "Post successfully created"
    end
  end

  # def check_task
  #   tester = true
  #   participant = Participant.where(user_id: current_user.id)
  #   @participants = TaskResult.where(participant_id: participant)
  #   @participants.each do |x|
  #     tester = false if x.user_id == current_user.id
  #   end
  #   return tester
  # end
  # helper_method :check_task
end
