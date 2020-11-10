class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :only_active, ->(auction) { where(status: "active")}
  scope :auction_by, ->(user) { where(user_id: user.id)}
end
