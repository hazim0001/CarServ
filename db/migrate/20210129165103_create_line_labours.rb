class CreateLineLabours < ActiveRecord::Migration[6.0]
  def change
    create_table :line_labours do |t|
      t.references :job, null: false, foreign_key: true
      t.references :labour_job, null: false, foreign_key: true
      t.references :mechanic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
