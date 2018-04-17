module Api
  module Auth
    class UsersController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:create]
      before_action :authenticate_current_user, only: [:show]

      def show
          render :json => @current_user
      end

      def create
        user = User.new(user_params)
        if user.save
          render :json => user.to_json
        else
          render :json => {:errors => user.errors.full_messages}
        end
      end

      private

        def user_params
          params.require(:registerParams).permit(:name, :email, :password, :password_confirmation, :registerParams)
        end

    end
  end
end
