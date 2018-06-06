module Api
  module Home
    class ProductsController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

      def index
        products = Product.all

        products_basic_hash = products.map{ |product| ProductPresenter.new(product, view_context).basic_hash}

        render json: products_basic_hash
      end 

      def show
        product = Product.find_by! id: params[:product_id]

        product_full_hash = ProductPresenter.new(product, view_context).full_hash_attributes

        render json: product_full_hash
      end  

      private

      def product_params
        params.permit(:product_id)
      end

    end
  end
end

