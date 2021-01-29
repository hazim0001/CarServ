class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.string :car_model, null: false, default: ""
      t.string :mileage, null: false, default: 0
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
