class ProductAttribute < ApplicationRecord
  belongs_to :product
  validates :quantity_owned, presence: true

end
