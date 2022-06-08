class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:update]

  def new
    @user_profile = UserProfile.new
    # authorize @user_profile
  end

  def create
    @user_profile = UserProfile.new(user_profile_params)
    @user_profile.user = current_user

    subjects = [
      user_profile_params[:main_subject],
      user_profile_params[:specific_subject_a],
      user_profile_params[:specific_subject_b],
      user_profile_params[:optional_subject]
    ]

    if subjects.include? ''
      render :new
    else
      create_user_subjects(subjects)

      if @user_profile.save
        redirect_to dashboard_path, notice: "User was successfully created."
      else
        render :new
      end
    end
  end

  def edit
    @user_profile = current_user.user_profile
  end

  def update
    @user_profile.update(user_profile_params)
    redirect_to dashboard_path, notice: 'User profile was successfully updated.'

    UserSubject.where(user_id: current_user).destroy_all

    subjects = [
      user_profile_params[:main_subject],
      user_profile_params[:specific_subject_a],
      user_profile_params[:specific_subject_b],
      user_profile_params[:optional_subject]
    ]

    create_user_subjects(subjects)
  end

  private

  def create_user_subjects(subjects)
    subjects.each do |subject_id|
      subject = Subject.find(subject_id)
      UserSubject.find_or_create_by(subject: subject, user: current_user)
    end
  end

  def set_user_profile
    @user_profile = UserProfile.find(params[:id])
    # authorize @user_profile
  end

  def user_profile_params
    params.require(:user_profile).permit(:first_name, :last_name, :school_name,
                                         :school_year, :main_subject, :specific_subject_a,
                                         :specific_subject_b, :optional_subject, :photo)
  end
end
