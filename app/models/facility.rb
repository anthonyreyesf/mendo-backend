class Facility < ApplicationRecord
  acts_as_tenant :account

  validates :address, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :province, presence: true
  validates :country, presence: true, acceptance: { accept: ['Canada', 'United States'] }
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :status, presence: true, acceptance: { accept: ['active', 'inactive'] }
  validates :account_id, presence: true
end
