class CreatePartInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :part_inventories do |t|
      t.string :description
      t.monetize :price, defualt: 0
      t.monetize :selling_price, defualt: 0
      t.string :brand_name
      t.integer :stock_count
      t.integer :trigger_limit

      t.timestamps
    end
  end
end
