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
