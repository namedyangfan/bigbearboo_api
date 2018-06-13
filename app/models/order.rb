class Order < ApplicationRecord
  belongs_to :order_status, optional: :true
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  before_create :set_order_status
  before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

private

  def set_order_status
    Rails.logger.debug 'triggered before action'
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
