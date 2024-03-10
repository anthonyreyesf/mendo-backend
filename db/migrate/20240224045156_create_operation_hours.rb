class CreateOperationHours < ActiveRecord::Migration[7.0]
  def change
    create_table :operation_hours do |t|
      t.references :facility, null: false, foreign_key: true
      t.integer :day_of_week
      t.time :opens_at
      t.time :closes_at

      t.timestamps
    end
  end
end
