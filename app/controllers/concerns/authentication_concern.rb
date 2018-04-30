module AuthenticationConcern
  extend ActiveSupport::Concern

  def authenticate_current_user
    render json: { errors: "Not authenticated" },
      status: :unauthorized unless current_user.present?
  end

  def current_user
    return @current_user if defined?(@current_user)
    token = params[:token]
    user = User.find_by(id: params[:user_id])
    if user && user.authenticated?(token)
      @current_user = user
    end
  end
end
