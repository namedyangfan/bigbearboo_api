module Api
  module Auth
    class SessionsController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:create, :destroy]
      before_action :authenticate_current_user, only: [:authenticate, :destroy]

      def create
        user = User.find_by(email: params[:email].downcase)
        if user && user.authenticate(params[:password])
          user.remember
          render json: UserPresenter.new(user, view_context).auth_hash, status: 200
        else
          render json: {:error => 'Invalid email/password combination'}, status: :unprocessable_entity
        end
      end

      def destroy
        if @current_user.forget
          render json: { message: "log out success" }, status: 200
        else
          render json: { errors: "Not authenticated" }, status: :unauthorized
        end
      end

      def authenticate
        render json: UserPresenter.new(@current_user, view_context).basic_hash
      end
    end
  end
end
