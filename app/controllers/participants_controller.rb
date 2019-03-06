class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :update, :destory]

  def new
    @participant = Participant.new
  end

  def create
    new_session = Participant.new
    new_session.challenge = Challenge.find(params[:challenge_id])
    new_session.user = current_user
    new_session.save
    redirect_to users_profile_path
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
