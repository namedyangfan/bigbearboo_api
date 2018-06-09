module Api
  module Cart
    class OrdersController < ApiController
      skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy, :show]

      def show
        if (current_order.present?)
          render json: OrderPresenter.new(@current_order,view_context).full_hash
        end
      end

      def destroy
        @order = current_user.orders.find_by! id: order_item_params[:order_id]
        if @order.destroy
          render json: current_user.orders, status: 200
        else
          render json: { error: @order.errors.full_messages.to_sentence }, status: 403
        end
      end

      def update_cancelled
        @order = current_user.orders.find_by! id: order_item_params[:order_id]
        if @order.update order_status_id: 4
          render json: current_user.orders, status: 200
        else
          render json: { error: @order.errors.full_messages.to_sentence }, status: 403
        end
      end

    private
      def order_item_params
        params.permit(:quantity, :product_id, :product_attribute_id, :order_id)
      end

    end
  end
end