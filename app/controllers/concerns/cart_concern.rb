module CartConcern
  extend ActiveSupport::Concern

  def current_order
    return @current_order if defined?(@current_order)
    if !params[:order_id].nil?
      @current_order = Order.find_by!(id:params[:order_id])
    else
      @current_order = current_user.orders.create()
    end
  end

end
