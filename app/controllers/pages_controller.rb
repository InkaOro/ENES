class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def results
    @questions = Question.all
  end

  def dashboard
    @user_profile = current_user.user_profile
  end
end
