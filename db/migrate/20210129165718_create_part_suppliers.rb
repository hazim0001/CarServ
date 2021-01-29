class CreatePartSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :part_suppliers do |t|
      t.string :vendor_name
      t.string :vendor_address
      t.string :vendor_number

      t.timestamps
    end
  end
end
