class CreatePartSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :part_suppliers do |t|
      t.string :vendor_name
      t.string :vendor_address
      t.string :vendor_number
      t.references :part_inventory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
