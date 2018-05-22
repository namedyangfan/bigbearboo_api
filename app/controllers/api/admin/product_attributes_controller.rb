module Api
  module Admin
    class ProductAttributesController < ApiController
      before_action :get_product, only: [:show, :create, :update, :destroy]
      skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

      def show
        Rails.logger.debug "$$$$$$"
        Rails.logger.debug params
        Rails.logger.debug "$$$$$$"
        render json: @productAttribute
      end

      def create
        @productAttribute = @product.product_attributes.build \
          size: product_attribute_params[:size],
          color: product_attribute_params[:color],
          quantity_owned: product_attribute_params[:quantity_owned],
          quantity_on_hand: product_attribute_params[:quantity_owned],
          quantity_picked: 0

        if @productAttribute.save
          render json: @productAttribute
        else
          render json: { error: @product.errors.full_messages.to_sentence }, status: 403
        end
      end

      def update
        update_hash = product_attribute_params.merge!({
          :quantity_on_hand => product_attribute_params[:quantity_owned]
          })

        if @productAttribute.update update_hash
          render json: @productAttribute
        else
          render json: { error: @productAttribute.errors.full_messages.to_sentence }, status: 403
        end
      end

      def destroy
        if @productAttribute.destroy
          head :no_content
        else
          render json: { error: @productAttribute.errors.full_messages.to_sentence }, status: 403
        end
      end

      private

      def product_attribute_params
        params.permit(:size, :color, :quantity_owned)
      end

    end
  end
end

