class Customer < ApplicationRecord
  acts_as_tenant :account
end
