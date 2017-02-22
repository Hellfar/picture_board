class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  # after_action :verify_authorized

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    '/offers'
  end

  def user_not_authorized
    errors = ActiveModel::Errors.new(nil)
    errors.add(:app, I18n.t('errors.not_authorized'))
    render json: errors, status: :forbidden and return
  end

  def request_formed_unproperly
    errors = ActiveModel::Errors.new(nil)
    errors.add(:app, I18n.t('errors.bad_request'))
    render json: errors, status: :bad_request and return
  end
end
