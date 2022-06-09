class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user_profile = current_user.user_profile
    @quote = motivational_quote
  end

  private

  def motivational_quote
    url = "https://type.fit/api/quotes"
    JSON.parse(URI.open(url).read).sample
  end
end
