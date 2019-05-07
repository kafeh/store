class CreateLikeProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :like_products do |t|
      t.references :product, foreign_key: true, index: true, null: false
      t.references :user, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
