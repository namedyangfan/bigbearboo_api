class ProductPresenter < BasePresenter
  def get_attributes
    @model.product_attributes.map{|product_attribute| ProductAttributePresenter.new(product_attribute,@view).full_hash}
  end

  def basic_hash
    {
      id:    id,
      name:  name,
      description: description,
      category: category,
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
    basic_hash.merge({
      attributes: get_attributes
    })
  end
end
