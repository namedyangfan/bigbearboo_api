class OrderPresenter < BasePresenter
  def order_item
    @items = @model.order_items.map{ |item| OrderItemPresenter.new(item, @view)}
  end

  def basic_hash
    {
      order_id: id,
      subtotal: subtotal,
    }
  end

  def full_hash
    {
      order_id: id,
      subtotal: subtotal,
      order_items: order_item.try(:map,&:full_hash)
    }
  end

end
