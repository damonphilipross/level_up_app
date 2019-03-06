class ParticipantsController < ApplicationController
  def index
    @participants = Participants.where(challenge_id: params[:challenge_id])
  end

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new
    @participant.challenge = Challenge.find(params[:challenge_id])
    @participant.user = current_user
    if @participant.save
      redirect_challenge_participants_path
    else
      render 'new'
    end
  end
end
