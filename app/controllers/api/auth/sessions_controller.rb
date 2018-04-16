module Api
  module Auth
    class SessionsController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:create]

      def create
        user = User.find_by(email: params[:email].downcase)
        if user && user.authenticate(params[:password])
          user.remember
          render json: user.remember_token, status: 200
        else
          render json: {:error => 'Invalid email/password combination'}, status: :unprocessable_entity
        end
      end

    end
  end
end
