class DailyGoalsController < ApplicationController

  def new
    @challenge = Challenge.find(params[:challenge_id])
  end

  def create

  end
end
