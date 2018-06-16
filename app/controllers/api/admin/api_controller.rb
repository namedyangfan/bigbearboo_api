module Api
  module Admin
    class ApiController < ApplicationController
      before_action :check_admin_permission
      before_action :authenticate_current_user
        
      def get_product
        if params[:product_attribute_id].present?
          @productAttribute = ProductAttribute.find_by! id: params[:product_attribute_id]
          @product = @productAttribute.product
        elsif params[:product_id].present?
          @product = Product.find_by! id: params[:product_id]
        else
          render_json_error 'Invalid parameters.', status: 400
        end
      end

    end
  end
end
