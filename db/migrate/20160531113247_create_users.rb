class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :signin_id, null: false
      t.string :password_digest, null: false
      t.boolean :admin, default: false, null: false
      t.string :remember_token, index: true

      t.timestamps null: false
    end
  end
end
