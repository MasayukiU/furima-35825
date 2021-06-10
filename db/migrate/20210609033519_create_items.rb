class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false 
      t.integer :price, null: false
      t.text :product_description, null: false
      t.references :user, foreign_key: true
      t.integer :category_id, null: false
      t.integer :item_condition_id, null: false
      t.integer :shipping_area_id, null: false
      t.integer :shipping_charge_id, null: false
      t.integer :estimated_time_id, null: false
      t.timestamps
    end
  end
end
