module Api
  module Auth
    class UsersController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:create]

      def index
        render :json => {"name": "Naonao", "age": 5.5}
      end

      def show
        user = User.find(params[:id])
        render :json => user
      end

      # def create
      #   render :json => {"name": params}
      # end

      def create
        user = User.new(user_params)
        if user.save
          render :json => {"name": "Naonao", "age": 5.5}
        else
          render :json => {"name": "Naonao", "age": 5.5}
        end
      end

      private

        def user_params
          params.permit(:name, :email, :password, :password_confirmation)
        end

    end
  end
end
