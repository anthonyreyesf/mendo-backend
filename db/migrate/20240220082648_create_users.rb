class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.belongs_to :account, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
