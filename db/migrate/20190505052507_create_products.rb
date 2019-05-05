class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.references :product_types, foreign_key: true, index: true, null: false
      t.float :price, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
