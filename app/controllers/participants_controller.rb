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
    @participant.user = current_user
    @participant.challenge.daily_goals.each do |goal|
      goal.daily_goal_tasks.each do |task|
        @task_result = TaskResult.new
        @task_result.daily_goal_task = task
        @task_result.participant = @participant
        @task_result.complete = false
        @task_result.save!
      end
    end
    if @participant.save
      redirect_to challenge_participants_path
    else
      flash[:notice] = "You can't do that"
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

  def check_user
    tester = true
    @participants = Participant.where(challenge_id: params[:challenge_id])
    @participants.each do |x|
      tester = false if x.user_id == current_user.id
    end
    return tester
  end
  helper_method :check_user
end
