class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.belongs_to :facility, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
