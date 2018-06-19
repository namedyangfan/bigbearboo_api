class ProductPresenter < BasePresenter
  def get_attributes
    @model.product_attributes.map{|product_attribute| ProductAttributePresenter.new(product_attribute,@view).full_hash}
  end

  def get_sizes
    # value and label is reqired by react-dropdown to display options
    @model.category.sizes.map{|s| {:value => s.id, :label=> s.name}}
  end

  def simple_hash
    {
      product_id: id,
      name: name,
      price: price,
      status: status_label,
      category: @model.category&.name,
      picture: picture,
    }
  end

  def basic_hash
    simple_hash.merge({
      sizes: get_sizes
    })
  end

  def full_hash
    basic_hash.merge({
      detail: detail,
    })
  end

  def full_hash_attributes
    full_hash.merge({
      attributes: get_attributes
    })
  end
end
