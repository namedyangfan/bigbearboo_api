class ProductPresenter < BasePresenter
  def get_attributes
    @model.product_attributes.map{|product_attribute| ProductAttributePresenter.new(product_attribute,@view).full_hash}
  end

  def basic_hash
    {
      product_id: id,
      name: name,
      price: price,
      category: @model.category&.name,
      picture: picture
    }
  end

  def full_hash
    basic_hash.merge({
      detail: detail,
      price: price
    })
  end

  def full_hash_attributes
    full_hash.merge({
      attributes: get_attributes
    })
  end
end
