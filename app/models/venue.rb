class Venue < ApplicationRecord
  belongs_to :facility
  belongs_to :venue_type
end
