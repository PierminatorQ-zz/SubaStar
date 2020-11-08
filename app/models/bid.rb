class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :auction

  after_create_commit { BidBroadcastJob.perform_later self }
end
