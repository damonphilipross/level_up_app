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
    if @participant.save
      redirect_challenge_participants_path
    else
      render 'new'
    end
  end

  def upvote
    ahoy.track "upvote", {language: "Ruby"}
    @participant = Participant.find(params[:button])
    @participant.total_points += 1
    if @participant.save
      @participants = Participant.where(challenge_id: params[:challenge_id]).order(total_points: :desc)
      respond_to do |format|
        format.html { redirect_to challenge_participants }
        format.js
      end
    end

  end
end
