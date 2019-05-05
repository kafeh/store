class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.references :products, foreign_key: true, index: true, null: false
      t.integer :quantity, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
