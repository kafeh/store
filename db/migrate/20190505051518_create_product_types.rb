class CreateProductTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :product_types do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :deleted_at

      t.timestamps
    end
		
		add_index :product_types, :deleted_at
  
  end
end
