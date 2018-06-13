module Api
  module Cart
    class OrderItemsController < ApiController
      skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

      def create
        Rails.logger.debug params
        @order = current_order
        Rails.logger.debug 'this is current order'
        Rails.logger.debug @order
        @order_item = @order.order_items.build(order_item_params)
        Rails.logger.debug 'ITEMS BUILD'
        if(@order.save)
          render json: @order.order_items, status: 200
        else
          Rails.logger.debug @order.errors.full_messages
          render json: {:errors => @order.errors.full_messages}, status: :unprocessable_entity
        end

      end

      def update
        @order = current_order # UPDATE CURRENT ORDER ONLY
        @order_item = @order.order_items.find_by! id: params[:order_item_id]
        # @order_items = @order.order_items Here is an idea of how all the item can be returned 
        # rather tha individual

        if @order_item.update order_item_params
          render json: @order_item
        else
          render json: { error: @order_item.errors.full_messages.to_sentence }, status: 403
        end
      end

      def destroy
        Rails.logger.debug params
        Rails.logger.debug 'PARAMS FOR DESTROY'

        @order = current_order
        @order_item = current_user.order_items.find_by! id: params[:order_item_id]
        @order_items = current_user.order_items

        if @order_item.destroy
          render json: @order_items, status: 200
        else
          render json: { error: @order_item.errors.full_messages.to_sentence }, status: 403
        end

      end
    private
      def order_item_params
        params.permit(:quantity, :product_id, :product_attribute_id)
      end
    end
  end
end