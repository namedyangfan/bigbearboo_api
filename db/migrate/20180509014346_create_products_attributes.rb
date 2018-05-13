class CreateProductsAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.text :detail
      t.integer :category
      t.string :picture

      t.timestamps
    end

    create_table :product_attributes do |t|
      t.belongs_to :product, index: true
      t.float :size
      t.string :color
      t.integer :quantity_owned
      t.integer :quantity_on_hand
      t.integer :quantity_picked

      t.timestamps
    end
  end
end
