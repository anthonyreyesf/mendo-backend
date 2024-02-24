class AddVenueTypeRefToVenues < ActiveRecord::Migration[7.0]
  def change
    add_reference :venues, :venue_type, null: true, foreign_key: true
  end
end
