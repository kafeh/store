class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true, null: false, index: true
      t.references :products, foreign_key: true, null: false, index: true
      t.integer :quantity, null: false
      t.float :total, null: false

      t.timestamps
    end
  end
end
