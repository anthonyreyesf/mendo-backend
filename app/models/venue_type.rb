class VenueType < ApplicationRecord
  acts_as_tenant :account

  has_many :venues
end
