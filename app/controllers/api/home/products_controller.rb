module Api
  module Home
    class ProductsController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

      def index
        products = Product.all

        products_basic_hash = products.map{ |product| ProductPresenter.new(product, view_context).basic_hash}

        render json: products_basic_hash
      end  

    end
  end
end

