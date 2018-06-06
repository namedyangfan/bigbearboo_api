class ProductAttributePresenter < BasePresenter
  def basic_hash
    {
      product_attribute_id:    id,
      name: name,
      picture: picture
    }
  end

  def full_hash
    basic_hash.merge({
      quantity_owned: quantity_owned
    })
  end

end
