class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :admins, :deleted_at

  end
end
