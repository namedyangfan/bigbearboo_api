class Product < ApplicationRecord
  has_many :product_attributes, dependent: :destroy
  validates_uniqueness_of :name
  validates :name, presence: true
end
