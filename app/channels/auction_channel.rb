class AuctionChannel < ApplicationCable::Channel
  def subscribed
     stream_from "auction_channel"
     
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def bidding(data)
    Bid.create! amount: data['bid'], auction_id: 2, user_id: current_user.id
  end
end
