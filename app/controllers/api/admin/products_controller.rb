module Api
  module Admin
    class ProductsController < ApiController
      before_action :get_product, only: [:update, :destroy]
      skip_before_action :verify_authenticity_token, only: [:create, :update]

      def index
        Rails.logger.debug "$$$$$$"
        Rails.logger.debug params
        Rails.logger.debug "$$$$$$"
        render json: Product.all
      end

      def create
        product = Product.new \
          name: product_params[:name],
          description: product_params[:description],
          detail: product_params[:detail],
          category: product_params[:category],
          picture: product_params[:picture]

        if product.save
          render json: product
        else
          render json: { error: product.errors.full_messages.to_sentence }, status: 403
        end
      end

      def update
        Rails.logger.debug product_params
        if @product.update product_params
          render json: @product
        else
          render json: { error: @product.errors.full_messages.to_sentence }, status: 403
        end
      end

      def destroy
      end

      private

      def product_params
        params.permit(:name, :description, :detail, :category, :picture)
      end

    end
  end
end

