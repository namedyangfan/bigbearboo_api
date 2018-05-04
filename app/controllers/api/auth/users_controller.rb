module Api
  module Auth
    class UsersController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:create]
      before_action :authenticate_current_user, only: [:show]

      def show
          render json: UserPresenter.new(@current_user, view_context).basic_hash
      end

      def create
        user = User.new(user_params)
        if user.save
          user.remember
          render json: UserPresenter.new(user, view_context).auth_hash, status: 200
        else
          Rails.logger.debug user.errors.full_messages
          render json: {:errors => user.errors.full_messages}, status: :unprocessable_entity
        end
      end

      private

        def user_params
          params.require(:registerParams).permit(:name, :email, :password, :password_confirmation, :registerParams)
        end

    end
  end
end
