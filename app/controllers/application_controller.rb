class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  after_action :verify_authorized

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    '/offers'
  end
end
