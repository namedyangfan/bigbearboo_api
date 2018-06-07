module CartConcern
  extend ActiveSupport::Concern

  def current_order
    return @current_order if defined?(@current_order)
    if !get_current_order.nil?
      Rails.logger.debug 'EXISITING ORDER USED'
      Rails.logger.debug get_current_order
      @current_order
    else
      Rails.logger.debug 'CREATE NEW ORDER'
      @current_order = current_user.orders.create()
    end
  end
  
  private
  def get_current_order
    @current_order = current_user.orders.where(:order_status_id => 1).order(:created_at).last
  end
end
