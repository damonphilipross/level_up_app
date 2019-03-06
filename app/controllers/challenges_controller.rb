class ChallengesController < ApplicationController
  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user_id = current_user.id
    @challenge.save
    redirect_to root_path
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
      :photo_url
    )
  end
end
