class AddTenantToVenueType < ActiveRecord::Migration[7.0]
  def change
    add_reference :venue_types, :account, null: false, foreign_key: true
  end
end
