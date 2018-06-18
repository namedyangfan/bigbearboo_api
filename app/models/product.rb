class Product < ApplicationRecord
  extend SimplestStatus
  
  statuses :draft, :published, :archived

  has_many :product_attributes, dependent: :destroy
  has_many :order_items, dependent: :destroy

  belongs_to :category

  validates_uniqueness_of :name
  validates :name, presence: true
end
