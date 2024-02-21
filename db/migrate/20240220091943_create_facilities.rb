class CreateFacilities < ActiveRecord::Migration[7.0]
  def change
    create_table :facilities do |t|
      t.belongs_to :account, null: false, foreign_key: true
      t.string :address
      t.string :city
      t.string :country
      t.string :description
      t.string :name
      t.string :phone_number
      t.string :postal_code
      t.string :province
      t.integer :status

      t.timestamps
    end
  end
end
