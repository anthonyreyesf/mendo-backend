class AddDefaultHourlyRateToVenues < ActiveRecord::Migration[7.0]
  def change
    change_column_default :venues, :hourly_rate, from: nil, to: 0.00
  end
end
