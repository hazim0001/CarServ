class CreateInventoryRestocks < ActiveRecord::Migration[6.0]
  def change
    create_table :inventory_restocks do |t|
      t.references :part_supplier, null: false, foreign_key: true
      t.references :part_inventory, null: false, foreign_key: true
      t.integer :restock_count
      t.monetize :price_per_piece, default: 0

      t.timestamps
    end
  end
end
