class User < ApplicationRecord
  acts_as_tenant :account

  validates :account_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
