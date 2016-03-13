class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :phone_number
      t.string :address
      t.integer :quantity
      t.references :food_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
