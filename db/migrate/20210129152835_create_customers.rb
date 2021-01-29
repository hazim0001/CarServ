class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name, null: false, default: ""
      t.string :phone_number, null: false, default: ""
      t.string :license_number, null: false, default: ""
      t.integer :age, defualt: 0
      t.string :occupation, null: false, default: ""

      t.timestamps
    end
  end
end
