class OrderAuction < ApplicationRecord
  belongs_to :order
  belongs_to :auction
end
