class ChangeOperationHoursToUseStringForOpensAtAndClosesAt < ActiveRecord::Migration[7.0]
  def change
    change_column :operation_hours, :opens_at, :string
    change_column :operation_hours, :closes_at, :string
  end
end
