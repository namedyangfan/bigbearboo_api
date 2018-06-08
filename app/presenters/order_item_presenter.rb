class OrderItemPresenter < BasePresenter
  def product
    ProductPresenter.new(@model, @view)
  end

  def product_attribute
    if !@model.product_attribute.nil?
      @product_attribute = ProductAttributePresenter.new(@model.product_attribute, @view).basic_hash
    end
    @product_attribute ||= [] 
  end

  def basic_hash
    {
      order_item_id: id,
      product_id: id,
      unit_price: unit_price,
      quantity: quantity
    }
  end

  def full_hash
    basic_hash.merge({
      product_name: @model.product.name,
      product_picture: @model.product.picture,
      product_price: @model.product.price,
      product_attributes: product_attribute
    })
  end
end
