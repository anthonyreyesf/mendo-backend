class CreateVenueTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :venue_types do |t|
      t.string :name
      t.references :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
