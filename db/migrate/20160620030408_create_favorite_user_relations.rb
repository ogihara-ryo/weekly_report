class CreateFavoriteUserRelations < ActiveRecord::Migration
  def change
    create_table :favorite_user_relations do |t|
      t.integer :from_id
      t.integer :to_id
      t.boolean :favorite, default: false

      t.timestamps null: false
    end
  end
end
