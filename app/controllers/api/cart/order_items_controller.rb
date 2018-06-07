module Api
  module Cart
    class OrderItemsController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

      def create
        Rails.logger.debug params
        @order = current_order
        @order_item = @order.order_items.build(order_item_params)
        if(@order.save)
          render json: @order_item, status: 200
        else
          render json: {:errors => @order.errors.full_messages}, status: :unprocessable_entity
        end

      end

      def update
        @order = current_order
        @order_item = @order.order_items.find_by! id: params[:order_item_id]
        # @order_item.update_attributes(order_item_params)
        # @order_items = @order.order_items

        if @order_item.update order_item_params
          render json: @order_item
        else
          render json: { error: @order_item.errors.full_messages.to_sentence }, status: 403
        end
      end

      def destroy
        @order = current_order
        @order_item = @order.order_items.find_by! id: :params[:order_item_id]
        @order_items = @order.order_items

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