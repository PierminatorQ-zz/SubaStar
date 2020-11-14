class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

 

  scope :only_active, ->(auction) { where(status: "active")}
  scope :filtered_by_user, ->(user) { where(user_id: user.id)}
end
