class UserProfilesController < ApplicationController
  def new
    @user_profile = User_Profile.new
    # authorize @user_profile
  end

  def create
    @user_profile = User_Profile.new(user_profile_params)
    @user_profile.user = current_user
    # authorize @user_profile

    if @user_profile.save
      redirect_to user_profile_path(@user_profile), notice: "User was successfully created."
    else
      render :new
    end
  end

  def show
  end

  def find
  end

  def edit
  end

  def destroy
  end

  private

  # need to add user_profile_params


end
