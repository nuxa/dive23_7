class CreateContributes < ActiveRecord::Migration
  def change
    create_table :contributes do |t|
      t.references :user,   index: true, foreign_key: true
      t.integer :point_q
      t.integer :point_a

      t.timestamps null: false
    end
  end
end
