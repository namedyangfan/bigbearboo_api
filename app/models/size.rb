class Size < ApplicationRecord
  belongs_to :category
  has_many :products, through: :product_sizes
end
