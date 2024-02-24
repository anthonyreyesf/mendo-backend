class Account < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :status, presence: true, length: { maximum: 50 }, acceptance: { accept: ['active', 'inactive', 'disabled', 'email_verification'] }
end
