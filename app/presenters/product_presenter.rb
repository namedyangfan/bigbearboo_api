class ProductPresenter < BasePresenter
  def basic_hash
    {
      id:    id,
      name:  name,
      description: description,
      category: category,
      picture: picture
    }
  end

end
