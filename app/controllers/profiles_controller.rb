class ProfilesController < ApplicationController
  before_action :set_user_and_profile, only: %i[show edit update]
  before_action :authenticate_user!, only: %i[edit update]
  before_action :authorize_user!, only: %i[edit update]

  def show; end

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@user), notice: 'Profile updated.'
    else
      render :edit
    end
  end

  private

  def set_user_and_profile
    @user = User.friendly.find(params[:id])
    @profile = @user.profile || @user.create_profile
  end

  def authorize_user!
    redirect_to profile_path(@user), alert: 'Not authorized.' unless current_user == @user
  end

  def profile_params
    params.require(:profile).permit(:bio, :avatar)
  end
end
