class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:update]


  def new
    @user_profile = UserProfile.new
    # authorize @user_profile
  end

  def create
    @user_profile = UserProfile.new(user_profile_params)
    @user_profile.user = current_user
    # authorize @user_profile

    if @user_profile.save
      redirect_to dashboard_path, notice: "User was successfully created."
    else
      render :new
    end
  end

  def edit
   @user_profile = current_user.user_profile
  end

  def update
    @user_profile.update(user_profile_params)
    redirect_to dashboard_path, notice: 'User profile was successfully updated.'
  end

  private

  def set_user_profile
    @user_profile = UserProfile.find(params[:id])
    # authorize @user_profile
  end

  def user_profile_params
    params.require(:user_profile).permit(:first_name, :last_name, :school_name, :school_year, :program)
  end
end
