class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.text :place
      t.integer :overwork
      t.text :work
      t.text :probrem
      t.text :solution
      t.text :plan
      t.text :other

      t.timestamps null: false
    end
  end
end
