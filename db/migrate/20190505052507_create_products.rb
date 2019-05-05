class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.references :product_type, foreign_key: true, index: true, null: false
      t.float :price, null: false
      t.integer :likes, default: 0
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :products, :deleted_at

  end
end
