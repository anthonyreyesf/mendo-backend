class Booking < ApplicationRecord
  belongs_to :venue
  belongs_to :customer

  attribute :date, :date
end
