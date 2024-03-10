class Customer < ApplicationRecord
  acts_as_tenant :account
  
  has_many :bookings, dependent: :destroy
end
