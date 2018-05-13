module Api
  module Admin
    class ApiController < ApplicationController
      def get_product
        if params[:product_attribute_id].present?
          @productAttribute = ProductAttribute.find_by! id: params[:product_attribute_id]
          @product = @productAttribute.product
        elsif params[:product_id].present?
          @product = Product.find_by! id: params[:product_id]
        end
      end
    end
  end
end
