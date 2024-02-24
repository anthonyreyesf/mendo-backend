class RemoveVenueFromVenueTypes < ActiveRecord::Migration[7.0]
  def change
    remove_reference :venue_types, :venue, null: false, foreign_key: true
  end
end
