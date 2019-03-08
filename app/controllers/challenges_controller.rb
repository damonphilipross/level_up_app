class ChallengesController < ApplicationController
  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = current_user
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
end
