class AddHourlyRateToVenue < ActiveRecord::Migration[7.0]
  def change
    add_column :venues, :hourly_rate, :decimal
  end
end
