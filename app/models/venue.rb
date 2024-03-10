class Venue < ApplicationRecord
  belongs_to :facility
  belongs_to :venue_type, optional: true

  has_many :bookings, dependent: :destroy
end
