class AddSizeToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_items, :size, foreign_key: true
  end
end