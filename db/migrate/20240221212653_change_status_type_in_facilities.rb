class ChangeStatusTypeInFacilities < ActiveRecord::Migration[7.0]
  def change
    change_column :facilities, :status, :string
  end
end
