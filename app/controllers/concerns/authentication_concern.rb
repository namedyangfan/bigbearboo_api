module AuthenticationConcern
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  def authenticate_current_user
    render json: { errors: "Not authenticated" },
            status: :unauthorized unless current_user.present?
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user ||= User.find_by(remember_digest: request.headers['Authorization'])

  end
