class SiteController < ApplicationController
  before_action :authorize_user, only: [:home, :update, :destroy]
  def home
  end

  def authorize_user
    redirect_to(user_session_path, alert: 'Your custom message here') unless user_signed_in?
  end
end
