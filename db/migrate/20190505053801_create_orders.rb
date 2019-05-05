class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :users, foreign_key: true, null: false, index: true
      t.datetime :order_date, null: false
      t.float :total, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
