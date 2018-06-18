module AuthenticationConcern
  extend ActiveSupport::Concern

  def authenticate_current_user
    render json: { errors: "Not authenticated" }, status: 401 unless current_user.present?
  end

  def current_user
    Rails.logger.debug('#######')
    Rails.logger.debug(params)
    Rails.logger.debug('$$$$$$')
    return @current_user if defined?(@current_user)
    token = params["token"]
    user = User.find_by! id: params["user_id"]
    if user && user.authenticated?(token)
      @current_user = user
    end
  end

  def check_admin_permission
    render json: { errors: "Require Admin Permission" }, status: :unauthorized unless current_user.role?(:admin)
  end

end
