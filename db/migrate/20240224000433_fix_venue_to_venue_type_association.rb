class FixVenueToVenueTypeAssociation < ActiveRecord::Migration[7.0]
  def change
    remove_column :venue_types, :venue_id, :integer
  end
end
