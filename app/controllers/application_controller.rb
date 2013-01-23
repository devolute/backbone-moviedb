class ApplicationController < ActionController::Base
  protect_from_forgery

  respond_to :json

  before_filter :set_current_user

  def set_current_user
    User.current_user = current_user
  end

end
