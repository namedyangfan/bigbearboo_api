module Api
  module Auth
    class SessionsController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:create, :destroy]
      before_action :authenticate_current_user, only: [:destroy]

      def create
        user = User.find_by(email: params[:email].downcase)
        if user && user.authenticate(params[:password])
          user.remember
          render json: {:token => user.remember_token, :user_id => user.id}, status: 200
        else
          render json: {:error => 'Invalid email/password combination'}, status: :unprocessable_entity
        end
      end

      def destroy
        if @current_user.forget
          render json: {}, status: 200
        else
          render json: { errors: "Not authenticated" }, status: :unauthorized
        end
      end

    end
  end
end
