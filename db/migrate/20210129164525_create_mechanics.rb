class CreateMechanics < ActiveRecord::Migration[6.0]
  def change
    create_table :mechanics do |t|
      t.string :name, default: ""
      t.monetize :salary, default: 0
      t.string :national_id_number, default: ""

      t.timestamps
    end
  end
end
