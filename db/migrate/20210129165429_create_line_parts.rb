class CreateLineParts < ActiveRecord::Migration[6.0]
  def change
    create_table :line_parts do |t|
      t.references :job, null: false, foreign_key: true
      t.references :part_inventory, null: false, foreign_key: true
      t.integer :quantity
      t.monetize :total_price_parts, default: 0

      t.timestamps
    end
  end
end
