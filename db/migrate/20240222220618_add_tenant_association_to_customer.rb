class AddTenantAssociationToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_reference :customers, :account, null: false, foreign_key: true
  end
end
