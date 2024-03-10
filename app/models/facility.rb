class Facility < ApplicationRecord
  acts_as_tenant :account

  has_many :operation_hours, dependent: :destroy

  validates :address, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :province, presence: true
  validates :country, presence: true, acceptance: { accept: ['Canada', 'United States'] }
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :status, presence: true, acceptance: { accept: ['active', 'inactive'] }
  validates :account_id, presence: true

  after_create :create_default_business_hours

  private

  def create_default_business_hours
    # Create default business hours for each day of the week
    (1..7).each do |day|
      OperationHour.create(facility_id: id, day_of_week: day, opens_at: "09:00", closes_at: "23:00")
    end
  end
end
