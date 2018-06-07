module Api
  module Cart
    class OrdersController < ApplicationController

      def show
        if (current_order.present?)
          render json: @current_order
        end
      end

    end
  end
end