class ChallengesController < ApplicationController

  before_action :set_challenge, only: [:show, :edit, :update, :destroy]

  def new
    @challenge = Challenge.new
  end

  def show
    @participants = Participant.where(challenge_id: params[:challenge_id]).order(total_points: :desc)
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = current_user
    @challenge.avatar_photo = current_user.photo
    if @challenge.save
      redirect_to new_challenge_daily_goal_path(@challenge)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def challenge_params
    params.require(:challenge).permit(
      :title,
      :user_id,
      :detail,
      :start_date,
      :duration_days,
      :price_cents,
      :photo_url,
      :photo,
      :description
    )
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
