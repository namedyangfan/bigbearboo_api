class OrderPresenter < BasePresenter
  def order_item
    @items = @model.order_items.map{ |item| OrderItemPresenter.new(item, @view)}
  end

  def basic_hash
    {
      order_id: id,
      subtotal: subtotal,
      tax: tax,
      shipping: shipping,
      total: @view.number_with_precision(total, :precision => 2),
    }
  end

  def full_hash
    basic_hash.merge({
      order_items: order_item.try(:map,&:full_hash)
    })
  end

end
