class CreateLabourJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :labour_jobs do |t|
      t.string :description
      t.monetize :cost, default: 0
      t.datetime :expected_time

      t.timestamps
    end
  end
end
