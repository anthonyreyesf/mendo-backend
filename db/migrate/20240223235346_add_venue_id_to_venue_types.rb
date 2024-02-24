class AddVenueIdToVenueTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :venue_types, :venue_id, :integer
  end
end
