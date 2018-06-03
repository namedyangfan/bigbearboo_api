class ProductAttributePresenter < BasePresenter
  def basic_hash
    {
      id:    id,
      size:  size,
      color: color
    }
  end

  def full_hash
    basic_hash.merge({
      quantity_owned: quantity_owned
    })
  end

end
