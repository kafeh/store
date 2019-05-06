class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true, null: false, index: true
      t.float :total, null: false
      t.datetime :deleted_at
      t.integer :status, default: 0, null: false

      t.timestamps
    end

    add_index :orders, :deleted_at

  end
end
