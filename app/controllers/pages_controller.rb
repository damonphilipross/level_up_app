class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
    @user = current_user

  end

  def add_picture
    @user = current_user
    @user.update(profile_params)
    redirect_to pages_profile_path
  end

  def create
  end

  private

  def profile_params
    params.require(:user).permit(:photo, :handle)
  end

end
