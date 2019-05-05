class CreatePriceProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :price_products do |t|
      t.references :product, foreign_key: true, index: true, null: false
      t.float :price, null: false
      t.datetime :price_date, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
