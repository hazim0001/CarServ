class CreateInventorySuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :inventory_suppliers do |t|
      t.references :part_supplier, null: false, foreign_key: true
      t.references :part_inventory, null: false, foreign_key: true
      t.string :grade

      t.timestamps
    end
  end
end
