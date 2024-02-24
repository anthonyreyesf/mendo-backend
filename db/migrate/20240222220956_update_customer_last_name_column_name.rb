class UpdateCustomerLastNameColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :customers, :last_name_string, :last_name
  end
end
