class ParticipantsController < ApplicationController
  def index
    @challenge = Challenge.find(params[:challenge_id])
    @participants = Participant.where(challenge_id: params[:challenge_id]).order(total_points: :desc)
  end

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new
    @participant.challenge = Challenge.find(params[:challenge_id])
    @task_result = TaskResult.new
    @participant.challenge.daily_goals.each do |goal|
      goal.daily_goal_tasks.each do |task|
        @task_result.daily_goal_task = task
        @task_result.participant = @participant
        @task_result.complete = false
      end
    end
    @participant.user = current_user
    if @participant.save
      redirect_to challenge_participants_path
    else
      render 'new'
    end
  end

  def upvote
    ahoy.track "upvote", {language: "Ruby"}
    @participant = Participant.find(params[:button])
    @participant.total_points += 1
    @participant.liked_by current_user
    if @participant.save
      @participants = Participant.where(challenge_id: params[:challenge_id]).order(total_points: :desc)
      respond_to do |format|
        format.html { redirect_to challenge_participants }
        format.js
      end
    end
  end
end
